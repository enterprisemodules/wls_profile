# wls_profile::admin_server::wls_jms
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::admin_server::wls_jms
class wls_profile::admin_server::wls_jms(
  Hash  $module_list,
  Hash  $queue_list,
  Hash  $topic_list
) inherits wls_profile {
  echo {'WebLogic JMS configuration':
    withpath => false,
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your tablespaces, to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(wls_module, $module_list)
  create_resources(wls_queue, $queue_list)
  create_resources(wls_topic, $topic_list)
}
