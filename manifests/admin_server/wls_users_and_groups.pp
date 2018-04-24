# wls_profile::admin_server::wls_users_and_groups
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::admin_server::wls_users_and_groups
class wls_profile::admin_server::wls_users_and_groups (
  Hash $group_list,
  Hash $user_list,
) {
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
