# wls_profile::weblogic::limits
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::limits
class wls_profile::weblogic::limits(
  Hash $list
) inherits wls_profile {
  echo {'WeLogic limits':
    withpath => false,
  }
  create_resources(limits::limits, $list)
}
