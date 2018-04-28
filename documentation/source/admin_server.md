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

<%- include_attributes [
  :basic_domain,
  :wls_servers,
  :wls_cluster,
  :wls_datasources,
  :wls_jms,
  :wls_users_and_groups,
  :pack_domain,
  :before_basic_domain,
  :before_wls_servers,
  :before_wls_cluster,
  :before_wls_datasources,
  :before_wls_jms,
  :before_wls_users_and_groups,
  :before_pack_domain,
  :after_basic_domain,
  :after_wls_servers,
  :after_wls_cluster,
  :after_wls_datasources,
  :after_wls_jms,
  :after_wls_users_and_groups,
  :after_pack_domain,
] %>

