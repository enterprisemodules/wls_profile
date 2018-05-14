# wls_profile::admin_server::wls_servers
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::admin_server::wls_servers
class wls_profile::admin_server::wls_servers(
  String[1] $domain_name,
  Hash      $server_defaults,
  Hash      $machine_defaults,
  Hash      $servers            = $wls_profile::servers,
) inherits wls_profile {
  echo {"WebLogic servers ${servers.keys.join(',')}":
    withpath => false
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
