#
# wls_profile::weblogic::wls_software
#
# @summary This class is the default implementation for installing the WebLogic software on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic::wls_software (
  String[1] $file_name,
  Boolean   $fmw_infra,
  Stdlib::Absolutepath
  $jdk_home,
  Stdlib::Absolutepath
  $middleware_home,
  Stdlib::Absolutepath
  $oracle_base,
  String[1] $os_group,
  String[1] $os_user,
  String[1] $source,
  Wls_install::Versions
  $version  = $wls_profile::weblogic_version
) inherits wls_profile {
  echo { "WebLogic Software ${version} into ${middleware_home} using java in ${jdk_home}.":
    withpath => false,
  }

  class { 'wls_install::software':
    version              => $version,
    filename             => $file_name,
    oracle_base_home_dir => $oracle_base,
    middleware_home_dir  => $middleware_home,
    fmw_infra            => $fmw_infra,
    jdk_home_dir         => $jdk_home,
    os_user              => $os_user,
    os_group             => $os_group,
    download_dir         => $wls_profile::download_dir,
    temp_directory       => $wls_profile::temp_dir,
    source               => $source,
  }
  contain wls_install::software
}
