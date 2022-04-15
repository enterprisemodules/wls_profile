#
# wls_profile::basic_domain
#
# @summary 
# This is a highly customizable Puppet profile class to define a basic WebLogic (empty) domain on your system. At its core just adding:```contain wls_profile::basic_domain```Is enough to get an empty WebLogic domain running on your system. But sometimes you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.## StagesDefining and starting an empty basic WebLogic domain on you system goes through several stages(These are not puppet stages):- [`weblogic`](./weblogic.html) Install and patch the WebLogic software- [`wls_domain`](./wls_domain.html)    Create an empty WebLogic domain- [`wls_startup`](./wls_startup.html)   Make sure the domain restarts after a system reboot.All these stages have a default implementation. This implementation is suitable to get off to an easy start. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. ## before classesBut sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `weblogic` stage is done and before the `wls_domain` is done. You can do this by adding the next line to your yaml data:```yamlwls_profile::basic_domain::before_wls_domain:   my_profile::my_extra_class```## after classesYou can do the same when you want to add code after one of the stage classes:```yamlwls_profile::basic_domain::after_wls_domain:   my_profile::my_extra_class```## SkippingSometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:```yamlwls_profile::basic_domain::wls_startup:   skip```## ReplacingOr provide your own implementation:```yamlwls_profile::basic_domain::wls_domain:   my_profile::my_own_implementation```This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard WebLogic installation to a fully customized setup using a lot of your own classes plugged in.Look at the description of the stages and their properties.
#
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::basic_domain (
  Optional[String] $after_weblogic = undef,
  Optional[String] $after_wls_domain = undef,
  Optional[String] $after_wls_startup = undef,
  Optional[String] $before_weblogic = undef,
  Optional[String] $before_wls_domain = undef,
  Optional[String] $before_wls_startup = undef,
  Optional[String] $weblogic = undef,
  Optional[String] $wls_domain = undef,
  Optional[String] $wls_startup = undef
) inherits wls_profile {
  easy_type::ordered_steps([
      'wls_profile::weblogic',
      'wls_profile::basic_domain::wls_domain',
      'wls_profile::basic_domain::wls_startup',
  ])
}
