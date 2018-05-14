# wls_profile::weblogic::firewall::iptables
#
# Open up ports for WebLogic using the firewalld firewall
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::firewall::iptables
class wls_profile::weblogic::firewall::firewalld(
  Array[Integer]  $ports,
  Boolean         $manage_service,
) {
  unless defined(Package['firewalld']) {
    package {'firewalld':
      ensure => 'present',
    }
  }
  $ports.each |$port| {
    firewalld_port { "500 accept tcp port ${port} for Oracle":
      ensure   => present,
      zone     => 'public',
      port     => $port,
      protocol => 'tcp',
    }
  }

  if $manage_service {
    service { 'firewalld':
        ensure    => true,
        enable    => true,
        hasstatus => true,
    }
  }
}
