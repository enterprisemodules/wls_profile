# wls_profile::weblogic::wls_startup
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::wls_startup
class wls_profile::basic_domain::wls_startup(
  String[1] $domain_name,
  Wls_install::Versions
            $version,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $domains_dir,
  Stdlib::Absolutepath
            $log_dir,
  String[1] $os_user,
) {
  echo {"WebLogic startup for domain ${domain_name}":
    withpath => false,
  }

  wls_install::support::nodemanagerautostart{"${domain_name}_nodemanager":
    version     => $version,
    wl_home     => $weblogic_home,
    log_dir     => $log_dir,
    user        => $os_user,
    domain      => $domain_name,
    domain_path => "${domains_dir}/${domain_name}",
  }
}


