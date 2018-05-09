---
title: weblogic
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview


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





## Attributes



Attribute Name                                               | Short Description                                                                           |
------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
[after_firewall](#weblogic_after_firewall)                   | The name of the class you want to execute directly **after** the `firewall` class.          |
[after_groups_and_users](#weblogic_after_groups_and_users)   | The name of the class you want to execute directly **after** the `groups_and_usesr` class.  |
[after_java_software](#weblogic_after_java_software)         | The name of the class you want to execute directly **after** the `java_software` class.     |
[after_limits](#weblogic_after_limits)                       | The name of the class you want to execute directly **after** the `limits` class.            |
[after_packages](#weblogic_after_packages)                   | The name of the class you want to execute directly **after** the `packages` class.          |
[after_ssh_setup](#weblogic_after_ssh_setup)                 | The name of the class you want to execute directly **after** the `ssh_setup` class.         |
[after_sysctl](#weblogic_after_sysctl)                       | The name of the class you want to execute directly **after** the `sysctl` class.            |
[after_wls_patches](#weblogic_after_wls_patches)             | The name of the class you want to execute directly **after** the `wls_patches` class.       |
[after_wls_software](#weblogic_after_wls_software)           | The name of the class you want to execute directly **after** the `wls_software` class.      |
[before_firewall](#weblogic_before_firewall)                 | The name of the class you want to execute directly **before** the `firewall` class.         |
[before_groups_and_users](#weblogic_before_groups_and_users) | The name of the class you want to execute directly **before** the `groups_and_users` class. |
[before_java_software](#weblogic_before_java_software)       | The name of the class you want to execute directly **before** the `java_software` class.    |
[before_limits](#weblogic_before_limits)                     | The name of the class you want to execute directly **before** the `limits` class.           |
[before_packages](#weblogic_before_packages)                 | The name of the class you want to execute directly **before** the `packages` class.         |
[before_ssh_setup](#weblogic_before_ssh_setup)               | The name of the class you want to execute directly **before** the `ssh_setup` class.        |
[before_sysctl](#weblogic_before_sysctl)                     | The name of the class you want to execute directly **before** the `sysctl` class.           |
[before_wls_patches](#weblogic_before_wls_patches)           | The name of the class you want to execute directly **before** the `wls_patches` class.      |
[before_wls_software](#weblogic_before_wls_software)         | The name of the class you want to execute directly **before** the `wls_software` class.     |
[firewall](#weblogic_firewall)                               | Use this value if you want to skip or use your own class for stage `firewall`.              |
[groups_and_users](#weblogic_groups_and_users)               | Use this value if you want to skip or use your own class for stage `groups_and_users`.      |
[java_software](#weblogic_java_software)                     | Use this value if you want to skip or use your own class for stage `java_software`.         |
[limits](#weblogic_limits)                                   | Use this value if you want to skip or use your own class for stage `limits`.                |
[packages](#weblogic_packages)                               | Use this value if you want to skip or use your own class for stage `packages`.              |
[ssh_setup](#weblogic_ssh_setup)                             | Use this value if you want to skip or use your own class for stage `ssh_setup`.             |
[sysctl](#weblogic_sysctl)                                   | Use this value if you want to skip or use your own class for stage `sysctl`.                |
[wls_patches](#weblogic_wls_patches)                         | Use this value if you want to skip or use your own class for stage `wls_patches`.           |
[wls_software](#weblogic_wls_software)                       | Use this value if you want to skip or use your own class for stage `wls_software`.          |




### sysctl<a name='weblogic_sysctl'>

Use this value if you want to skip or use your own class for stage `sysctl`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::sysctl:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::sysctl:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### limits<a name='weblogic_limits'>

Use this value if you want to skip or use your own class for stage `limits`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::limits:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::limits:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### packages<a name='weblogic_packages'>

Use this value if you want to skip or use your own class for stage `packages`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::packages:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::packages:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### groups_and_users<a name='weblogic_groups_and_users'>

Use this value if you want to skip or use your own class for stage `groups_and_users`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::groups_and_users:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::groups_and_users:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### ssh_setup<a name='weblogic_ssh_setup'>

Use this value if you want to skip or use your own class for stage `ssh_setup`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::ssh_setup:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::ssh_setup:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### firewall<a name='weblogic_firewall'>

Use this value if you want to skip or use your own class for stage `firewall`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::firewall:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::firewall:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### java_software<a name='weblogic_java_software'>

Use this value if you want to skip or use your own class for stage `java_software`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::java_software:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::java_software:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### wls_software<a name='weblogic_wls_software'>

Use this value if you want to skip or use your own class for stage `wls_software`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::wls_software:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::wls_software:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### wls_patches<a name='weblogic_wls_patches'>

Use this value if you want to skip or use your own class for stage `wls_patches`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::wls_patches:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::wls_patches:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_sysctl<a name='weblogic_before_sysctl'>

The name of the class you want to execute directly **before** the `sysctl` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_sysctl:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_limits<a name='weblogic_before_limits'>

The name of the class you want to execute directly **before** the `limits` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_limits:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_packages<a name='weblogic_before_packages'>

The name of the class you want to execute directly **before** the `packages` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_packages:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_groups_and_users<a name='weblogic_before_groups_and_users'>

The name of the class you want to execute directly **before** the `groups_and_users` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_groups_and_users:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_ssh_setup<a name='weblogic_before_ssh_setup'>

The name of the class you want to execute directly **before** the `ssh_setup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_ssh_setup:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_firewall<a name='weblogic_before_firewall'>

The name of the class you want to execute directly **before** the `firewall` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_firewall:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_java_software<a name='weblogic_before_java_software'>

The name of the class you want to execute directly **before** the `java_software` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_java_software:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_wls_software<a name='weblogic_before_wls_software'>

The name of the class you want to execute directly **before** the `wls_software` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_wls_software:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### before_wls_patches<a name='weblogic_before_wls_patches'>

The name of the class you want to execute directly **before** the `wls_patches` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_wls_patches:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_sysctl<a name='weblogic_after_sysctl'>

The name of the class you want to execute directly **after** the `sysctl` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_sysctl:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_limits<a name='weblogic_after_limits'>

The name of the class you want to execute directly **after** the `limits` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_limits:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_packages<a name='weblogic_after_packages'>

The name of the class you want to execute directly **after** the `packages` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_packages:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_groups_and_users<a name='weblogic_after_groups_and_users'>

The name of the class you want to execute directly **after** the `groups_and_usesr` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_groups_and_usesr:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_ssh_setup<a name='weblogic_after_ssh_setup'>

The name of the class you want to execute directly **after** the `ssh_setup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_ssh_setup:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_firewall<a name='weblogic_after_firewall'>

The name of the class you want to execute directly **after** the `firewall` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_firewall:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_java_software<a name='weblogic_after_java_software'>

The name of the class you want to execute directly **after** the `java_software` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_java_software:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_wls_software<a name='weblogic_after_wls_software'>

The name of the class you want to execute directly **after** the `wls_software` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_wls_software:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)

### after_wls_patches<a name='weblogic_after_wls_patches'>

The name of the class you want to execute directly **after** the `wls_patches` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_wls_patches:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of weblogic](#attributes)
