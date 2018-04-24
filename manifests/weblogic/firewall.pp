# wls_profile::weblogic::firewall
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::firewall
class wls_profile::weblogic::firewall {
  echo {'WebLogic Firewall':
    withpath => false,
  }

  case ($::os['release']['major']) {
    '4','5','6': { $firewall_service = 'iptables'}
    '7': { $firewall_service = 'firewalld' }
    default: { fail 'unsupported OS version when checking firewall service'}
  }

  service { $firewall_service:
      ensure    => false,
      enable    => false,
      hasstatus => true,
  }

}
