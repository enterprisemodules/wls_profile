# wls_profile::weblogic::groups_and_users
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::groups_and_users
class wls_profile::weblogic::groups_and_users(
  Hash  $users,
  Hash  $groups,
) inherits wls_profile {
  echo {'Weblogic Groups and Users':
    withpath => false,
  }
  $defaults = { 'ensure' => 'present'}
  create_resources('user', $users, $defaults )
  create_resources('group', $groups, $defaults)
}
