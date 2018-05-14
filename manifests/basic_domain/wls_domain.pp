# wls_profile::basic_domain::wls_domain
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::basic_domain::wls_domain
class wls_profile::basic_domain::wls_domain(
  String[1] $domain_name,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $domains_dir,
  Stdlib::Absolutepath
            $jdk_home,
  Stdlib::Absolutepath
            $log_dir,
  Enum[
    'standard',
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
  String[1] $nodemanager_address,
  String[1] $adminserver_address,
  String[1] $os_user,
  String[1] $os_group,
  String[1] $weblogic_user,
  String[1] $weblogic_password,
  Boolean   $bam_enabled,
  Boolean   $b2b_enabled,
  Boolean   $ess_enabled,
  Boolean   $development_mode,
  Integer   $nodemanager_wait,
  Hash      $adminserver_settings,
  Integer   $nodemanager_port       = $wls_profile::nodemanager_port,
  Integer   $adminserver_port       = $wls_profile::adminserver_port,
  Wls_install::Versions
            $version                = $wls_profile::weblogic_version,
) inherits wls_profile {
  echo {"WebLogic domain for domain ${domain_name} using template for ${template_name}":
    withpath => false
  }
  #
  # Here you create your domain. The domain is the first thing a WebLogic installation needs. Here
  # you also decide what kind of domain you need. A bare WebLogic
  #
  wls_install::domain{$domain_name:
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    jdk_home_dir        => $jdk_home,
    domain_name         => $domain_name,
    domain_template     => $template_name,
    bam_enabled         => $bam_enabled,
    b2b_enabled         => $b2b_enabled,
    ess_enabled         => $ess_enabled,
    development_mode    => $development_mode,
    weblogic_user       => $weblogic_user,
    weblogic_password   => $weblogic_password,
    os_user             => $os_user,
    os_group            => $os_group,
    adminserver_address => $adminserver_address,
    adminserver_port    => $adminserver_port,
    download_dir        => '/var/tmp/install',
  }
  #
  # Over here you define the nodemanager. Here you can specify the address
  # the nodemanager is running on and the listen address. When you create multiple domains
  # with multiple nodemanagers, you have to specify different addresses and/or ports.
  #
  -> wls_install::nodemanager{"nodemanager for ${domain_name}":
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    jdk_home_dir        => $jdk_home,
    download_dir        => '/var/tmp/install',
    domain_name         => $domain_name,
    version             => $version,
    log_dir             => $log_dir,
    nodemanager_address => $nodemanager_address,
    os_user             => $os_user,
    os_group            => $os_group,
    sleep               => $nodemanager_wait,
  }
  #
  # Before you can manage any WebLogic objects, you'll need to have a running admin server.
  # This code mages sure the admin server is started. Just like with the nodemanager, you'll need
  # to specify unique addresses and ports.
  #
  -> wls_install::control{"start_adminserver_${domain_name}":
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    download_dir        => '/var/tmp/install',
    jdk_home_dir        => $jdk_home,
    action              => 'start',
    os_user             => $os_user,
    os_group            => $os_group,
    domain_name         => $domain_name,
    weblogic_user       => $weblogic_user,
    weblogic_password   => $weblogic_password,
  }
  #
  # wls_setting is used to store the credentials and connect URL of a domain. The Puppet
  # types need this to connect to the admin server and change settings.
  #
  ->wls_setting{$domain_name:
    user              => $os_user,
    weblogic_user     => $weblogic_user,
    weblogic_password => $weblogic_password,
    connect_url       => "t3://${adminserver_address}:${adminserver_port}",
    weblogic_home_dir => $weblogic_home,
  }

  #
  # You can use this wls_server definition to change any settings for your
  # Admin server. because the AdminServer is restarted by wls_adminserver{'soa/AdminServer':}
  # These settings are immediately applied
  #
  ->wls_server{"${domain_name}/AdminServer":
    ensure                  => 'present',
    listenaddress           => $adminserver_address,
    listenport              => $adminserver_port,
    machine                 => 'LocalMachine',
    logfilename             => "${log_dir}/AdminServer/AdminServer_${domain_name}.log",
    log_datasource_filename => "${log_dir}/AdminServer/datasource.log",
    log_http_filename       => "${log_dir}/AdminServer/access.log",
    *                       => $adminserver_settings,
  }
  #
  # This definition restarts the Admin server. It is a refresh-only, so it is only done
  # when the statement before actually changed something.
  #
  ~>wls_adminserver{"${domain_name}/AdminServer":
    ensure              => running,
    refreshonly         => true,
    server_name         => 'AdminServer',
    domain_name         => $domain_name,
    domain_path         => "${domains_dir}/${domain_name}",
    os_user             => $os_user,
    nodemanager_address => $nodemanager_address,
    nodemanager_port    => $nodemanager_port,
    weblogic_user       => $weblogic_user,
    weblogic_password   => $weblogic_password,
    weblogic_home_dir   => $weblogic_home,
    subscribe           => Wls_install::Domain[$domain_name],
  }
}
