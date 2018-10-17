#++--++
#
# wls_profile::packages
#
# @summary 
# This class is the default implementation for making sure the required packages are on your system.Using hiera, you can customize some of the aspects of this process.When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Array[String[1]]] list
#    The required packages for a succesful WebLogic installation.
#    The defaults are:
#    ```yaml
#    wls_profile::weblogic::packages::list:
#      - binutils.x86_64
#      - unzip.x86_64
#    ```
#
#--++--
class wls_profile::weblogic::packages(
  Hash $list,
) inherits wls_profile {
  if $list.size > 0 {
    $packages = $list.keys
    echo {"Ensure WebLogic Packages(s) ${packages.join(',')}":
      withpath => false,
    }
  }

  ensure_resources('package', $list, {})

}
