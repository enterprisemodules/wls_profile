#
define wls_profile::weblogic::private::stop_domain(
  String[1]                           $schedule_name,
  Variant[Boolean,Enum['on_failure']] $logoutput = lookup({name => 'logoutput', default_value => 'on_failure'}),
)
{
  $domain = $title

  echo {"Stopping AdminServer, nodemanager and managed servers in domain ${domain}":
    withpath => false,
    schedule => $schedule_name,
  }

  $stop_managed_servers = @(WLST:python)
    adminServerName = cmo.getAdminServerName()
    print "Current admin server is: " + adminServerName
    appServers = cmo.getServers()
    stoppedServers = []
    domainRuntime()

    for appServer in appServers:
        try:
            name = str(appServer.getName())
            if name == adminServerName:
                print "Skipping server " + adminServerName + " because it is the admin server."
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
        shutdown(adminServerName)
        print 'Stopped Server: ' + adminServerName
    except:
        print 'Error when stopping ' + adminServerName + ' please see the logs.'


    stoppedServerFile = open('/tmp/stopped_servers', 'w')
    for server in stoppedServers:
        print >>stoppedServerFile, server

    stoppedServerFile.close()

    print 'All servers stopped'
    |WLST

  file {"/tmp/stop_managed_servers_for_${domain}.py":
    ensure   => 'present',
    content  => $stop_managed_servers,
    schedule => $schedule_name,
  }

  -> wls_exec {"${domain}/@/tmp/stop_managed_servers_for_${domain}.py":
    schedule            => $schedule_name,
    disable_autorequire => true,
    logoutput           => $logoutput,
  }

  -> exec {"cleanup stopscript ${domain}":
    command  => "/bin/rm -f /tmp/stop_managed_servers_for_${domain}.py",
    schedule => $schedule_name,
  }

  -> wls_daemon { $domain:
    ensure => 'absent',
  }
}
