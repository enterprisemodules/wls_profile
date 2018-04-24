---
title: basic domain
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview


This is a highly customizable Puppet profile class to define an basic WebLogic (empty) domain on your system. In it's core just adding:

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

All these stages have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. 

## before classes

But sometimes this is not enough and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `weblogic` stage is done and before the `wls_domain` is done. You can do this by adding the next line to your yaml data:

```yaml
wls_profile::basic_domain::before_wls_domain:   my_profile::my_extra_class
```

## after classes

You can do the same when you want to add code after one of the stage classes:

```yaml
wls_profile::basic_domain::after_wls_domain:   my_profile::my_extra_class
```

## Skipping

Sometimes organisation use different modules and mechanisms to implement a feature and you want to skip the class:

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






## Attributes



Attribute Name                                         | Short Description                                                                      |
------------------------------------------------------ | -------------------------------------------------------------------------------------- |
[after_weblogic](#basic_domain_after_weblogic)         | The name of the class you want to execute directly **after** the `weblogic` class.     |
[after_wls_domain](#basic_domain_after_wls_domain)     | The name of the class you want to execute directly **after** the `wls_domain` class.   |
[after_wls_startup](#basic_domain_after_wls_startup)   | The name of the class you want to execute directly **after** the `wls_startup` class.  |
[before_weblogic](#basic_domain_before_weblogic)       | The name of the class you want to execute directly **before** the `weblogic` class.    |
[before_wls_domain](#basic_domain_before_wls_domain)   | The name of the class you want to execute directly **before** the `wls_domain` class.  |
[before_wls_startup](#basic_domain_before_wls_startup) | The name of the class you want to execute directly **before** the `wls_startup` class. |
[weblogic](#basic_domain_weblogic)                     | Use this value if you want to skip or use your own class for stage `weblogic`.         |
[wls_domain](#basic_domain_wls_domain)                 | Use this value if you want to skip or use your own class for stage `wls_domain`.       |
[wls_startup](#basic_domain_wls_startup)               | Use this value if you want to skip or use your own class for stage `wls_startup`.      |




### weblogic<a name='basic_domain_weblogic'>



Use this value if you want to skip or use your own class for stage `weblogic`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::weblogic:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::weblogic:  skip
```

[Back to overview of basic_domain](#attributes)


### wls_domain<a name='basic_domain_wls_domain'>



Use this value if you want to skip or use your own class for stage `wls_domain`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::wls_domain:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::wls_domain:  skip
```

[Back to overview of basic_domain](#attributes)


### wls_startup<a name='basic_domain_wls_startup'>



Use this value if you want to skip or use your own class for stage `wls_startup`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::wls_startup:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::wls_startup:  skip
```

[Back to overview of basic_domain](#attributes)


### before_weblogic<a name='basic_domain_before_weblogic'>



The name of the class you want to execute directly **before** the `weblogic` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::before_weblogic:  my_module::my_class
```

[Back to overview of basic_domain](#attributes)


### before_wls_domain<a name='basic_domain_before_wls_domain'>



The name of the class you want to execute directly **before** the `wls_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::before_wls_domain:  my_module::my_class
```

[Back to overview of basic_domain](#attributes)


### before_wls_startup<a name='basic_domain_before_wls_startup'>



The name of the class you want to execute directly **before** the `wls_startup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::before_wls_startup:  my_module::my_class
```

[Back to overview of basic_domain](#attributes)


### after_weblogic<a name='basic_domain_after_weblogic'>



The name of the class you want to execute directly **after** the `weblogic` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::after_weblogic:  my_module::my_class
```

[Back to overview of basic_domain](#attributes)


### after_wls_domain<a name='basic_domain_after_wls_domain'>



The name of the class you want to execute directly **after** the `wls_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::after_wls_domain:  my_module::my_class
```

[Back to overview of basic_domain](#attributes)


### after_wls_startup<a name='basic_domain_after_wls_startup'>



The name of the class you want to execute directly **after** the `wls_startup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::after_wls_startup:  my_module::my_class
```

[Back to overview of basic_domain](#attributes)

