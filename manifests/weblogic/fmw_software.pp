#
# wls_profile::weblogic::fmw_software
#
# @summary This class is the default implementation for creating the required OS users and groups for the installation of WebLogic.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic::fmw_software (
  Array[String[1]] $file_name,
  Stdlib::Absolutepath
  $jdk_home,
  Stdlib::Absolutepath
  $middleware_home,
  Stdlib::Absolutepath
  $oracle_base,
  String[1] $os_group,
  String[1] $os_user,
  String[1] $source,
  Stdlib::Absolutepath
  $weblogic_home,
  Wls_install::Versions
  $version  = $wls_profile::weblogic_version
) inherits wls_profile {
  wls_install::fmw { $file_name[0]:
    version              => $version,
    fmw_file1            => $file_name[0],
    fmw_file2            => $file_name[1],
    fmw_file3            => $file_name[2],
    fmw_file4            => $file_name[3],
    fmw_product          => $wls_profile::install_type,
    source               => $source,
    oracle_base_home_dir => $oracle_base,
    weblogic_home_dir    => $weblogic_home,
    middleware_home_dir  => $middleware_home,
    jdk_home_dir         => $jdk_home,
    os_user              => $os_user,
    os_group             => $os_group,
    download_dir         => $wls_profile::download_dir,
    temp_directory       => $wls_profile::temp_dir,
  }
}
