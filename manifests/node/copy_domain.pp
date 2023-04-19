#
# wls_profile::node::copy_domain
#
# @summary This class is the default implementation to copy the packed domain from the Admin Server, unpack it on the current machine and start the nodemanager.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::node](./node.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::node::copy_domain (
  Optional[Integer]             $administration_port,
  Boolean                       $administration_port_enabled,
  String[1]                     $adminserver_address,
  Optional[Integer]             $adminserver_ssl_port,
  Boolean                       $custom_identity,
  Optional[String[1]]           $custom_identity_alias,
  Optional[String[1]]           $custom_identity_keystore_filename,
  Optional[Easy_type::Password] $custom_identity_keystore_passphrase,
  Optional[Easy_type::Password] $custom_identity_privatekey_passphrase,
  Boolean                       $custom_trust,
  String[1]                     $domain_name,
  Stdlib::Absolutepath          $domains_dir,
  Stdlib::Absolutepath          $jdk_home,
  Boolean                       $jsse_enabled,
  Stdlib::Absolutepath          $log_dir,
  Stdlib::Absolutepath          $middleware_home,
  String[1]                     $nodemanager_address,
  Hash                          $nodemanager_properties,
  Integer                       $nodemanager_wait,
  String[1]                     $os_group,
  String[1]                     $os_user,
  Optional[String[1]]           $trust_keystore_file,
  Optional[Easy_type::Password] $trust_keystore_passphrase,
  Stdlib::Absolutepath          $weblogic_home,
  Easy_type::Password           $weblogic_password,
  String[1]                     $weblogic_user,
  Integer                       $adminserver_port      = $wls_profile::adminserver_port,
  Optional[String[1]]           $java_update_window    = undef,
  Wls_install::Versions         $version               = $wls_profile::weblogic_version
) inherits wls_profile {
  echo { "WebLogic copy domain ${domain_name} from ${adminserver_address}:${domains_dir}/${domain_name}":
    withpath => false,
  }

  if $java_update_window != undef {
    echo { "Ensuring Java updates only run in update window: ${java_update_window}":
      withpath => false,
    }
    #
    # Ensure the java update window exists
    #
    schedule { 'java_update_window':
      range  => $java_update_window,
    }
    $java_update_schedule = 'java_update_window'
  } else {
    $java_update_schedule = undef
    echo { 'Any java updates are run immediately':
      withpath => false,
    }
  }

  #
  # Depending on the options we specify we need to connect to a different URL for management 
  # of the domain.
  #
  $connect_url = if $administration_port_enabled == true {
    "t3s://${adminserver_address}:${administration_port}"
  } elsif $administration_port_enabled == false and $adminserver_ssl_port != undef {
    "t3s://${adminserver_address}:${adminserver_ssl_port}"
  } else {
    "t3://${adminserver_address}:${adminserver_port}"
  }

  easy_type::debug_evaluation() # Show local variable on extended debug

  wls_install::copydomain { $domain_name:
    domain_name                 => $domain_name,
    version                     => $version,
    weblogic_home_dir           => $weblogic_home,
    middleware_home_dir         => $middleware_home,
    jdk_home_dir                => $jdk_home,
    wls_domains_dir             => $domains_dir,
    wls_apps_dir                => "${domains_dir}/applications",
    os_user                     => $os_user,
    os_group                    => $os_group,
    download_dir                => $wls_profile::download_dir,
    log_dir                     => $log_dir,
    use_ssh                     => true,
    domain_pack_dir             => "${domains_dir}/${domain_name}",
    adminserver_address         => $adminserver_address,
    adminserver_port            => $adminserver_port,
    administration_port_enabled => $administration_port_enabled,
    administration_port         => $administration_port,
    adminserver_ssl_port        => $adminserver_ssl_port,
    weblogic_user               => $weblogic_user,
    weblogic_password           => $weblogic_password,
    java_update_window          => $java_update_schedule,
    jsse_enabled                => $jsse_enabled,
    custom_trust                => $custom_trust,
    trust_keystore_file         => $trust_keystore_file,
    trust_keystore_passphrase   => $trust_keystore_passphrase,
  }
  #
  # Over here you define the nodemanager. Here you can specify the address
  # the nodemanager is running on and the listen address. When you create multiple domains
  # with multiple nodemanagers, you have to specify different addresses and/or ports.
  #
  -> wls_install::nodemanager { "nodemanager for ${domain_name}":
    weblogic_home_dir                     => $weblogic_home,
    middleware_home_dir                   => $middleware_home,
    wls_domains_dir                       => $domains_dir,
    jdk_home_dir                          => $jdk_home,
    download_dir                          => $wls_profile::download_dir,
    domain_name                           => $domain_name,
    version                               => $version,
    log_dir                               => $log_dir,
    nodemanager_address                   => $nodemanager_address,
    os_user                               => $os_user,
    os_group                              => $os_group,
    properties                            => $nodemanager_properties,
    java_update_window                    => $java_update_schedule,
    jsse_enabled                          => $jsse_enabled,
    custom_trust                          => $custom_trust,
    trust_keystore_file                   => $trust_keystore_file,
    trust_keystore_passphrase             => $trust_keystore_passphrase,
    custom_identity                       => $custom_identity,
    custom_identity_keystore_filename     => $custom_identity_keystore_filename,
    custom_identity_keystore_passphrase   => $custom_identity_keystore_passphrase,
    custom_identity_alias                 => $custom_identity_alias,
    custom_identity_privatekey_passphrase => $custom_identity_privatekey_passphrase,
    sleep                                 => $nodemanager_wait,
  }
  #
  # wls_setting is used to store the credentials and connect URL of a domain. The Puppet
  # types need this to connect to the admin server and change settings.
  #
  -> wls_setting { $domain_name:
    user                      => $os_user,
    weblogic_user             => $weblogic_user,
    weblogic_password         => $weblogic_password,
    connect_url               => $connect_url,
    weblogic_home_dir         => $weblogic_home,
    custom_trust              => $custom_trust,
    trust_keystore_file       => $trust_keystore_file,
    trust_keystore_passphrase => if $trust_keystore_passphrase == undef { undef } else { $trust_keystore_passphrase.unwrap },
  }
}
