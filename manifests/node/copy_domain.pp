# wls_profile::node::copy_domain
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::node::copy_domain
class wls_profile::node::copy_domain(
  String[1] $domain_name,
  Wls_install::Versions
            $version,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $log_dir,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $jdk_home,
  Stdlib::Absolutepath
            $domains_dir,
  String[1] $os_user,
  String[1] $os_group,
  String[1] $adminserver_address,
  Integer   $adminserver_port,
  String[1] $nodemanager_address,
  Integer   $nodemanager_wait,
  String[1] $weblogic_user,
  String[1] $weblogic_password,
) {
  echo {"WebLogic copy domain ${domain_name} from ${adminserver_address}:${domains_dir}/${domain_name}":
    withpath => false,
  }

  wls_install::copydomain{$domain_name:
    domain_name         => $domain_name,
    version             => $version,
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    jdk_home_dir        => $jdk_home,
    wls_domains_dir     => $domains_dir,
    os_user             => $os_user,
    os_group            => $os_group,
    download_dir        => '/tmp',
    log_dir             => '/var/log/weblogic',
    use_ssh             => true,
    domain_pack_dir     => "${domains_dir}/${domain_name}",
    adminserver_address => $adminserver_address,
    adminserver_port    => $adminserver_port,
    weblogic_user       => $weblogic_user,
    weblogic_password   => $weblogic_password,
  }
  #
  # Over here you define the nodemanager. Here you can specify the address
  # the nodemanager is running on and the listen address. When you create multiple domains
  # with multiple nodemanagers, you have to specify different addresses and/or ports.
  #
  -> wls_install::nodemanager{"nodemanager for ${domain_name}":
    domain_name         => $domain_name,
    version             => $version,
    log_dir             => $log_dir,
    nodemanager_address => $nodemanager_address,
    os_user             => $os_user,
    os_group            => $os_group,
    sleep               => $nodemanager_wait,
  }


}
