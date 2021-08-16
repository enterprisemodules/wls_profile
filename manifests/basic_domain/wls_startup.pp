#
# wls_profile::basic_domain::wls_startup
#
# @summary This class is the default implementation for making sure WebLogic gets started after a system reboot.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
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
# @param [String[1]] os_user
#    The os user to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.
#    Default value: `oracle`
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::basic_domain::wls_startup(
  String[1]                     $domain_name,
  Stdlib::Absolutepath          $weblogic_home,
  Stdlib::Absolutepath          $domains_dir,
  Stdlib::Absolutepath          $log_dir,
  String[1]                     $os_user,
  Boolean                       $jsse_enabled,
  Boolean                       $custom_trust,
  Optional[String[1]]           $trust_keystore_file,
  #
  # We want the key trust_keystore_passphrase to connect to wls_profile::basic_domain::wls_domain::trust_keystore_passphrase. Normaly we would
  # do this inside of the hiera data, but because the valuecan also be undef, and the lookup conversion in hiera will transform this into a Sensitive[undef]
  # that will fail against the data type check Sensitive[String]. To work arround this issue, we do a lookup here and provide a default of undef.
  #
  Optional[Easy_type::Password] $trust_keystore_passphrase = lookup('wls_profile::basic_domain::wls_domain::trust_keystore_passphrase', {'default_value' => undef}),
  Wls_install::Versions         $version                   = $wls_profile::weblogic_version,
) inherits wls_profile {
  echo {"WebLogic startup for domain ${domain_name}":
    withpath => false,
  }

  case  $::operatingsystem {
    'RedHat', 'CentOS', 'OracleLinux': {
      wls_install::support::nodemanagerautostart{"${domain_name}_nodemanager":
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
      warning "Automatic startup for WebLogic not supported on  ${::operatingsystem}"
    }
  }
}


