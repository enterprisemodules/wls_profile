#
# @summary This class will deploy the Enterprise Modules license.
#
#
class wls_profile::weblogic::em_license {
  unless defined(Class['easy_type::license::activate']) {
    debug 'License activated in wls_profile'
    contain easy_type::license::activate
  }
}
