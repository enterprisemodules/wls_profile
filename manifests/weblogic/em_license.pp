#++--++
#
# wls_profile::weblogic::em_license
#
# @summary This class will deploy the Enterprise Modules license.
#
#
#--++--
class wls_profile::weblogic::em_license
{
  include stdlib

  unless defined(Class['easy_type::license::available']) {
    class{'::easy_type::license::available':
      stage => 'setup',
    }
  }
}
