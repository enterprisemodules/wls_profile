#++--++
#
# wls_profile::limits
#
# @summary This class is the default implementation for making sure the OS Limits on your system are set correctly for WebLogic.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Hash] list
#    The OS limits created for WebLogic.
#    The defaults are:
#    ```yaml
#    wls_profile::weblogic::limits::list:
#      '*/nofile':
#        soft: 2048
#        hard: 8192
#      'oracle/nofile':
#        soft: 65536
#        hard: 65536
#      'oracle/nproc':
#        soft: 2048
#        hard: 16384
#      'oracle/stack':
#        soft: 10240
#      'oracle/memlock':
#        soft: 1048576
#        hard: 1048576
#    ```
#
#--++--
class wls_profile::weblogic::limits(
  Hash $list
) inherits wls_profile {
  echo {'WeLogic limits':
    withpath => false,
  }
  create_resources(limits::limits, $list)
}
