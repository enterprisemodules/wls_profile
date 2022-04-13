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
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic::wls_patches (
  String[1]           $adminserver_address,
  Integer             $adminserver_port,
  Boolean             $custom_trust,
  Stdlib::Absolutepath
  $domains_dir,
  String[1]           $jdk_home,
  Boolean             $jsse_enabled,
  String[1]           $level,
  Hash                $list,
  String[1]           $middleware_home,
  String[1]           $nodemanager_address,
  Integer             $nodemanager_port,
  String[1]           $orainst_dir,
  String[1]           $os_group,
  String[1]           $os_user,
  Hash                $patch_levels,
  Optional[String[1]] $trust_keystore_file,
  Integer             $version,
  Integer             $wait_for_nodemanager,
  Stdlib::Absolutepath
  $weblogic_home,
  Easy_type::Password $weblogic_password,
  String[1]           $weblogic_user,
  Variant[Boolean,Enum['on_failure']]
  $logoutput = lookup( { name => 'logoutput', default_value => 'on_failure' }),
  Optional[String[1]] $patch_window = undef
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

  $running_domains = wls_install::running_domains($middleware_home)
  if $needs_patches {
    if $running_domains in [[], undef] {
      $apply_patch_classes = true
      echo { 'Directly applying WebLogic patches because no domains are running from middleware home':
        withpath => false,
      }
      ensure_resources('wls_opatch', $complete_list, $defaults)
    } else {
      # One or more domains are already running in specfied home. If we have
      # specified a patch window, use it else ALWAYS skip patching.
      if $patch_window {
        echo { "Ensuring WebLogic patch(es) in patch window: ${patch_window}":
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
        wls_profile::weblogic::private::stop_managed_servers { $running_domains:
          schedule_name => 'wls_patch_window',
        }

        wls_profile::weblogic::private::start_managed_servers { $running_domains:
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

        ensure_resources('wls_opatch', $complete_list, $defaults.merge( {
              'schedule' => 'wls_patch_window',
              'before'   => Wls_profile::Weblogic::Private::Start_managed_servers[$running_domains],
              'require'  => Wls_profile::Weblogic::Private::Stop_managed_servers[$running_domains],
          })
        )
      } else {
        echo { 'Skipping WebLogic patching because no patch window specified.':
          withpath => false,
        }
      }
    }
} }
