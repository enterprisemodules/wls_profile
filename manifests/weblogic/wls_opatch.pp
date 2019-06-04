#++--++
#
# wls_profile::weblogic::wls_opatch
#
# @summary This class is the default implementation for ensuring your WebLogic Opatch is up-to-date.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Hash] list
#    A Hash describing the WebLogic opatchupgrade you want be installed.
#    Default value is: `{}`
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
