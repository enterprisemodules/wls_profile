#
# wls_profile::weblogic::fmw_cluster
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::admin_server::fmw_cluster (
  Boolean                             $custom_trust,
  Boolean                             $jsse_enabled,
  Optional[String[1]]                 $trust_keystore_file,
  Optional[Easy_type::Password]       $trust_keystore_passphrase = undef,
  Variant[Boolean,Enum['on_failure']] $logoutput = lookup({ name => 'logoutput', default_value => 'on_failure' }),
) inherits wls_profile {
  echo { "Setting up fusion middleware for cluster ${$wls_profile::cluster_name}":
    withpath => false,
  }

  $soa_enabled = $wls_profile::install_type in ['soa', 'soa_bpm', 'osb_soa', 'osb_soa_bpm']
  $bpm_enabled = $wls_profile::install_type in ['bpm', 'soa_bpm', 'osb_soa_bpm', 'wc_wcc_bpm']
  $osb_enabled = $wls_profile::install_type in ['osb', 'osb_soa', 'osb_soa_bpm']
  $bam_enabled = $wls_profile::install_type in ['bam']
  $oam_enabled = $wls_profile::install_type in ['oam']
  $oim_enabled = $wls_profile::install_type in ['oim']
  $b2b_enabled = $wls_profile::install_type in ['b2b']
  $ess_enabled = $wls_profile::install_type in ['ess']
  $bi_enabled = $wls_profile::install_type in ['bi']

  # lint:ignore:variable_scope
  wls_install::utils::fmwcluster { $wls_profile::cluster_name:
    domain_name               => $wls_profile::domain_name,
    middleware_home_dir       => $middleware_home,
    wls_domains_dir           => $wls_profile::domains_dir,
    jdk_home_dir              => $jdk_home,
    weblogic_user             => $wls_profile::weblogic_user,
    weblogic_password         => $wls_profile::weblogic_password,
    adminserver_address       => $wls_profile::adminserver_address,
    adminserver_port          => $wls_profile::adminserver_port,
    soa_cluster_name          => $wls_profile::cluster_name,
    bam_cluster_name          => $wls_profile::cluster_name,
    osb_cluster_name          => $wls_profile::cluster_name,
    oam_cluster_name          => $wls_profile::cluster_name,
    oim_cluster_name          => $wls_profile::cluster_name,
    ess_cluster_name          => $wls_profile::cluster_name,
    bi_cluster_name           => $wls_profile::cluster_name,
    soa_enabled               => $soa_enabled,
    bpm_enabled               => $bpm_enabled,
    bam_enabled               => $bam_enabled,
    osb_enabled               => $osb_enabled,
    oam_enabled               => $oam_enabled,
    oim_enabled               => $oim_enabled,
    b2b_enabled               => $b2b_enabled,
    ess_enabled               => $ess_enabled,
    bi_enabled                => $bi_enabled,
    jsse_enabled              => $jsse_enabled,
    custom_trust              => $custom_trust,
    trust_keystore_file       => $trust_keystore_file,
    trust_keystore_passphrase => $trust_keystore_passphrase,
    os_user                   => $wls_profile::os_user,
    os_group                  => $wls_profile::os_group,
    download_dir              => $wls_profile::download_dir,
    logoutput                 => $logoutput,
  }
  # lint:endignore:variable_scope
}
