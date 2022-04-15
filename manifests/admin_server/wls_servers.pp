#
# wls_profile::admin_server::wls_servers
#
# @summary This class makes sure all te required WebLogic machines and servers are defined on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
#    
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::admin_server::wls_servers (
  String[1] $domain_name,
  Hash      $machine_defaults,
  Hash      $server_defaults,
  Hash      $servers            = $wls_profile::servers
) inherits wls_profile {
  echo { "WebLogic servers ${servers.keys.join(',')}":
    withpath => false,
  }
  $defaults = {
    domain_name      => $domain_name,
    # server_defaults  => merge($server_defaults, {ensure => 'present'}),
    # machine_defaults => merge($machine_defaults, {ensure => 'present'}),
    server_defaults  => $server_defaults,
    machine_defaults => $machine_defaults,
  }
  create_resources(wls_profile::admin_server::managed_server, $servers, $defaults)
}
