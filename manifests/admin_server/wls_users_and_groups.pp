#
# @summary This class is the default implementation for ensuring the correct WebLogic users and groups are available on the system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Hash] group_list
#    A list of WebLogic groups to define.
#    The default value is: `{}`
#    This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.
#
# @param [Hash] user_list
#    A list of WebLogic users to define.
#    The default value is: `{}`
#    This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.
#
class wls_profile::admin_server::wls_users_and_groups (
  Hash $group_list,
  Hash $user_list,
) inherits wls_profile {
  echo {'WebLogic Groups and Users':
    withpath => false,
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your tablespaces, to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(wls_group, $group_list)
  create_resources(wls_user, $user_list)
}
