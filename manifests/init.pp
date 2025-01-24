#
# wls_profile
#
class wls_profile (
  String[1] $adminserver_address,
  Integer   $adminserver_port,
  String[1] $cluster_name,
  #
  # See the file "LICENSE" for the full license governing this code.
  #
  String[1] $domain_name,
  Stdlib::Absolutepath
  $domains_dir,
  Stdlib::Absolutepath
  $download_dir,
  String[1] $java_full_version,
  String[1] $java_version,
  Stdlib::Absolutepath
  $jdk_home,
  Stdlib::Absolutepath
  $log_dir,
  Stdlib::Absolutepath
  $middleware_home,
  String[1] $nodemanager_address,
  Integer   $nodemanager_port,
  Stdlib::Absolutepath
  $oracle_base,
  String[1] $os_group,
  String[1] $os_user,
  Hash      $servers,
  String[1] $source,
  Stdlib::Absolutepath
  $temp_dir,
  Stdlib::Absolutepath
  $weblogic_home,
  Easy_type::Password
  $weblogic_password,
  String[1] $weblogic_user,
  Wls_install::Versions
  $weblogic_version,
  Integer[7,21] $jdk_major_version = Integer($java_version.split('u')[0]),
  Enum[
    'standard',
    'forms',
    'ohs_standalone',
    'adf_restricted',
    'osb',
    'osb_soa',
    'osb_soa_bpm',
    'soa',
    'soa_bpm',
    'bam',
    'adf',
    'oim',
    'oud',
    'wc',
  'wc_wcc_bpm']
  $install_type = 'standard'
) {
}
