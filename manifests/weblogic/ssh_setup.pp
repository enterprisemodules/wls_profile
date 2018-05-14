# wls_profile::weblogic::ssh_setup
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::ssh_setup
class wls_profile::weblogic::ssh_setup (
  String[1] $os_user,
  String[1] $os_group,
  String[1] $private_key,
  String[1] $public_key,
) inherits wls_profile {
  echo {"Setting up ssh keys for ${os_user}":
    withpath => false,
  }

  $security = {
    mode   => '0600',
    owner  => $os_user,
    group  => $os_group,
  }
  file {"/home/${os_user}/.ssh":
    ensure => 'directory',
    *      => $security,
  }

  file {"/home/${os_user}/.ssh/id_rsa":
    ensure  => 'present',
    content => $private_key,
    *       => $security,
  }

  ssh_authorized_key { $os_user:
    ensure => 'present',
    user   => $os_user,
    type   => 'ssh-rsa',
    key    => $public_key,
  }
}
