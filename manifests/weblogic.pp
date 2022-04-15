#
# wls_profile::weblogic
#
# @summary 
# This is a highly customizable Puppet profile class to install the  WebLogic software and its requirements on your system. At its core, just adding:```contain wls_profile::weblogic```is enough to get the WebLogic software installed on your system. But sometimes, you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.## StagesDefining and starting a WebLogic Admin Server on your system goes through several stages(These are not puppet stages):- [`sysctl`](/docs/wls_profile/sysctl.html)            Set required sysctl parameters- [`limits`](/docs/wls_profile/limits.html)            Set OS security limits- [`packages`](/docs/wls_profile/packages.html)          Install required packages- [`groups_and_users`](/docs/wls_profile/groups_and_users.html)  Create required OS users and groups- [`ssh_setup`](/docs/wls_profile/ssh_setup.html)         Setup SSH for accounts- [`firewall`](/docs/wls_profile/firewall.html)          Setup the firewall- [`java_software`](/docs/wls_profile/java_software.html)     Install the java software- [`wls_software`](/docs/wls_profile/wls_software.html)      Install the WebLogic software- [`wls_patches`](/docs/wls_profile/wls_patches.html)       Install the WebLogic patchesAll these stages have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. ## before classesBut sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `packages` stage is done and before the `groups_and_users` is done. You can do this by adding the following line to your yaml data:```yamlwls_profile::weblogic::groups_and_users:   my_profile::my_extra_class```## after classesYou can do the same when you want to add code after one of the stage classes:```yamlwls_profile::weblogic::firewall:   my_profile::my_extra_class```## SkippingSometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:```yamlwls_profile::weblogic::java_software:   skip```## ReplacingOr provide your own implementation:```yamlwls_profile::weblogic::wls_datasources:   my_profile::my_own_implementation```This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard WebLogic software installation to a fully customized setup using a lot of your own classes plugged in.Look at the description of the stages and their properties.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic (
  Optional[String] $after_em_license = undef,
  Optional[String] $after_firewall = undef,
  Optional[String] $after_fmw_software = undef,
  Optional[String] $after_groups_and_users = undef,
  Optional[String] $after_java_software = undef,
  Optional[String] $after_limits = undef,
  Optional[String] $after_packages = undef,
  Optional[String] $after_ssh_setup = undef,
  Optional[String] $after_sysctl = undef,
  Optional[String] $after_wls_opatch = undef,
  Optional[String] $after_wls_patches = undef,
  Optional[String] $after_wls_software = undef,
  Optional[String] $before_em_license = undef,
  Optional[String] $before_firewall = undef,
  Optional[String] $before_fmw_software = undef,
  Optional[String] $before_groups_and_users = undef,
  Optional[String] $before_java_software = undef,
  Optional[String] $before_limits = undef,
  Optional[String] $before_packages = undef,
  Optional[String] $before_ssh_setup = undef,
  Optional[String] $before_sysctl = undef,
  Optional[String] $before_wls_opatch = undef,
  Optional[String] $before_wls_patches = undef,
  Optional[String] $before_wls_software = undef,
  Optional[String] $em_license = undef,
  Optional[String] $firewall = undef,
  Optional[String] $fmw_software = undef,
  Optional[String] $groups_and_users = undef,
  Optional[String] $java_software = undef,
  Optional[String] $limits = undef,
  Optional[String] $packages = undef,
  Optional[String] $ssh_setup = undef,
  Optional[String] $sysctl = undef,
  Optional[String] $wls_opatch = undef,
  Optional[String] $wls_patches = undef,
  Optional[String] $wls_software = undef
) inherits wls_profile {
  $install_fusion = $wls_profile::install_type in ['forms','ohs_standalone','osb','osb_soa','osb_soa_bpm','soa','soa_bpm','bam','oim','oud','wc','wc_wcc_bpm']

  if $install_fusion or $wls_profile::install_type == 'adf' {
    # If we install anything else then basic weblogic, we fmw_infra to be true
    class { 'wls_profile::weblogic::wls_software':
      fmw_infra => true,
    }
  }

  include wls_install    # Do the basic setup like fact caching etc

  easy_type::ordered_steps([
      'wls_profile::weblogic::em_license',
      ['wls_profile::weblogic::sysctl',           { 'implementation' => 'easy_type::profile::sysctl' }],
      ['wls_profile::weblogic::limits',           { 'implementation' => 'easy_type::profile::limits' }],
      ['wls_profile::weblogic::packages',         { 'implementation' => 'easy_type::profile::packages' }],
      ['wls_profile::weblogic::groups_and_users', { 'implementation' => 'easy_type::profile::groups_and_users' }],
      'wls_profile::weblogic::ssh_setup',
      ['wls_profile::weblogic::firewall',         { 'implementation' => 'easy_type::profile::firewall' }],
      'wls_profile::weblogic::java_software',
      'wls_profile::weblogic::wls_software',
      ['wls_profile::weblogic::fmw_software',     { 'onlyif' => $install_fusion }],
      'wls_profile::weblogic::wls_opatch',
      'wls_profile::weblogic::wls_patches',
  ])
}
