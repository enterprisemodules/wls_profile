#
# wls_profile::node
#
# @summary 
# This is a highly customizable Puppet profile class to define a WebLogic node. At its core just adding:```contain wls_profile::node```Is enough to get the WebLogic software nstalled, fetch the domain definition from the Admin Server and start the node manager.But sometimes, you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.## StagesDefining and starting a WebLogic Admin Server on your system goes through several stages(These are not puppet stages):- [`weblogic`](./weblogic.html)     Setup the OS and install the WebLogic software- [`copy_domain`](./copy_domain.html)   Copy the packed domain from the AdminServer and start the Nodemanager- [`wls_startup`](./wls_startup.html)   Ensure WebLogic gets started after a reboot.All these stages have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. ## before classesBut sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `weblogic` stage is done and before the `copy_domain` is done. You can do this by adding the next line to your yaml data:```yamlwls_profile::node::before_copy_domain:   my_profile::my_extra_class```## after classesYou can do the same when you want to add code after one of the stage classes:```yamlwls_profile::node::wls_startup:   my_profile::my_extra_class```## SkippingSometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:```yamlwls_profile::node::pack_domain:   skip```## ReplacingOr provide your own implementation:```yamlwls_profile::admin_server::copy_domain:   my_profile::my_own_implementation```This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard WebLogic node server to a fully customized setup using a lot of your own classes plugged in.Look at the description of the stages and their properties.
#
# @param [Optional[String]] weblogic
#    Use this value if you want to skip or use your own class for stage `weblogic`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::weblogic:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::weblogic:  skip
#    ```
#
# @param [Optional[String]] copy_domain
#    Use this value if you want to skip or use your own class for stage `copy_domain`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::copy_domain:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::copy_domain:  skip
#    ```
#
# @param [Optional[String]] wls_startup
#    Use this value if you want to skip or use your own class for stage `wls_startup`.
#    ## Use your own class
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::wls_startup:  my_module::my_class
#    ```
#    ## Skip
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::wls_startup:  skip
#    ```
#
# @param [Optional[String]] before_weblogic
#    The name of the class you want to execute directly **before** the `weblogic` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::before_weblogic:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_copy_domain
#    The name of the class you want to execute directly **before** the `copy_domain` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::before_copy_domain:  my_module::my_class
#    ```
#
# @param [Optional[String]] before_wls_startup
#    The name of the class you want to execute directly **before** the `wls_startup` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::before_wls_startup:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_weblogic
#    The name of the class you want to execute directly **after** the `weblogic` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::after_weblogic:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_copy_domain
#    The name of the class you want to execute directly **after** the `copy_domain` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::after_copy_domain:  my_module::my_class
#    ```
#
# @param [Optional[String]] after_wls_startup
#    The name of the class you want to execute directly **after** the `wls_startup` class.
#    You can use hiera to set this value. Here is an example:
#    ```yaml
#    wls_profile::node::after_wls_startup:  my_module::my_class
#    ```
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::node (
  Optional[String] $weblogic = undef,
  Optional[String] $copy_domain = undef,
  Optional[String] $wls_startup = undef,
  Optional[String] $before_weblogic = undef,
  Optional[String] $before_copy_domain = undef,
  Optional[String] $before_wls_startup = undef,
  Optional[String] $after_weblogic = undef,
  Optional[String] $after_copy_domain = undef,
  Optional[String] $after_wls_startup = undef,
) inherits wls_profile {
  easy_type::ordered_steps([
    'wls_profile::weblogic',
    'wls_profile::node::copy_domain',
    'wls_profile::basic_domain::wls_startup',
  ])
}
