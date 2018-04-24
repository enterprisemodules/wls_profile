# wls_profile::weblogic_setup
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic_setup
class wls_profile::weblogic (
  Optional[String] $sysctl = undef,
  Optional[String] $limits = undef,
  Optional[String] $packages = undef,
  Optional[String] $groups_and_users = undef,
  Optional[String] $ssh_setup = undef,
  Optional[String] $firewall = undef,
  Optional[String] $java_software = undef,
  Optional[String] $wls_software = undef,
  Optional[String] $wls_patches = undef,
  Optional[String] $before_sysctl = undef,
  Optional[String] $before_limits = undef,
  Optional[String] $before_packages = undef,
  Optional[String] $before_groups_and_users = undef,
  Optional[String] $before_ssh_setup = undef,
  Optional[String] $before_firewall = undef,
  Optional[String] $before_java_software = undef,
  Optional[String] $before_wls_software = undef,
  Optional[String] $before_wls_patches = undef,
  Optional[String] $after_sysctl = undef,
  Optional[String] $after_limits = undef,
  Optional[String] $after_packages = undef,
  Optional[String] $after_groups_and_users = undef,
  Optional[String] $after_ssh_setup = undef,
  Optional[String] $after_firewall = undef,
  Optional[String] $after_java_software = undef,
  Optional[String] $after_wls_software = undef,
  Optional[String] $after_wls_patches = undef,
) {
  easy_type::staged_contain([
    'wls_profile::weblogic::sysctl',
    'wls_profile::weblogic::limits',
    'wls_profile::weblogic::packages',
    'wls_profile::weblogic::groups_and_users',
    'wls_profile::weblogic::ssh_setup',
    'wls_profile::weblogic::firewall',
    'wls_profile::weblogic::java_software',
    'wls_profile::weblogic::wls_software',
    'wls_profile::weblogic::wls_patches',
  ])
}
