#++--++
#--++--
class wls_profile(
  String[1] $domain_name,
  String[1] $cluster_name,
  String[1] $java_version,
  String[1] $java_full_version,
  String[1] $weblogic_user,
  String[1] $weblogic_password,
  String[1] $os_user,
  String[1] $os_group,
  String[1] $source,
  Stdlib::Absolutepath
            $oracle_base,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $domains_dir,
  Stdlib::Absolutepath
            $jdk_home,
  Stdlib::Absolutepath
            $log_dir,
  String[1] $adminserver_address,
  String[1] $nodemanager_address,
  Hash      $servers              = lookup('wls_profile::servers'),
  Integer   $adminserver_port     = lookup('wls_profile::adminserver_port'),
  Integer   $nodemanager_port     = lookup('wls_profile::nodemanager_port'),
  Wls_install::Versions
            $weblogic_version     = lookup('wls_profile::weblogic_version'),
) {
}
