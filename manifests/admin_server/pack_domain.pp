# wls_profile::admin_server::pack_domain
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::admin_server::pack_domain
class wls_profile::admin_server::pack_domain(
  String[1] $domain_name,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $jdk_home,
  Stdlib::Absolutepath
            $domains_dir,
  String[1] $os_user,
  String[1] $os_group,
) inherits wls_profile {
  echo {"WebLogic pack domain ${domain_name}":
    withpath => false,
  }
  #
  # This resource definition pack's the current definition of the domain. This packed domain file
  # can be used by other nodes in the cluster. They fetch it, unpack it and use it to enter the domain.
  # When the node is part of the domain, the packed file loses its value. Any changes in the domain are managed
  # by webLogic.
  #
  wls_install::packdomain{$domain_name:
    domain_name         => $domain_name,
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    jdk_home_dir        => $jdk_home,
    wls_domains_dir     => $domains_dir,
    os_user             => $os_user,
    os_group            => $os_group,
    download_dir        => "${domains_dir}/${domain_name}",
  }

}
