
This is a highly customizable Puppet profile class to define a WebLogic Software and its requirements on your system. At its core just adding:

```
contain wls_profile::weblogic
```

Is enough to get a WebLogic 12.2.1.3 installed on your system. 

But sometimes you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.

## Stages

Defining and starting a WebLogic Admin Server on you system goes through several stages(These are not puppet stages):

- [`sysctl`](/docs/wls_profile/sysctl.html)            Set required sysctl parameters
- [`limits`](/docs/wls_profile/limits.html)            Set OS security limits
- [`packages`](/docs/wls_profile/packages.html)          Install required packages
- [`groups_and_users`](/docs/wls_profile/groups_and_users.html)  Create required OS users and groups
- [`ssh_setup`](/docs/wls_profile/ssh_setup.html)         Setup SSH for accounts
- [`firewall`](/docs/wls_profile/firewall.html)          Setup the firewall
- [`java_software`](/docs/wls_profile/java_software.html)     Install the java software
- [`wls_software`](/docs/wls_profile/wls_software.html)      Install the WebLogic software
- [`wls_patches`](/docs/wls_profile/wls_patches.html)       Install the WebLogic patches

All these stages have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. 

## before classes

But sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `packages` stage is done and before the `groups_and_users` is done. You can do this by adding the next line to your yaml data:

```yaml
wls_profile::weblogic::groups_and_users:   my_profile::my_extra_class
```

## after classes

You can do the same when you want to add code after one of the stage classes:

```yaml
wls_profile::weblogic::firewall:   my_profile::my_extra_class
```

## Skipping

Sometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:

```yaml
wls_profile::weblogic::java_software:   skip
```

## Replacing

Or provide your own implementation:

```yaml
wls_profile::weblogic::wls_datasources:   my_profile::my_own_implementation
```

This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard WebLogic software installation to a fully customized setup using a lot of your own classes plugged in.

Look at the description of the stages and their properties.


<%- include_attributes [
  :sysctl,
  :limits,
  :packages,
  :groups_and_users,
  :ssh_setup,
  :firewall,
  :java_software,
  :wls_software,
  :wls_patches,
  :before_sysctl,
  :before_limits,
  :before_packages,
  :before_groups_and_users,
  :before_ssh_setup,
  :before_firewall,
  :before_java_software,
  :before_wls_software,
  :before_wls_patches,
  :after_sysctl,
  :after_limits,
  :after_packages,
  :after_groups_and_users,
  :after_ssh_setup,
  :after_firewall,
  :after_java_software,
  :after_wls_software,
  :after_wls_patches,
] %>
