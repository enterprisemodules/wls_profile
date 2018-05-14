# wls_profile::basic_domain
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::basic_domain
class wls_profile::basic_domain(
  Optional[String] $weblogic = undef,
  Optional[String] $wls_domain = undef,
  Optional[String] $wls_startup = undef,
  Optional[String] $before_weblogic = undef,
  Optional[String] $before_wls_domain = undef,
  Optional[String] $before_wls_startup = undef,
  Optional[String] $after_weblogic = undef,
  Optional[String] $after_wls_domain = undef,
  Optional[String] $after_wls_startup = undef,
) inherits wls_profile {
  easy_type::staged_contain([
    'wls_profile::weblogic',
    'wls_profile::basic_domain::wls_domain',
    'wls_profile::basic_domain::wls_startup',
  ])

}
