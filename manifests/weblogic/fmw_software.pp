#
# wls_profile::weblogic::fmw_software
#
# @summary This class is the default implementation for creating the required OS users and groups for the installation of WebLogic.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [Array[String[1]]] file_name
#    
#
# @param [Stdlib::Absolutepath] oracle_base
#    The directory used as the base for all Oracle weblogic files.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::oracle_base` to change it to your requested value.
#    Default value: `/opt/oracle`
#
# @param [Stdlib::Absolutepath] middleware_home
#    The Oracle middleware home directory.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12`
#
# @param [Stdlib::Absolutepath] weblogic_home
#    The directory used as WebLogic home
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12/wlserver`
#
# @param [Stdlib::Absolutepath] jdk_home
#    The location where the JDK is installed.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.
#    The default value is: `/usr/java/jdk1.8.0_152`
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
# @param [String[1]] source
#    The location where the classes can find the software.
#    You can specify a local directory, a Puppet url or an http url.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::source` to change it to your requested value.
#    The default is : `puppet:///modules/software/`
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
