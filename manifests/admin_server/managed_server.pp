#
# wls_profile::admin_server::managed_server
#
# @summary This defined type is the default implementation for defining a managed server in your WebLogic domain.
# It is called once for every machine server combination you passed to `wls_profile::admin_server::wls_servers`.
# 
# Using hiera, you can customize some of the aspects of this process.
#
# @param [String[1]] machine_name
#    
#    The machine name to create for this managed server
#
# @param [String[1]] listenaddress
#    
#    The listen address for the managed server
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
#
# @param [Array] server_arguments
#    An Array containing the server startup arguments.
#    Default value is : `[]`
#
# @param [Hash] server_defaults
#    a Hash describing the defauls to use when creating WebLogic servers.
#    Default value : `{}`
#
# @param [Hash] machine_defaults
#    a Hash describing the defauls to use when creating WebLogic machines.
#    Default value : `{}`
#
#
# See the file "LICENSE" for the full license governing this code.
#
define wls_profile::admin_server::managed_server (
  String[1]            $machine_name,
  String[1]            $listenaddress,
  String[1]            $domain_name,
  Array                $server_arguments,
  Hash                 $server_defaults,
  Hash                 $machine_defaults,
  Stdlib::Absolutepath $log_dir = lookup('wls_profile::log_dir'),
){
  wls_machine { "${domain_name}/${machine_name}":
    ensure        => 'present',
    listenaddress => $listenaddress,
    *             => $machine_defaults,
  }

  wls_install::managed_server { $title:
    domain           => $domain_name,
    machine          => $machine_name,
    listenaddress    => $listenaddress,
    server_arguments => $server_arguments,
    wls_log_dir      => $log_dir,
    *                => $server_defaults,
  }
}
