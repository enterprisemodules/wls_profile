# wls_profile::admin_server::wls_cluster
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::admin_server::wls_cluster
class wls_profile::admin_server::wls_cluster(
  String[1] $domain_name,
  String[1] $cluster_name,
  Hash      $servers,
  Hash      $cluster_defaults,
) {
  $server_array = $servers.keys
  echo {"WebLogic cluster ${cluster_name} with servers ${server_array.join(',')}":
    withpath => false,
  }
  wls_cluster{"${domain_name}/${cluster_name}":
    ensure  => 'present',
    servers => $server_array,
    *       => $cluster_defaults,
  }

}
