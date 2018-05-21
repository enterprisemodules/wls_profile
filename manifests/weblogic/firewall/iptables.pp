#++--++
#--++--
class wls_profile::weblogic::firewall::iptables(
  Array[Integer]  $ports,
  Boolean         $manage_service,
) {
  unless defined(Package['iptables']) {
    package {'iptables':
      ensure => 'present',
    }
  }

  $ports.each |$port| {
    firewall { "500 accept tcp port ${port} for Oracle":
      proto  => 'tcp',
      action => 'accept',
    }
  }

  if $manage_service {
    service { 'iptables':
        ensure    => true,
        enable    => true,
        hasstatus => true,
    }
  }
}
