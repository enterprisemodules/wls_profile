#
# wls_profile::admin_server::wls_cluster
#
# @summary This class is the default implementation for creating a WebLogic cluster on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin_server](./admin_server.html) for an explanation on how to do this.
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
#
# @param [String[1]] cluster_name
#    The name to use for the cluster.
#    The change the domain name, use the hiera key: `wls_profile::cluster_name`. This will make sure the correct domain name gets used in all classes.
#    Default value is: `main`
#
# @param [Hash] servers
#    A Hash of machine-servers defining all servers that need to be part of the cluster.
#    The default implementations reads these values from the hiera key `wls_profile::admin_server::wls_servers::servers`
#
# @param [Hash] cluster_defaults
#    A Hash of default values used when creating a `wls_cluster` resource.
#    The default value is:
#    ```yaml
#    wls_profile::admin_server::wls_cluster::cluster_defaults:
#      messagingmode:  unicast
#      migrationbasis: consensus
#    ```
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
