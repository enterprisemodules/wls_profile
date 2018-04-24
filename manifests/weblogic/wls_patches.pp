# wls_profile::weblogic::wls_patches
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::wls_patches
class wls_profile::weblogic::wls_patches(
  Hash $list
) {
  echo {'WebLogic Patches':
    withpath => false,
  }
  create_resources(ora_config::wls_opatch, $list)
}
