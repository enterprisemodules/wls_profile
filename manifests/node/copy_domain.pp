#
# wls_profile::node::copy_domain
#
# @summary This class is the default implementation to copy the packed domain from the Admin Server, unpack it on the current machine and start the nodemanager.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::node](./node.html) for an explanation on how to do this.
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
#
# @param [Wls_install::Versions] version
#    The version of WebLogic you want to use.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::version` to change it to your requested value.
#    Valid values are:
#      - `1036`
#      - `1111`
#      - `1112`
#      - `1211`
#      - `1212`
#      - `1213`
#      - `1221`
#      - `12211`
#      - `12212`
#      - `12213`
#      - `12214`
#    Default value: `12213`
#
# @param [Stdlib::Absolutepath] weblogic_home
#    The directory used as WebLogic home
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12/wlserver`
#
# @param [Stdlib::Absolutepath] log_dir
#    The directory used for log files.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.
#    Default value: `/opt/oracle/domains/log`
#
# @param [Stdlib::Absolutepath] middleware_home
#    The Oracle middleware home directory.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12`
#
# @param [Stdlib::Absolutepath] jdk_home
#    The location where the JDK is installed.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.
#    The default value is: `/usr/java/jdk1.8.0_152`
#
# @param [Stdlib::Absolutepath] domains_dir
#    The top-level directory where the domain directories will reside in.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.
#    The default value is:  `/opt/oracle/domains`
#
# @param [String[1]] os_user
#    The os user to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.
#    Default value: `oracle`
#
# @param [String[1]] os_group
#    The os group to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.
#    Default value: `dba`
#
# @param [String[1]] adminserver_address
#    The address the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.
#    The default value is: The fact `fqdn`
#
# @param [Integer] adminserver_port
#    The IP port the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.
#    The default value is:  `7001`
#
# @param [Optional[Integer]] administration_port
#    The common secure administration port for this WebLogic Server domain.
#    (Requires you to enable the administration port.)
#
# @param [Boolean] administration_port_enabled
#    Specifies whether the domain-wide administration port should be enabled for this WebLogic Server domain.
#    Because the administration port uses SSL, enabling the administration port requires that SSL must be configured for all servers in the domain.
#    The domain-wide administration port enables you to start a WebLogic Server instance in STANDBY state. It also allows you to separate administration traffic from application traffic in your domain. Because all servers in the domain must enable or disable the administration port at once, you configure the default administration port settings at the domain level.
#    If you enable the administration port:
#    The administration port accepts only connections that specify administrator credentials.
#    Connections that specify administrator credentials can use only the administration port.
#    The command that starts managed servers must specify a secure protocol and the administration port: -Dweblogic.management.server=https://admin_server:administration_port
#
# @param [Optional[Integer]] adminserver_ssl_port
#    SSL port to use for the Admin server.
#
# @param [String[1]] nodemanager_address
#    The IP address the nodemanager will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.
#    Default value: `::fqdn`
#
# @param [Hash] nodemanager_properties
#    These are the additional parameters required for nodemanager creation, which will be stored in the nodemanager.
#    properties file.
#
# @param [Integer] nodemanager_wait
#    The time in seconds Puppet waits for the nodemanager to start before declaring an error.
#    Default value: `20`
#
# @param [String[1]] weblogic_user
#    The WebLogic user account to bear all administration rights.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.
#    Default value: `weblogic`
#
# @param [Easy_type::Password] weblogic_password
#    The password for the WebLogic account.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.
#    Default value: `Welcome01`
#
# @param [Optional[String[1]]] java_update_window
#    The time frame in which any required java updates will be applied to your domain by Puppet.
#    Puppet will apply any detected java updates immediately if the value is `undef`, which is the default.
#
# @param [Boolean] jsse_enabled
#    Determine if you want to enable JSSE security.
#
# @param [Boolean] custom_trust
#    Determine if you want to use a custom trust or not.
#
# @param [Optional[String[1]]] trust_keystore_file
#    File specification of the trust keystore.
#
# @param [Optional[Easy_type::Password]] trust_keystore_passphrase
#    The passphrase for access to the keystore.
#
# @param [Boolean] custom_identity
#    Set to true if you want to enable the use of custom identities.
#
# @param [Optional[String[1]]] custom_identity_keystore_filename
#    The name of the file containing the custom identities.
#
# @param [Optional[String[1]]] custom_identity_alias
#    The alias of the entry in the custom identity keystore that we want to use.
#
# @param [Optional[Easy_type::Password]] custom_identity_keystore_passphrase
#    The passphrase for the custom identity keystore.
#
# @param [Optional[Easy_type::Password]] custom_identity_privatekey_passphrase
#    The passphrase for the private key in the custom identity keystore.
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
