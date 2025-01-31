---
title: admin server::managed server
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This defined type is the default implementation for defining a managed server in your WebLogic domain. It is called once for every machine server combination you passed to `wls_profile::admin_server::wls_servers`.

Using hiera, you can customize some of the aspects of this process.






## Attributes



Attribute Name                                                     | Short Description                                                     |
------------------------------------------------------------------ | --------------------------------------------------------------------- |
[domain_name](#admin_server::managed_server_domain_name)           | The name of the WebLogic domain.                                      |
[listenaddress](#admin_server::managed_server_listenaddress)       |                                                                       |
[machine_defaults](#admin_server::managed_server_machine_defaults) | a Hash describing the defauls to use when creating WebLogic machines. |
[machine_name](#admin_server::managed_server_machine_name)         |                                                                       |
[server_arguments](#admin_server::managed_server_server_arguments) | An Array containing the server startup arguments.                     |
[server_defaults](#admin_server::managed_server_server_defaults)   | a Hash describing the defauls to use when creating WebLogic servers.  |




### machine_name<a name='admin_server::managed_server_machine_name'>

The machine name to create for this managed server
Type: `String[1]`


[Back to overview of admin_server::managed_server](#attributes)

### listenaddress<a name='admin_server::managed_server_listenaddress'>

The listen address for the managed server
Type: `String[1]`


[Back to overview of admin_server::managed_server](#attributes)

### domain_name<a name='admin_server::managed_server_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of admin_server::managed_server](#attributes)

### server_arguments<a name='admin_server::managed_server_server_arguments'>

An Array containing the server startup arguments.

Default value is : `[]`
Type: `Array`


[Back to overview of admin_server::managed_server](#attributes)

### server_defaults<a name='admin_server::managed_server_server_defaults'>

a Hash describing the defauls to use when creating WebLogic servers.

Default value : `{}`
Type: `Hash`


[Back to overview of admin_server::managed_server](#attributes)

### machine_defaults<a name='admin_server::managed_server_machine_defaults'>

a Hash describing the defauls to use when creating WebLogic machines.

Default value : `{}`
Type: `Hash`


[Back to overview of admin_server::managed_server](#attributes)
