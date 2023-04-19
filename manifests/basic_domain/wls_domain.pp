#
# wls_profile::basic_domain::wls_domain
#
# @summary This class is the default implementation for defining a domain on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::basic_domain](./basic_domain.html) for an explanation on how to do this.
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
#
# @param [String[1]] domain_alias
#    The domain alias.
#    This is the name puppet uses to identify this domain. When you leave this parameter undefined, it will default to the current WebLogic domain name. When you specify the string 'default', Puppet will use this domain by default when you don't specify a resource for all of the `wls_config` resources.
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
# @param [Stdlib::Absolutepath] domains_dir
#    The top-level directory where the domain directories will reside in.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.
#    The default value is:  `/opt/oracle/domains`
#
# @param [Stdlib::Absolutepath] log_dir
#    The directory used for log files.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.
#    Default value: `/opt/oracle/domains/log`
#
# @param [Enum['standard', 'forms', 'ohs_standalone', 'adf_restricted', 'osb', 'osb_soa', 'osb_soa_bpm', 'soa', 'soa_bpm', 'bam', 'adf', 'oim', 'oud', 'wc', 'wc_wcc_bpm']] template_name
#    The domain template to use when creating the domain.
#    The default value is `standard`.
#    Valid values are:
#    - `standard`
#    - `ohs_standalone`
#    - `adf_restricted`
#    - `osb`
#    - `osb_soa`
#    - `osb_soa_bpm`
#    - `soa`
#    - `soa_bpm`
#    - `bam`
#    - `adf`
#    - `oim`
#    - `oud`
#    - `wc`
#    - `wc_wcc_bpm`
#
# @param [String[1]] nodemanager_address
#    The IP address the nodemanager will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.
#    Default value: `::fqdn`
#
# @param [String[1]] adminserver_address
#    The address the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.
#    The default value is: The fact `fqdn`
#
# @param [Hash] nodemanager_properties
#    These are the additional parameters required for nodemanager creation, which will be stored in the nodemanager.
#    properties file.
#
# @param [Integer] nodemanager_port
#    The IP port the nodemanager listens on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::nodemanager_port` to change it to your requested value.
#    Default value: `5556`
#
# @param [Integer] adminserver_port
#    The IP port the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.
#    The default value is:  `7001`
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
# @param [Optional[Integer]] administration_port
#    The common secure administration port for this WebLogic Server domain.
#    (Requires you to enable the administration port.)
#
# @param [Optional[Integer]] adminserver_ssl_port
#    SSL port to use for the Admin server.
#
# @param [Optional[String[1]]] java_update_window
#    The time frame in which any required java updates will be applied to your domain by Puppet.
#    Puppet will apply any detected java updates immediately if the value is `undef`, which is the default.
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
# @param [Boolean] bam_enabled
#    A boolean value specifying if you want to enable bam.
#    Default value: `false`
#
# @param [Boolean] b2b_enabled
#    A boolean value specifying if you want to enable b2b.
#    Default value: `false`
#
# @param [Boolean] ess_enabled
#    A boolean value specifying if you want to enable ess.
#    Default value: `false`
#
# @param [Boolean] development_mode
#    A boolean value specifying if you want to enable development mode.
#    Default value: `false`
#
# @param [Integer] nodemanager_wait
#    The time in seconds Puppet waits for the nodemanager to start before declaring an error.
#    Default value: `20`
#
# @param [Hash] adminserver_settings
#    A Hash containing settings (of type `wls_server`) to define for the Admin server.
#    The default value is: `{}`
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::basic_domain::wls_domain (
  Optional[Integer]   $administration_port,
  Boolean             $administration_port_enabled,
  String[1]           $adminserver_address,
  Hash                $adminserver_settings,
  Optional[Integer]   $adminserver_ssl_port,
  Boolean             $b2b_enabled,
  Boolean             $bam_enabled,
  Boolean             $custom_identity,
  Optional[String[1]] $custom_identity_alias,
  Optional[String[1]] $custom_identity_keystore_filename,
  Boolean             $custom_trust,
  Boolean             $development_mode,
  String[1]           $domain_name,
  Stdlib::Absolutepath
  $domains_dir,
  Boolean             $ess_enabled,
  Array               $extra_properties,
  Stdlib::Absolutepath
  $jdk_home,
  Boolean             $jsse_enabled,
  Stdlib::Absolutepath
  $log_dir,
  Stdlib::Absolutepath
  $middleware_home,
  String[1]           $nodemanager_address,
  Hash                $nodemanager_properties,
  Integer             $nodemanager_wait,
  String[1]           $os_group,
  String[1]           $os_user,
  Enum[
    'standard',
    'forms',
    'ohs_standalone',
    'adf_restricted',
    'osb',
    'osb_soa',
    'osb_soa_bpm',
    'soa',
    'soa_bpm',
    'bam',
    'adf',
    'oim',
    'oud',
    'wc',
  'wc_wcc_bpm']
  $template_name,
  Optional[String[1]] $trust_keystore_file,
  Stdlib::Absolutepath
  $weblogic_home,
  Easy_type::Password $weblogic_password,
  String[1]           $weblogic_user,
  Integer             $adminserver_port                      = $wls_profile::adminserver_port,
  Optional[Easy_type::Password]
  $custom_identity_keystore_passphrase   = undef,
  Optional[Easy_type::Password]
  $custom_identity_privatekey_passphrase = undef,
  String[1]           $domain_alias                          = $domain_name,
  Optional[String[1]] $java_update_window                    = undef,
  Integer             $nodemanager_port                      = $wls_profile::nodemanager_port,
  Optional[String[1]] $rcu_database_url                      = undef,
  Optional[String[1]] $repository_database_url               = undef,
  Optional[Easy_type::Password]
  $repository_password                   = undef,
  Optional[String[1]] $repository_prefix                     = undef,
  Optional[Easy_type::Password]
  $repository_sys_password               = undef,
  Optional[Easy_type::Password]
  $trust_keystore_passphrase             = undef,
  Wls_install::Versions
  $version                               = $wls_profile::weblogic_version
) inherits wls_profile {
  echo { "WebLogic domain for domain ${domain_name} using template for ${template_name}":
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

  if $template_name in ['forms','ohs_standalone','osb','osb_soa','osb_soa_bpm','soa','soa_bpm','bam','oim','oud','wc','wc_wcc_bpm', 'adf'] {
    $optional_settings = {
      repository_database_url => $repository_database_url,
      rcu_database_url        => $rcu_database_url,
      repository_prefix       => $repository_prefix,
      repository_sys_password => $repository_sys_password,
    }
  } else {
    $optional_settings = {}
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

  #
  # Here you create your domain. The domain is the first thing a WebLogic installation needs. Here
  # you also decide what kind of domain you need. A bare WebLogic
  #
  wls_install::domain { $domain_name:
    version                               => $version,
    wls_domains_dir                       => $domains_dir,
    wls_apps_dir                          => "${domains_dir}/applications",
    weblogic_home_dir                     => $weblogic_home,
    middleware_home_dir                   => $middleware_home,
    log_dir                               => $log_dir,
    jdk_home_dir                          => $jdk_home,
    domain_name                           => $domain_name,
    domain_template                       => $template_name,
    bam_enabled                           => $bam_enabled,
    b2b_enabled                           => $b2b_enabled,
    ess_enabled                           => $ess_enabled,
    development_mode                      => $development_mode,
    weblogic_user                         => $weblogic_user,
    weblogic_password                     => $weblogic_password,
    repository_password                   => $repository_password,
    os_user                               => $os_user,
    os_group                              => $os_group,
    nodemanager_address                   => $nodemanager_address,
    nodemanager_port                      => $nodemanager_port,
    adminserver_address                   => $adminserver_address,
    adminserver_port                      => $adminserver_port,
    adminserver_ssl_port                  => $adminserver_ssl_port,
    administration_port                   => $administration_port,
    administration_port_enabled           => $administration_port_enabled,
    download_dir                          => $wls_profile::download_dir,
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
    *                                     => $optional_settings,
  }
  #
  # Over here you define the nodemanager. Here you can specify the address
  # the nodemanager is running on and the listen address. When you create multiple domains
  # with multiple nodemanagers, you have to specify different addresses and/or ports.
  #
  -> wls_install::nodemanager { "nodemanager for ${domain_name}":
    wls_domains_dir                       => $domains_dir,
    weblogic_home_dir                     => $weblogic_home,
    middleware_home_dir                   => $middleware_home,
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
  # Before you can manage any WebLogic objects, you'll need to have a running admin server.
  # This code mages sure the admin server is started. Just like with the nodemanager, you'll need
  # to specify unique addresses and ports.
  #
  -> wls_install::control { "start_adminserver_${domain_name}":
    wls_domains_dir           => $domains_dir,
    action                    => 'start',
    weblogic_home_dir         => $weblogic_home,
    middleware_home_dir       => $middleware_home,
    download_dir              => $wls_profile::download_dir,
    jdk_home_dir              => $jdk_home,
    os_user                   => $os_user,
    os_group                  => $os_group,
    domain_name               => $domain_name,
    weblogic_user             => $weblogic_user,
    weblogic_password         => $weblogic_password,
    adminserver_address       => $adminserver_address,
    adminserver_port          => $adminserver_port,
    jsse_enabled              => $jsse_enabled,
    custom_trust              => $custom_trust,
    trust_keystore_file       => $trust_keystore_file,
    trust_keystore_passphrase => $trust_keystore_passphrase,
  }
  #
  # wls_setting is used to store the credentials and connect URL of a domain. The Puppet
  # types need this to connect to the admin server and change settings.
  #
  ->wls_setting { $domain_alias:
    user                      => $os_user,
    weblogic_user             => $weblogic_user,
    weblogic_password         => $weblogic_password,
    connect_url               => $connect_url,
    weblogic_home_dir         => $weblogic_home,
    extra_properties          => $extra_properties,
    custom_trust              => $custom_trust,
    trust_keystore_file       => $trust_keystore_file,
    trust_keystore_passphrase => if $trust_keystore_passphrase == undef { undef } else { $trust_keystore_passphrase.unwrap },
  }

  #
  # You can use this wls_server definition to change any settings for your
  # Admin server. because the AdminServer is restarted by wls_adminserver{'soa/AdminServer':}
  # These settings are immediately applied
  #
  ->wls_server { "${domain_alias}/AdminServer":
    ensure                  => 'present',
    listenaddress           => $adminserver_address,
    listenport              => $adminserver_port,
    logfilename             => "${log_dir}/AdminServer/AdminServer_${domain_name}.log",
    log_datasource_filename => "${log_dir}/AdminServer/datasource.log",
    log_http_filename       => "${log_dir}/AdminServer/access.log",
    *                       => $adminserver_settings,
  }
  #
  # This definition restarts the Admin server. It is a refresh-only, so it is only done
  # when the statement before actually changed something.
  #
  ~>wls_adminserver { "${domain_alias}/AdminServer":
    ensure                    => running,
    refreshonly               => true,
    server_name               => 'AdminServer',
    domain_name               => $domain_name,
    domain_path               => "${domains_dir}/${domain_name}",
    os_user                   => $os_user,
    nodemanager_address       => $nodemanager_address,
    nodemanager_port          => $nodemanager_port,
    weblogic_user             => $weblogic_user,
    weblogic_password         => unwrap($weblogic_password),
    weblogic_home_dir         => $weblogic_home,
    subscribe                 => Wls_install::Domain[$domain_name],
    jsse_enabled              => $jsse_enabled,
    custom_trust              => $custom_trust,
    trust_keystore_file       => $trust_keystore_file,
    trust_keystore_passphrase => if $trust_keystore_passphrase == undef { undef } else { $trust_keystore_passphrase.unwrap },
  }
}
