#
define wls_profile::weblogic::private::stop_managed_servers (
  String[1]                           $schedule_name,
  Variant[Boolean,Enum['on_failure']] $logoutput = lookup( { name => 'logoutput', default_value => 'on_failure' }),
) {
  $domain = $title

  echo { "Stopping AdminServer, nodemanager and managed servers in domain ${domain}":
    withpath => false,
    schedule => $schedule_name,
  }

  $ip_addresses = $facts['networking']['interfaces'].keys.map |$interface| {
    if $facts['networking']['interfaces'][$interface]['bindings'] != undef {
      $facts['networking']['interfaces'][$interface]['bindings'].map |$entry| { $entry['address'] }
    }
  }.flatten

  $stop_managed_servers = @(WLST:python)
    <%- |
      Array   $ip_addresses,
    | -%>
    import socket

    adminServerName = cmo.getAdminServerName()
    print "Current admin server is: " + adminServerName
    appServers = cmo.getServers()
    stoppedServers = []
    domainRuntime()
    stopAdminServer = False

    for appServer in appServers:
        try:
            name = str(appServer.getName())
            ip_addresses_on_current_node = <%= $ip_addresses.map |$e| { "'${e}'" } %>
            listener = str(appServer.getListenAddress())
            ip = socket.gethostbyname(listener)
            print "IP address is :" + ip

            if ip not in ip_addresses_on_current_node:
                print "Skipping server " + name + " because it is not listening on this node."
                continue

            if name == adminServerName:
                print "Skipping server " + adminServerName + " for now because it is the admin server."
                print "We will stop " + adminServerName + " after all other servers are stopped."
                stopAdminServer = True
                continue

            cd('domainRuntime:/ServerLifeCycleRuntimes/' + name)
            print "Processing server " + name
            status = cmo.getState()
            if status != 'SHUTDOWN':
                cmo.forceShutdown()
                print 'Stopped Server: ' + str(appServer.getName())
                stoppedServers.append(name)
        except:
            print 'Error when stopping ' + str(appServer.getName()) + ' please see the logs.'

    try:
        if stopAdminServer:
          shutdown(adminServerName)
          print 'Stopped Server: ' + adminServerName
    except:
        print 'Error when stopping ' + adminServerName + ' please see the logs.'


    stoppedServerFile = open('/tmp/stopped_servers', 'w')
    for server in stoppedServers:
        print >>stoppedServerFile, server

    stoppedServerFile.close()

    print 'All local managed servers stopped'
    |WLST

  file { "/tmp/stop_managed_servers_for_${domain}.py":
    ensure       => 'file',
    schedule     => $schedule_name,
    content      => inline_epp($stop_managed_servers,
    ip_addresses => $ip_addresses),
  }

  -> wls_exec { "${domain}/@/tmp/stop_managed_servers_for_${domain}.py":
    schedule            => $schedule_name,
    disable_autorequire => true,
    logoutput           => $logoutput,
  }

  -> exec { "cleanup stopscript ${domain}":
    command  => "/bin/rm -f /tmp/stop_managed_servers_for_${domain}.py",
    schedule => $schedule_name,
  }

  -> exec { "Stop nodemanager for ${domain}":
    command   => "/usr/bin/systemctl stop nodemanager_${domain}",
    schedule  => $schedule_name,
    logoutput => $logoutput,
  }

  -> wls_daemon { $domain:
    ensure => 'absent',
  }
}
