#++--++
#
# wls_profile::weblogic::wls_software
#
# @summary This class is the default implementation for installing the WebLogic software on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
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
#    Default value: `12213`
#
# @param [String[1]] file_name
#    The file name containing the WebLogic software to install.
#    This file is fetched from the location specified by the property `source`.
#    The default value is: `fmw_12.2.1.3.0_wls.jar`
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
# @param [Boolean] fmw_infra
#    Boolean specifying if you want WebLogic Fusion Middleware Infra installed.
#    Default value: `false`
#
#--++--
# lint:ignore:variable_scope
class wls_profile::weblogic::wls_software(
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
  Wls_install::Versions
            $version  = $wls_profile::weblogic_version,
) inherits wls_profile {
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
    download_dir         => $download_dir,
    temp_directory       => $temp_dir,
    source               => $source,
  }
  contain ::wls_install::software
}
# lint:endignore:variable_scope
