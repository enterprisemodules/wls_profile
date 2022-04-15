#
# wls_profile::admin_server::wls_cluster
#
# @summary This class is the default implementation for creating a WebLogic cluster on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin_server](./admin_server.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::admin_server::wls_cluster (
  Hash      $cluster_defaults,
  String[1] $cluster_name,
  String[1] $domain_name,
  Hash      $servers            = $wls_profile::servers
) inherits wls_profile {
  $server_array = $servers.keys
  echo { "WebLogic cluster ${cluster_name} with servers ${server_array.join(',')}":
    withpath => false,
  }
  wls_cluster { "${domain_name}/${cluster_name}":
    ensure  => 'present',
    servers => $server_array,
    *       => $cluster_defaults,
  }
}
