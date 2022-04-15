#
# wls_profile::admin_server::wls_jms
#
# @summary This class is the default implementation for defining WebLogic JMS setup.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Hash] module_list
#    A list of modules to define.
#    The default value is: `{}`
#    This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.
#
# @param [Hash] queue_list
#    A list of JMS queues to define.
#    The default value is: `{}`
#    This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.
#
# @param topic_lis
#    A list of JMS topics to define.
#    The default value is: `{}`
#    This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::admin_server::wls_jms (
  Hash  $module_list,
  Hash  $queue_list,
  Hash  $topic_list
) inherits wls_profile {
  echo { 'WebLogic JMS configuration':
    withpath => false,
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your tablespaces, to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(wls_jms_module, $module_list)
  create_resources(wls_jms_queue, $queue_list)
  create_resources(wls_jms_topic, $topic_list)
}
