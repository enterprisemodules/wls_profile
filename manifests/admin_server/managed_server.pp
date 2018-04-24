#
# == Define: wls_profile::admin_server::cluster_node
#
# Create's a machine and a managed server for all specified nodes
#
#
define wls_profile::admin_server::managed_server(
  String[1] $machine_name,
  String[1] $listenaddress,
  String[1] $domain_name,
  Array     $server_arguments,
  Hash      $server_defaults,
  Hash      $machine_defaults,
)
{
  wls_machine { "${domain_name}/${machine_name}":
    ensure        => 'present',
    listenaddress => $listenaddress,
    *             => $machine_defaults,
  }

  wls_install::managed_server{ $title:
    domain           => $domain_name,
    machine          => $machine_name,
    listenaddress    => $listenaddress,
    server_arguments => $server_arguments,
    *                => $server_defaults
  }
}
