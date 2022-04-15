#
# @summary This class will deploy the Enterprise Modules license.
#
#
class wls_profile::weblogic::em_license {
  contain easy_type::license::activate
}
