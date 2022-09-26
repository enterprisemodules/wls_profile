#
# wls_profile::admin_server::wls_servers
#
# @summary This class makes sure all te required WebLogic machines and servers are defined on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
#
# @param [Hash] servers
#    
#
# @param [Hash] server_defaults
#    
#
# @param [Hash] machine_defaults
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
