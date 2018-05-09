---
title: admin server
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This is a highly customizable Puppet profile class to define a WebLogic Admin Server on your system. At its core just adding:

```
contain wls_profile::admin_server
```

Is enough to get a WebLogic 12.2.1.3. WebLogic domain running on your system. 

But sometimes you have specific uses cases that are not handled well by the standard classes. This profile class allows you to add your own code to the execution.

## Stages

Defining and starting a WebLogic Admin Server on your system goes through several stages(These are not puppet stages):

- [`basic_domain`](./basic_domain.html)   Install the WebLogic software and create a basic (empty) domain
- [`wls_servers`](./wls_servers.html)   Create the WebLogic machines, servers you want in your domain
- [`wls_cluster`](./wls_cluster.html)   Create the WebLogic cluster you want in your domain
- [`wls_datasources`](./wls_datasources)   Create the WebLogic datasources you want in your domain
- [`wls_jms`](./wls_jms.html)   Setup your JMS configuration for your domain
- [`wls_users_and_groups`](./wls_users_and_groups.html)    The WebLogic users and groups
- [`pack_domain`](./pack_domain.html)   Pack the domain for transportation to an other WebLogic server

All these stages have a default implementation. This implementation is suitable to get started with. These classed all have parameters you can customize through hiera values. The defaults are specified in the module's `data/default.yaml` file. 

## before classes

But sometimes this is not enough, and you would like to add some extra definitions, you can, for example, add a Puppet class to be executed after the `wls_datasources` stage is done and before the `wls_jms` is done. You can do this by adding the next line to your yaml data:

```yaml
wls_profile::admin_server::before_wls_jms:   my_profile::my_extra_class
```

## after classes

You can do the same when you want to add code after one of the stage classes:

```yaml
wls_profile::admin_server::after_wls_users_and_groups:   my_profile::my_extra_class
```

## Skipping

Sometimes organizations use different modules and mechanisms to implement a feature, and you want to skip the class:

```yaml
wls_profile::admin_server::pack_domain:   skip
```

## Replacing

Or provide your own implementation:

```yaml
wls_profile::admin_server::wls_datasources:   my_profile::my_own_implementation
```

This mechanism can be used for all named stages and makes it easy to move from an easy setup with a running standard WebLogic Admin server to a fully customized setup using a lot of your own classes plugged in.

Look at the description of the stages and their properties.





## Attributes



Attribute Name                                                           | Short Description                                                                              |
------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
[after_basic_domain](#admin_server_after_basic_domain)                   | The name of the class you want to execute directly **after** the `basic_domain` class.         |
[after_pack_domain](#admin_server_after_pack_domain)                     | The name of the class you want to execute directly **after** the `pack_domain` class.          |
[after_wls_cluster](#admin_server_after_wls_cluster)                     | The name of the class you want to execute directly **after** the `wls_cluster` class.          |
[after_wls_datasources](#admin_server_after_wls_datasources)             | The name of the class you want to execute directly **after** the `wls_datasources` class.      |
[after_wls_jms](#admin_server_after_wls_jms)                             | The name of the class you want to execute directly **after** the `wls_jms` class.              |
[after_wls_servers](#admin_server_after_wls_servers)                     | The name of the class you want to execute directly **after** the `wls_servers` class.          |
[after_wls_users_and_groups](#admin_server_after_wls_users_and_groups)   | The name of the class you want to execute directly **after** the `wls_users_and_groups` class. |
[basic_domain](#admin_server_basic_domain)                               | Use this value if you want to skip or use your own class for stage `basic_domain`.             |
[before_basic_domain](#admin_server_before_basic_domain)                 | The name of the class you want to execute directly **before** the `basic_domain` class.        |
[before_pack_domain](#admin_server_before_pack_domain)                   | The name of the class you want to execute directly **before** the `pack_domain` class.         |
[before_wls_cluster](#admin_server_before_wls_cluster)                   | The name of the class you want to execute directly **before** the `wls_cluster` class.         |
[before_wls_datasources](#admin_server_before_wls_datasources)           | The name of the class you want to execute directly **before** the `wls_datasources` class.     |
[before_wls_jms](#admin_server_before_wls_jms)                           | The name of the class you want to execute directly **before** the `wls_jms` class.             |
[before_wls_servers](#admin_server_before_wls_servers)                   | The name of the class you want to execute directly **before** the `wls_servers` class.         |
[before_wls_users_and_groups](#admin_server_before_wls_users_and_groups) | The name of the class you want to execute directly **before** the `wls_users` class.           |
[pack_domain](#admin_server_pack_domain)                                 | Use this value if you want to skip or use your own class for stage `pack_domain`.              |
[wls_cluster](#admin_server_wls_cluster)                                 | Use this value if you want to skip or use your own class for stage `wls_cluster`.              |
[wls_datasources](#admin_server_wls_datasources)                         | Use this value if you want to skip or use your own class for stage `wls_datasources`.          |
[wls_jms](#admin_server_wls_jms)                                         | Use this value if you want to skip or use your own class for stage `wls_jms`.                  |
[wls_servers](#admin_server_wls_servers)                                 | Use this value if you want to skip or use your own class for stage `wls_servers`.              |
[wls_users_and_groups](#admin_server_wls_users_and_groups)               | Use this value if you want to skip or use your own class for stage `wls_users_and_groups`.     |




### basic_domain<a name='admin_server_basic_domain'>

Use this value if you want to skip or use your own class for stage `basic_domain`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::basic_domain:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::basic_domain:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### wls_servers<a name='admin_server_wls_servers'>

Use this value if you want to skip or use your own class for stage `wls_servers`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_servers:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_servers:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### wls_cluster<a name='admin_server_wls_cluster'>

Use this value if you want to skip or use your own class for stage `wls_cluster`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_cluster:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_cluster:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### wls_datasources<a name='admin_server_wls_datasources'>

Use this value if you want to skip or use your own class for stage `wls_datasources`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_datasources:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_datasources:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### wls_jms<a name='admin_server_wls_jms'>

Use this value if you want to skip or use your own class for stage `wls_jms`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_jms:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_jms:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### wls_users_and_groups<a name='admin_server_wls_users_and_groups'>

Use this value if you want to skip or use your own class for stage `wls_users_and_groups`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_users_and_groups:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::wls_users_and_groups:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### pack_domain<a name='admin_server_pack_domain'>

Use this value if you want to skip or use your own class for stage `pack_domain`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::pack_domain:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::pack_domain:  skip
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_basic_domain<a name='admin_server_before_basic_domain'>

The name of the class you want to execute directly **before** the `basic_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_basic_domain:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_wls_servers<a name='admin_server_before_wls_servers'>

The name of the class you want to execute directly **before** the `wls_servers` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_wls_servers:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_wls_cluster<a name='admin_server_before_wls_cluster'>

The name of the class you want to execute directly **before** the `wls_cluster` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_wls_cluster:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_wls_datasources<a name='admin_server_before_wls_datasources'>

The name of the class you want to execute directly **before** the `wls_datasources` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_wls_datasources:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_wls_jms<a name='admin_server_before_wls_jms'>

The name of the class you want to execute directly **before** the `wls_jms` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_wls_jms:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_wls_users_and_groups<a name='admin_server_before_wls_users_and_groups'>

The name of the class you want to execute directly **before** the `wls_users` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_wls_users:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### before_pack_domain<a name='admin_server_before_pack_domain'>

The name of the class you want to execute directly **before** the `pack_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_pack_domain:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_basic_domain<a name='admin_server_after_basic_domain'>

The name of the class you want to execute directly **after** the `basic_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::basic_domain:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_wls_servers<a name='admin_server_after_wls_servers'>

The name of the class you want to execute directly **after** the `wls_servers` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_servers:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_wls_cluster<a name='admin_server_after_wls_cluster'>

The name of the class you want to execute directly **after** the `wls_cluster` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_cluster:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_wls_datasources<a name='admin_server_after_wls_datasources'>

The name of the class you want to execute directly **after** the `wls_datasources` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_datasources:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_wls_jms<a name='admin_server_after_wls_jms'>

The name of the class you want to execute directly **after** the `wls_jms` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_jms:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_wls_users_and_groups<a name='admin_server_after_wls_users_and_groups'>

The name of the class you want to execute directly **after** the `wls_users_and_groups` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_users_and_groups:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)

### after_pack_domain<a name='admin_server_after_pack_domain'>

The name of the class you want to execute directly **after** the `pack_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_pack_domain:  my_module::my_class
```

Type: `Optional[String]`

Default:`undef`

[Back to overview of admin_server](#attributes)
