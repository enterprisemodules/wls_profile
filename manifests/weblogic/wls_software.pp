# wls_profile::weblogic::wls_software
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::wls_software
class wls_profile::weblogic::wls_software(
  Wls_install::Versions
            $version,
  String[1] $file_name,
  Stdlib::Absolutepath
            $oracle_base,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $jdk_home,
  String[1] $os_user,
  String[1] $os_group,
  String[1] $source,
  Boolean   $fmw_infra,
) {
  echo {"WebLogic Software ${version} into ${middleware_home} using java in ${jdk_home}.":
    withpath => false
  }

  class{'::wls_install::software':
    version              => $version,
    filename             => $file_name,
    oracle_base_home_dir => $oracle_base,
    middleware_home_dir  => $middleware_home,
    fmw_infra            => $fmw_infra,
    jdk_home_dir         => $jdk_home,
    os_user              => $os_user,
    os_group             => $os_group,
    download_dir         => '/var/tmp/install',
    source               => $source,
  }
  contain ::wls_install::software
}
