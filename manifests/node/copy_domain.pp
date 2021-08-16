#
# wls_profile::node::copy_domain
#
# @summary This class is the default implementation to copy the packed domain from the Admin Server, unpack it on the current machine and start the nodemanager.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::node](./node.html) for an explanation on how to do this.
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
#
# @param [Wls_install::Versions] version
#    The version of WebLogic you want to use.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::version` to change it to your requested value.
#    Valid values are:
#      - `1036`
#      - `1111`
#      - `1112`
#      - `1211`
#      - `1212`
#      - `1213`
#      - `1221`
#      - `12211`
#      - `12212`
#      - `12213`
#      - `12214`
#    Default value: `12213`
#
# @param [Stdlib::Absolutepath] weblogic_home
#    The directory used as WebLogic home
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12/wlserver`
#
# @param [Stdlib::Absolutepath] log_dir
#    The directory used for log files.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.
#    Default value: `/opt/oracle/domains/log`
#
# @param [Stdlib::Absolutepath] middleware_home
#    The Oracle middleware home directory.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12`
#
# @param [Stdlib::Absolutepath] jdk_home
#    The location where the JDK is installed.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.
#    The default value is: `/usr/java/jdk1.8.0_152`
#
# @param [Stdlib::Absolutepath] domains_dir
#    The top-level directory where the domain directories will reside in.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.
#    The default value is:  `/opt/oracle/domains`
#
# @param [String[1]] os_user
#    The os user to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.
#    Default value: `oracle`
#
# @param [String[1]] os_group
#    The os group to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.
#    Default value: `dba`
#
# @param [String[1]] adminserver_address
#    The address the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.
#    The default value is: The fact `fqdn`
#
# @param [Integer] adminserver_port
#    The IP port the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.
#    The default value is:  `7001`
#
# @param [String[1]] nodemanager_address
#    The IP address the nodemanager will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.
#    Default value: `::fqdn`
#
# @param [Integer] nodemanager_wait
#    The time in seconds Puppet waits for the nodemanager to start before declaring an error.
#    Default value: `20`
#
# @param [String[1]] weblogic_user
#    The WebLogic user account to bear all administration rights.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.
#    Default value: `weblogic`
#
# @param [Easy_type::Password] weblogic_password
#    The password for the WebLogic account.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.
#    Default value: `Welcome01`
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::node::copy_domain(
  String[1] $domain_name,
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
  String[1] $nodemanager_address,
  Integer   $nodemanager_wait,
  String[1] $weblogic_user,
  Easy_type::Password $weblogic_password,
  Wls_install::Versions
            $version               = $wls_profile::weblogic_version,
  Integer   $adminserver_port      = $wls_profile::adminserver_port,
) inherits wls_profile {
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
    wls_apps_dir        => "${domains_dir}/applications",
    os_user             => $os_user,
    os_group            => $os_group,
    download_dir        => $download_dir,
    log_dir             => $log_dir,
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
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    wls_domains_dir     => $domains_dir,
    jdk_home_dir        => $jdk_home,
    download_dir        => $download_dir,
    domain_name         => $domain_name,
    version             => $version,
    log_dir             => $log_dir,
    nodemanager_address => $nodemanager_address,
    os_user             => $os_user,
    os_group            => $os_group,
    sleep               => $nodemanager_wait,
  }


}
# lint:endignore:variable_scope
