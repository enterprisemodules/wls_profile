#++--++
#
# wls_profile::pack_domain
#
# @summary This class is the default implementation for packing a domain on the current server.
# The packed domain can be used to create other WebLogic nodes in the same domain. When you are creating just a single node WebLogic server, you can skip this class.
# 
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin)_server](./admin)_server.html) for an explanation on how to do this.
#
# @param [String[1]] domain_name
#    The name of the WebLogic domain.
#    This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).
#    The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.
#    The default value is: `MYDOMAIN`
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
# @param [Stdlib::Absolutepath] domains_dir
#    The top-level directory where the domain directories will reside in.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.
#    The default value is:  `/opt/oracle/domains`
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
#--++--
class wls_profile::admin_server::pack_domain(
  String[1] $domain_name,
  Stdlib::Absolutepath
            $middleware_home,
  Stdlib::Absolutepath
            $weblogic_home,
  Stdlib::Absolutepath
            $jdk_home,
  Stdlib::Absolutepath
            $domains_dir,
  String[1] $os_user,
  String[1] $os_group,
) inherits wls_profile {
  echo {"WebLogic pack domain ${domain_name}":
    withpath => false,
  }
  #
  # This resource definition pack's the current definition of the domain. This packed domain file
  # can be used by other nodes in the cluster. They fetch it, unpack it and use it to enter the domain.
  # When the node is part of the domain, the packed file loses its value. Any changes in the domain are managed
  # by webLogic.
  #
  wls_install::packdomain{$domain_name:
    domain_name         => $domain_name,
    weblogic_home_dir   => $weblogic_home,
    middleware_home_dir => $middleware_home,
    jdk_home_dir        => $jdk_home,
    wls_domains_dir     => $domains_dir,
    os_user             => $os_user,
    os_group            => $os_group,
    download_dir        => "${domains_dir}/${domain_name}",
  }

}
