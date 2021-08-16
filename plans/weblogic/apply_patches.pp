# @summary Apply the in hiera specified WebLogic patches to the specified target
#
# @example
#
#   bolt plan run wls_profile::weblogic::apply_patches targets=myserver1,myserver2
#
# This bolt plan applies the patches specified in the hieradata,
# to the node it is running on. Because the service window is set to 
# ALWAYS (virtualy that is), the patching will start immediately. If the 
# WebLogic domain is running, it will be stopped before the patches
# are applied and started after the patches are applied. It will only
# restart managed servers that were running before the patching started.#
#
# @param [TargetSpec] targets
#   The WebLogic node(s) you want to patch
#
#
# See the file "LICENSE" for the full license governing this code.
#
wls_plan wls_profile::weblogic::apply_patches(
  TargetSpec $targets,
) {
  #
  # Prepare the target(s) for use of EM licensed modules
  #
  easy_type::em_prep($targets)
  #
  # Under the hood the wls_patching class uses these facts, types
  # and providers. We also sync the em_license module to have
  # be able to access the available licenses
  #
  $used_modules = ['easy_type', 'wls_install', 'wls_config', 'wls_profile', 'wls_config', 'em_license']
  apply_prep($targets, {'required_modules' => $used_modules })

  #
  # Apply the wls_patching class to the target(s). This class will
  # do all the hard lifting for us.
  #
  $result = apply($targets, {'required_modules' => $used_modules, '_catch_errors' => true}) {
    class {'wls_profile::weblogic::wls_patches':
      patch_window => '00:00 - 23:59:59', # This will always trigger except in 1 second before midnight
      # patch_window => '00:00 - 23:59:59', # This will always trigger except in 1 second before midnight
    }
  }
  $target_result = $result.first()
  if $target_result.error {
    fail_plan($target_result.error())
    $target_result.report['logs'].each |$log| {
      out::message("${log['source']}: ${log['message']}")
    }
  } else {
    $target_result.report['logs'].each |$log| {
      out::message("${log['source']}: ${log['message']}")
    }
  }
}
