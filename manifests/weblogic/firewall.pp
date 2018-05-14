# wls_profile::weblogic::firewall
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::firewall
class wls_profile::weblogic::firewall(
  Array[Integer]  $ports,
  Boolean         $manage_service,
) inherits wls_profile {

  echo {"Firewall: ensuring tcp port(s) ${ports.join(',')} are open.":
    withpath => false,
  }

  case  $::operatingsystem {
    'RedHat', 'CentOS', 'OracleLinux': {
      case ($::os['release']['major']) {
        '4','5','6': {
          class {'wls_profile::weblogic::firewall::iptables':
            ports          => $ports,
            manage_service => $manage_service,
          }
        }
        '7': {
          class {'wls_profile::weblogic::firewall::firewalld':
            ports          => $ports,
            manage_service => $manage_service,
          }
        }
        default: { fail 'unsupported OS version when checking firewall service'}
      }
    }
    'Solaris':{
      warning 'No firewall rules added on Solaris.'
    }
    default: {
        fail "${::operatingsystem} is not supported."
    }
  }
}
