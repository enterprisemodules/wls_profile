# wls_profile::weblogic::sysctl
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::sysctl
class wls_profile::weblogic::sysctl(
  Hash $list
) {
  echo {'WebLogic Sysctl':
    withpath => false,
  }

  $defaults = {
    ensure  => 'present',
    persist => true,
  }
  create_resources(sysctl, $list, $defaults)
}
