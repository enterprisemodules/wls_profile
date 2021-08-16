#
# wls_profile::weblogic::wls_patches
#
# @summary This class is the default implementation for ensuring your WebLogic software has all the required patches installed.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
# 
# The easiest and best way to specify your patches is to specify a `level`. An example of a patch level is `JAN2021RU`, meaning the JAN 2021 patch level update.
# 
# You can also add additional 'one-off's'. Use the `list` property to add these.
# 
# When you don't specify a patch windows, Puppet will never patch a running domain. It will however provide your installations with the specified patch level at the initial run or when the WebLogic domain is not running at the start of the Puppet run.
#
# @param [String[1]] level
#    The specified patch level.
#    The default value is 'NONE'.
#
# @param [Integer] version
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
# @param [String[1]] middleware_home
#    The Oracle middleware home directory.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12`
#
# @param [String[1]] orainst_dir
#    The directory where the orainst file is located.
#
# @param [String[1]] jdk_home
#    The location where the JDK is installed.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.
#    The default value is: `/usr/java/jdk1.8.0_152`
#
# @param [String[1]] os_user
#    The os user to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.
#    Default value: `oracle`
#
# @param [Hash] list
#    A Hash describing the WebLogic patches you want be installed.
#    Default value is: `{}`
#
# @param [Stdlib::Absolutepath] domains_dir
#    The top-level directory where the domain directories will reside in.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.
#    The default value is:  `/opt/oracle/domains`
#
# @param [Stdlib::Absolutepath] weblogic_home
#    The directory used as WebLogic home
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.
#    Default value: `/opt/oracle/middleware12/wlserver`
#
# @param [String[1]] os_group
#    The os group to use for WebLogic.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.
#    Default value: `dba`
#
# @param [String[1]] weblogic_user
#    The WebLogic user account to bear all administration rights.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.
#    Default value: `weblogic`
#
# @param [Easy_type::Password] weblogic_password
#    The password for the WebLogic account.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.
#    Default value: `Welcome01`
#
# @param [Integer] adminserver_port
#    The IP port the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.
#    The default value is:  `7001`
#
# @param [Integer] nodemanager_port
#    The IP port the nodemanager listens on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::nodemanager_port` to change it to your requested value.
#    Default value: `5556`
#
# @param [Integer] wait_for_nodemanager
#    The time in seconds we wait for the nodemanager to be started in the restart phase of the patching.
#
# @param [String[1]] nodemanager_address
#    The IP address the nodemanager will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.
#    Default value: `::fqdn`
#
# @param [String[1]] adminserver_address
#    The address the admin server process will run and listen on.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.
#    The default value is: The fact `fqdn`
#
# @param [Boolean] jsse_enabled
#    Determine if you want to enable JSSE security.
#
# @param [Boolean] custom_trust
#    Determine if you want to use a custom trust or not.
#
# @param [Optional[String[1]]] trust_keystore_file
#    File specification of the trust keystore.
#
# @param [Optional[String[1]]] patch_window
#    The service window in which any patching will be executed.
#
#
# @param [Variant[Boolean, Enum['on_failure']]] logoutput
#    log the outputs of Puppet exec and wls_exec or not.
#    When you specify `true` Puppet will log all output of `exec` types.
#    Valid values are:
#    - `true`
#    - `false`
#    - `on_failure`
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic::wls_patches(
  String[1]           $level,
  Integer             $version,
  String[1]           $middleware_home,
  String[1]           $orainst_dir,
  String[1]           $jdk_home,
  String[1]           $os_user,
  Hash                $list,
  Hash                $patch_levels,
  Stdlib::Absolutepath
                      $domains_dir,
  Stdlib::Absolutepath
                      $weblogic_home,
  String[1]           $os_group,
  String[1]           $weblogic_user,
  Easy_type::Password $weblogic_password,
  Integer             $adminserver_port,
  Integer             $nodemanager_port,
  Integer             $wait_for_nodemanager,
  String[1]           $nodemanager_address,
  String[1]           $adminserver_address,
  Boolean             $jsse_enabled,
  Boolean             $custom_trust,
  Optional[String[1]] $trust_keystore_file,
  Optional[String[1]] $patch_window = undef,
  Variant[Boolean,Enum['on_failure']]
                      $logoutput = lookup({name => 'logoutput', default_value => 'on_failure'}),

) {
  $defaults = {
    ensure       => 'present',
    os_user      => $os_user,
    jdk_home_dir => $jdk_home,
    orainst_dir  => $orainst_dir,
  }

  if ( $list.keys.size > 0 ) {
    #
    # Report patch level AND any one-off's specified
    #
    echo { "Ensure WebLogic patch level ${level} on ${middleware_home} and patch list ${list.keys.join(',')}":
      withpath => false,
    }
  } else {
    #
    # Report only patch level.
    #
    echo { "Ensure WebLogic patch level ${level} on ${middleware_home}":
      withpath => false,
    }
  }

  #
  # Determine the full list of patches that have to be available
  # on the system by adding the patches in the patch level
  # and the patches in the specified patch list.
  #
  if ( has_key($patch_levels["${version}"], $level) ) {
    $patch_level_list = $patch_levels["${version}"][$level]
  } else {
    $patch_level_list = {}
  }
  $complete_list = ($patch_level_list + $list)

  #
  # No compare the list of required patches with the current state of the
  # system and decide what needs to be done.
  #
  # converted_list contains all the patches in simple notation which is used for
  # echo and to check if any patches need to be installed
  #
  $converted_list = wls_install::wls_physical_patches($complete_list)
  #
  # list_to_apply is the hash with patches that need to be applied, 
  # without patches that have already been applied
  #
  $list_to_apply = wls_install::wls_patches_missing($complete_list)

  if ( $list_to_apply.keys.length == 0 ) {
    echo { 'All WebLogic patches already installed. No more patching required.':
      withpath => false,
    }
    $needs_patches = false
  } else {
    $needs_patches = true
  }

  easy_type::debug_evaluation() # Show local variable on extended debug

  $running_domains = dig($::facts['wls_install_homes'],$middleware_home,'running_domains')
  if $needs_patches {
    if $running_domains in [[], undef] {
      $apply_patch_classes = true
      echo {'Directly applying WebLogic patches because no domains are running from middleware home':
        withpath => false,
      }
      ensure_resources('wls_opatch', $complete_list, $defaults)
    } else {
      # One or more domains are already running in specfied home. If we have
      # specified a patch window, use it else ALWAYS skip patching.
      if $patch_window {
        echo {"Ensuring WebLogic patch(es) in patch window: ${patch_window}":
          withpath => false,
        }
        #
        # Ensure the patch window and add it to patches beeing applied
        #
        schedule { 'wls_patch_window':
          range  => $patch_window,
        }

        #
        # Because of a [bug in Puppet (PUP-6743)](https://tickets.puppetlabs.com/browse/PUP-6743) 
        # we cannot use the schedule on the defined type level. As a work arround, 
        # we pass in the string value and us it in the defined type
        #
        wls_profile::weblogic::private::stop_domain { $running_domains:
          schedule_name => 'wls_patch_window',
        }

        wls_profile::weblogic::private::start_domain { $running_domains:
          domains_dir          => $domains_dir,
          weblogic_home        => $weblogic_home,
          middleware_home      => $middleware_home,
          jdk_home             => $jdk_home,
          os_user              => $os_user,
          os_group             => $os_group,
          weblogic_user        => $weblogic_user,
          weblogic_password    => $weblogic_password,
          adminserver_address  => $adminserver_address,
          adminserver_port     => $adminserver_port,
          nodemanager_port     => $nodemanager_port,
          jsse_enabled         => $jsse_enabled,
          custom_trust         => $custom_trust,
          trust_keystore_file  => $trust_keystore_file,
          wait_for_nodemanager => $wait_for_nodemanager,
          schedule_name        => 'wls_patch_window',
        }

        ensure_resources('wls_opatch', $complete_list, $defaults.merge({
          'schedule' => 'wls_patch_window',
          'before'   => Wls_profile::Weblogic::Private::Start_domain[$running_domains],
          'require'  => Wls_profile::Weblogic::Private::Stop_domain[$running_domains]
          })
        )
      } else {
        echo {'Skipping WebLogic patching because no patch window specified.':
          withpath => false,
        }
      }
    }
  }
}

