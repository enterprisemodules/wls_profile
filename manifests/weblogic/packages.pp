# wls_profile::database::packages
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::database::packages
class wls_profile::weblogic::packages(
  Array[String[1]] $list,
) {
  echo {'WebLogic Packages':
    withpath => false,
  }

  package { $list:
    ensure  => present,
  }
}
