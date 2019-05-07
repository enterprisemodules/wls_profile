#++--++
#
#--++--
class wls_profile::weblogic::wls_opatch(
  Hash $list
) inherits wls_profile {
  echo {'WebLogic OPatch Update':
    withpath => false,
  }
  create_resources(wls_install::opatchupgrade, $list)
}
