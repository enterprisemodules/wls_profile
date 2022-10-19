#
define wls_profile::weblogic::private::start_managed_servers (
  String[1]           $schedule_name,
  Stdlib::Absolutepath
  $domains_dir,
  Stdlib::Absolutepath
  $weblogic_home,
  Stdlib::Absolutepath
  $middleware_home,
  Stdlib::Absolutepath
  $jdk_home,
  String[1]           $os_user,
  String[1]           $os_group,
  String[1]           $weblogic_user,
  Easy_type::Password $weblogic_password,
  Integer             $adminserver_port,
  Integer             $nodemanager_port,
  String[1]           $adminserver_address,
  Boolean             $jsse_enabled,
  Boolean             $custom_trust,
  Integer             $wait_for_nodemanager,
  Optional[String[1]] $trust_keystore_file = undef,
  Variant[Boolean,Enum['on_failure']]
  $logoutput = lookup({ name => 'logoutput', default_value => 'on_failure' }),
) {
  $domain = $title
  echo { "Restarting AdminServer, nodemanager and managed servers in domain ${domain}":
    withpath => false,
    schedule => $schedule_name,
  }

  if $custom_trust {
    $trust_keystore_passphrase = lookup('wls_profile::basic_domain::wls_domain::trust_keystore_passphrase', Easy_type::Password)
  } else {
    $trust_keystore_passphrase = undef
  }

  case $facts['kernel'] {
    'AIX': {
      $netstat_statement = "/bin/netstat -an | /bin/grep LISTEN | /bin/grep '.${nodemanager_port}'"
    }
    'Linux': {
      $netstat_statement = "/bin/netstat -lnt | /bin/grep ':${nodemanager_port}'"
    }
    'SunOS': {
      $netstat_statement = "/bin/netstat -an -P tcp | /bin/grep LISTEN | /bin/grep '.${nodemanager_port}'"
    }
    default: {
      fail("Unrecognized operating system ${facts['kernel']}, please use it on a Linux or Solaris host")
    }
  }

  $start_managed_servers = @(WLST:python)
    fileWithStoppedServers = open("/tmp/stopped_servers", "r")
    stoppedServers = fileWithStoppedServers.readlines()
    stoppedServers = map(lambda s: s.strip(), stoppedServers)
    fileWithStoppedServers.close()

    cd('/')
    appServers = cmo.getServers()
    domainRuntime()

    for appServer in appServers:
        name = str(appServer.getName())
        print "Processing server " + name
        if name in stoppedServers:
            try:
                cd('domainRuntime:/ServerLifeCycleRuntimes/' + name)
                status = cmo.getState()
                if status != 'RUNNING':
                    print "Starting server " + name
                    cmo.start()
                    print 'Started Server: ' + name
            except:
                print 'Error when starting ' + name + ' please see the logs.'
        else:
            print 'skipping managed server ' + name + ' because it was not stopped by us before.'
    print 'All servers previously stopped, are now started again.'
    |WLST

  exec { "Starting nodemanager ${title} after patching":
    command  => "/usr/bin/systemctl restart nodemanager_${domain}",
    schedule => $schedule_name,
  }

  -> sleep { "Wait for nodemanager on domain ${domain}":
    bedtime       => $wait_for_nodemanager,
    wakeupfor     => $netstat_statement,
    dozetime      => 2,
    failontimeout => true,
  }

  $ip_addresses = $facts['networking']['interfaces'].keys.map |$interface| {
    if $facts['networking']['interfaces'][$interface]['bindings'] != undef {
      $facts['networking']['interfaces'][$interface]['bindings'].map |$entry| { $entry['address'] }
    }
  }.flatten

  if easy_type::dnslookup($adminserver_address)[0] in $ip_addresses {
    wls_install::control { "start_adminserver_${domain}_after_patches":
      wls_domains_dir           => $domains_dir,
      action                    => 'start',
      weblogic_home_dir         => $weblogic_home,
      middleware_home_dir       => $middleware_home,
      download_dir              => '/tmp',
      jdk_home_dir              => $jdk_home,
      os_user                   => $os_user,
      os_group                  => $os_group,
      domain_name               => $domain,
      weblogic_user             => $weblogic_user,
      weblogic_password         => $weblogic_password,
      adminserver_address       => $adminserver_address,
      adminserver_port          => $adminserver_port,
      jsse_enabled              => $jsse_enabled,
      custom_trust              => $custom_trust,
      trust_keystore_file       => $trust_keystore_file,
      trust_keystore_passphrase => $trust_keystore_passphrase,
      schedule                  => $schedule_name,
      require                   => Sleep["Wait for nodemanager on domain ${domain}"],
      before                    => Wls_exec["${domain}/@/tmp/start_managed_servers_for_${domain}.py"],
    }
  }

  file { "/tmp/start_managed_servers_for_${domain}.py":
    ensure   => 'file',
    content  => $start_managed_servers,
    schedule => $schedule_name,
  }

  -> wls_exec { "${domain}/@/tmp/start_managed_servers_for_${domain}.py":
    schedule            => $schedule_name,
    disable_autorequire => true,
    logoutput           => $logoutput,
  }

  -> exec { "cleanup startscript ${domain}":
    command   => "/bin/rm -f /tmp/start_managed_servers_for_${domain}.py",
    schedule  => $schedule_name,
    logoutput => $logoutput,
  }
}
