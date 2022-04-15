#
# wls_profile::basic_domain::wls_domain
#
# @summary This class is the default implementation for defining a domain on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::basic_domain](./basic_domain.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
# lint:ignore:strict_indent
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
# lint:endignore:strict_indent

  echo { "WebLogic domain for domain ${domain_name} using template for ${template_name}":
    withpath => false,
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
