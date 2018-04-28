
This is a highly customizable Puppet profile class to define a basic WebLogic (empty) domain on your system. At its core just adding:

```
contain wls_profile::basic_domain
```

Is enough to get an empty WebLogic 12.2.1.3. WebLogic domain running on your system. 

But sometimes you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.

## Stages

Defining and starting an empty basic WebLogic domain on you system goes through several stages(These are not puppet stages):

- [`weblogic`](./weblogic.html) Install and patch the WebLogic software
- [`wls_domain`](./wls_domain.html)    Create an empty WebLogic domain
- [`wls_startup`](./wls_startup.html)   Make sure the domain restarts after a system reboot.

All these stages have a default implementation. This implementation is suitable to get off to an easy start. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. 

## before classes

But sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `weblogic` stage is done and before the `wls_domain` is done. You can do this by adding the next line to your yaml data:

```yaml
wls_profile::basic_domain::before_wls_domain:   my_profile::my_extra_class
```

## after classes

You can do the same when you want to add code after one of the stage classes:

```yaml
wls_profile::basic_domain::after_wls_domain:   my_profile::my_extra_class
```

## Skipping

Sometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:

```yaml
wls_profile::basic_domain::wls_startup:   skip
```

## Replacing

Or provide your own implementation:

```yaml
wls_profile::basic_domain::wls_domain:   my_profile::my_own_implementation
```

This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard WebLogic installation to a fully customized setup using a lot of your own classes plugged in.

Look at the description of the stages and their properties.


<%- include_attributes [
  :weblogic,
  :wls_domain,
  :wls_startup,
  :before_weblogic,
  :before_wls_domain,
  :before_wls_startup,
  :after_weblogic,
  :after_wls_domain,
  :after_wls_startup,
] %>

