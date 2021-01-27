#++--++
#
# wls_profile::weblogic
#
# @summary
# This is a highly customizable Puppet profile class to define a WebLogic Software and its requirements on your system. At its core just adding:```contain wls_profile::weblogic```Is enough to get a WebLogic 12.2.1.3 installed on your system. But sometimes you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.## stepsDefining and starting a WebLogic Admin Server on you system goes through several steps:- [`sysctl`](/docs/wls_profile/sysctl.html)            Set required sysctl parameters- [`limits`](/docs/wls_profile/limits.html)            Set OS security limits- [`packages`](/docs/wls_profile/packages.html)          Install required packages- [`groups_and_users`](/docs/wls_profile/groups_and_users.html)  Create required OS users and groups- [`ssh_setup`](/docs/wls_profile/ssh_setup.html)         Setup SSH for accounts- [`firewall`](/docs/wls_profile/firewall.html)          Setup the firewall- [`java_software`](/docs/wls_profile/java_software.html)     Install the java software- [`wls_software`](/docs/wls_profile/wls_software.html)      Install the WebLogic software- [`wls_patches`](/docs/wls_profile/wls_patches.html)       Install the WebLogic patchesAll these steps have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. ## before classesBut sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `packages` stage is done and before the `groups_and_users` is done. You can do this by adding the next line to your yaml data:```yamlwls_profile::weblogic::groups_and_users:   my_profile::my_extra_class```## after classesYou can do the same when you want to add code after one of the stage classes:```yamlwls_profile::weblogic::firewall:   my_profile::my_extra_class```## SkippingSometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:```yamlwls_profile::weblogic::java_software:   skip```## ReplacingOr provide your own implementation:```yamlwls_profile::weblogic::wls_datasources:   my_profile::my_own_implementation```This mechanism can be used for all named steps and makes it easy to move from an easy setup with a running standard WebLogic software installation to a fully customized setup using a lot of your own classes plugged in.Look at the description of the steps and their properties.
#
# @param [Optional[String]] sysctl
#    Use this value if you want to skip or use your own class for stage `sysctl`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::sysctl:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::sysctl:  skip
#    ```
#
# @param [Optional[String]] limits
#    Use this value if you want to skip or use your own class for stage `limits`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::limits:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::limits:  skip
#    ```
#
# @param [Optional[String]] packages
#    Use this value if you want to skip or use your own class for stage `packages`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::packages:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::packages:  skip
#    ```
#
# @param [Optional[String]] groups_and_users
#    Use this value if you want to skip or use your own class for stage `groups_and_users`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::groups_and_users:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::groups_and_users:  skip
#    ```
#
# @param [Optional[String]] ssh_setup
#    Use this value if you want to skip or use your own class for stage `ssh_setup`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::ssh_setup:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::ssh_setup:  skip
#    ```
#
# @param [Optional[String]] firewall
#    Use this value if you want to skip or use your own class for stage `firewall`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::firewall:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::firewall:  skip
#    ```
#
# @param [Optional[String]] java_software
#    Use this value if you want to skip or use your own class for stage `java_software`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::java_software:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::java_software:  skip
#    ```
#
# @param [Optional[String]] wls_software
#    Use this value if you want to skip or use your own class for stage `wls_software`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::wls_software:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::wls_software:  skip
#    ```
#
# @param [Optional[String]] wls_patches
#    Use this value if you want to skip or use your own class for stage `wls_patches`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::wls_patches:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::wls_patches:  skip
#    ```
#
# @param [Optional[String]] before_sysctl
#    The name of the class you want to execute directly **before** the `sysctl` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_sysctl:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_limits
#    The name of the class you want to execute directly **before** the `limits` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_limits:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_packages
#    The name of the class you want to execute directly **before** the `packages` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_packages:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_groups_and_users
#    The name of the class you want to execute directly **before** the `groups_and_users` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_groups_and_users:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_ssh_setup
#    The name of the class you want to execute directly **before** the `ssh_setup` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_ssh_setup:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_firewall
#    The name of the class you want to execute directly **before** the `firewall` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_firewall:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_java_software
#    The name of the class you want to execute directly **before** the `java_software` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_java_software:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_wls_software
#    The name of the class you want to execute directly **before** the `wls_software` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_wls_software:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_wls_patches
#    The name of the class you want to execute directly **before** the `wls_patches` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::before_wls_patches:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_sysctl
#    The name of the class you want to execute directly **after** the `sysctl` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_sysctl:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_limits
#    The name of the class you want to execute directly **after** the `limits` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_limits:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_packages
#    The name of the class you want to execute directly **after** the `packages` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_packages:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_groups_and_users
#    The name of the class you want to execute directly **after** the `groups_and_usesr` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_groups_and_usesr:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_ssh_setup
#    The name of the class you want to execute directly **after** the `ssh_setup` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_ssh_setup:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_firewall
#    The name of the class you want to execute directly **after** the `firewall` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_firewall:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_java_software
#    The name of the class you want to execute directly **after** the `java_software` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_java_software:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_wls_software
#    The name of the class you want to execute directly **after** the `wls_software` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_wls_software:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_wls_patches
#    The name of the class you want to execute directly **after** the `wls_patches` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::weblogic::after_wls_patches:  my_module::my_class
#    ```
#
#--++--
class wls_profile::weblogic (
  Optional[String] $before_em_license = undef,
  Optional[String] $em_license = undef,
  Optional[String] $after_em_license = undef,
  Optional[String] $sysctl = undef,
  Optional[String] $limits = undef,
  Optional[String] $packages = undef,
  Optional[String] $groups_and_users = undef,
  Optional[String] $ssh_setup = undef,
  Optional[String] $firewall = undef,
  Optional[String] $java_software = undef,
  Optional[String] $wls_software = undef,
  Optional[String] $fmw_software = undef,
  Optional[String] $wls_opatch = undef,
  Optional[String] $wls_patches = undef,
  Optional[String] $before_sysctl = undef,
  Optional[String] $before_limits = undef,
  Optional[String] $before_packages = undef,
  Optional[String] $before_groups_and_users = undef,
  Optional[String] $before_ssh_setup = undef,
  Optional[String] $before_firewall = undef,
  Optional[String] $before_java_software = undef,
  Optional[String] $before_wls_software = undef,
  Optional[String] $before_fmw_software = undef,
  Optional[String] $before_wls_opatch = undef,
  Optional[String] $before_wls_patches = undef,
  Optional[String] $after_sysctl = undef,
  Optional[String] $after_limits = undef,
  Optional[String] $after_packages = undef,
  Optional[String] $after_groups_and_users = undef,
  Optional[String] $after_ssh_setup = undef,
  Optional[String] $after_firewall = undef,
  Optional[String] $after_java_software = undef,
  Optional[String] $after_wls_software = undef,
  Optional[String] $after_fmw_software = undef,
  Optional[String] $after_wls_opatch = undef,
  Optional[String] $after_wls_patches = undef,
) inherits wls_profile {

  $install_fusion = $wls_profile::install_type in
    ['forms','ohs_standalone','osb','osb_soa','osb_soa_bpm','soa','soa_bpm','bam','oim','oud','wc','wc_wcc_bpm']

  if $install_fusion {
    # If we install anything else then basic weblogic, we fmw_infra to be true
    class { '::wls_profile::weblogic::wls_software':
      fmw_infra => true,
    }
  }

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
    ['wls_profile::weblogic::fmw_software',     { 'onlyif' => $install_fusion}],
    'wls_profile::weblogic::wls_opatch',
    'wls_profile::weblogic::wls_patches',
  ])
}
