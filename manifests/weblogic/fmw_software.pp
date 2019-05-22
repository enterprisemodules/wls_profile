#++--++
#--++--
# lint:ignore:variable_scope
class wls_profile::weblogic::fmw_software(
  Array[String[1]] $file_name,
  Stdlib::Absolutepath
            $oracle_base,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $jdk_home,
  String[1] $os_user,
  String[1] $os_group,
  String[1] $source,
  Wls_install::Versions
            $version  = $wls_profile::weblogic_version,
) inherits wls_profile {

  wls_install::fmw{$file_name[0]:
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
    download_dir         => $download_dir,
    temp_directory       => $temp_dir,
  }
}
# lint:endignore:variable_scope
