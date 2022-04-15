#
# wls_profile::basic_domain::wls_startup
#
# @summary This class is the default implementation for making sure WebLogic gets started after a system reboot.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::basic_domain::wls_startup (
  Boolean                       $custom_trust,
  String[1]                     $domain_name,
  Stdlib::Absolutepath          $domains_dir,
  Boolean                       $jsse_enabled,
  Stdlib::Absolutepath          $log_dir,
  String[1]                     $os_user,
  Optional[String[1]]           $trust_keystore_file,
  Stdlib::Absolutepath          $weblogic_home,
  #
  # We want the key trust_keystore_passphrase to connect to wls_profile::basic_domain::wls_domain::trust_keystore_passphrase. Normaly we would
  # do this inside of the hiera data, but because the valuecan also be undef, and the lookup conversion in hiera will transform this into a Sensitive[undef]
  # that will fail against the data type check Sensitive[String]. To work arround this issue, we do a lookup here and provide a default of undef.
  #
  Optional[Easy_type::Password] $trust_keystore_passphrase = lookup('wls_profile::basic_domain::wls_domain::trust_keystore_passphrase', { 'default_value' => undef }),
  Wls_install::Versions         $version                   = $wls_profile::weblogic_version
) inherits wls_profile {
  echo { "WebLogic startup for domain ${domain_name}":
    withpath => false,
  }

  case  $facts['os']['name'] {
    'RedHat', 'CentOS', 'OracleLinux', 'AlmaLinux', 'Rocky': {
      wls_install::support::nodemanagerautostart { "${domain_name}_nodemanager":
        version                   => $version,
        wl_home                   => $weblogic_home,
        log_dir                   => $log_dir,
        user                      => $os_user,
        domain                    => $domain_name,
        domain_path               => "${domains_dir}/${domain_name}",
        jsse_enabled              => $jsse_enabled,
        custom_trust              => $custom_trust,
        trust_keystore_file       => $trust_keystore_file,
        trust_keystore_passphrase => $trust_keystore_passphrase,
      }
    }
    default: {
      warning "Automatic startup for WebLogic not supported on  ${facts['os']['name']}"
    }
} }
