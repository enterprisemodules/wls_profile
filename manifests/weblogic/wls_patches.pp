#++--++
#
# wls_profile::wls_patches
#
# @summary This class is the default implementation for ensuring your WebLogic software has all the required patches installed.
# Using hiera, you can customize some of the aspects of this process.
# s
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Hash] list
#    A Hash describing the WebLogic patches you want be installed.
#    Default value is: `{}`
#
#--++--
class wls_profile::weblogic::wls_patches(
  Hash $list
) inherits wls_profile {
  echo {'WebLogic Patches':
    withpath => false,
  }
  create_resources(wls_opatch, $list)
}
