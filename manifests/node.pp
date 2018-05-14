# wls_profile::node
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::node
class wls_profile::node (
  Optional[String] $weblogic = undef,
  Optional[String] $copy_domain = undef,
  Optional[String] $wls_startup = undef,
  Optional[String] $before_weblogic = undef,
  Optional[String] $before_copy_domain = undef,
  Optional[String] $before_wls_startup = undef,
  Optional[String] $after_weblogic = undef,
  Optional[String] $after_copy_domain = undef,
  Optional[String] $after_wls_startup = undef,
) inherits wls_profile {
  easy_type::staged_contain([
    'wls_profile::weblogic',
    'wls_profile::node::copy_domain',
    'wls_profile::basic_domain::wls_startup',
  ])
}
