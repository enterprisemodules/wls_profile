# wls_profile::admin_server
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic
class wls_profile::admin_server(
  Optional[String] $basic_domain = undef,
  Optional[String] $wls_servers = undef,
  Optional[String] $wls_cluster = undef,
  Optional[String] $wls_datasources = undef,
  Optional[String] $wls_jms = undef,
  Optional[String] $wls_users_and_groups = undef,
  Optional[String] $pack_domain = undef,
  Optional[String] $before_basic_domain = undef,
  Optional[String] $before_wls_servers = undef,
  Optional[String] $before_wls_cluster = undef,
  Optional[String] $before_wls_datasources = undef,
  Optional[String] $before_wls_jms = undef,
  Optional[String] $before_wls_users_and_groups = undef,
  Optional[String] $before_pack_domain = undef,
  Optional[String] $after_basic_domain = undef,
  Optional[String] $after_wls_servers = undef,
  Optional[String] $after_wls_cluster = undef,
  Optional[String] $after_wls_datasources = undef,
  Optional[String] $after_wls_jms = undef,
  Optional[String] $after_wls_users_and_groups = undef,
  Optional[String] $after_pack_domain = undef,
)
{
  easy_type::staged_contain([
    'wls_profile::basic_domain',
    'wls_profile::admin_server::wls_servers',
    'wls_profile::admin_server::wls_cluster',
    'wls_profile::admin_server::wls_datasources',
    'wls_profile::admin_server::wls_jms',
    'wls_profile::admin_server::wls_users_and_groups',
    'wls_profile::admin_server::pack_domain',
  ])
}

