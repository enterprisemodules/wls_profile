#
# wls_profile::weblogic::ssh_setup
#
# @summary This class is the default implementation for making sure the WebLogic account has ssh keys setup so it can passwordless copy files.
# This is required when copying the packed domain from an admin server to a WebLogic node. If you are building singles node WebLogic configurations, you can skip this class.
# 
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin_server](./admin_server.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic::ssh_setup (
  String[1] $os_group,
  String[1] $os_user,
  String[1] $private_key,
  String[1] $public_key
) inherits wls_profile {
  echo { "Setting up ssh keys for ${os_user}":
    withpath => false,
  }

  $security = {
    mode   => '0600',
    owner  => $os_user,
    group  => $os_group,
  }
  file { "/home/${os_user}/.ssh":
    ensure => 'directory',
    *      => $security,
  }

  file { "/home/${os_user}/.ssh/id_rsa":
    ensure  => 'file',
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
