---
title: wls servers
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class makes sure all te required WebLogic machines and servers are defined on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.





## Attributes



Attribute Name                                    | Short Description                |
------------------------------------------------- | -------------------------------- |
[domain_name](#wls_servers_domain_name)           | The name of the WebLogic domain. |
[machine_defaults](#wls_servers_machine_defaults) |                                  |
[server_defaults](#wls_servers_server_defaults)   |                                  |
[servers](#wls_servers_servers)                   |                                  |




### domain_name<a name='wls_servers_domain_name'>



The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
[Back to overview of wls_servers](#attributes)


### servers<a name='wls_servers_servers'>




[Back to overview of wls_servers](#attributes)


### server_defaults<a name='wls_servers_server_defaults'>




[Back to overview of wls_servers](#attributes)


### machine_defaults<a name='wls_servers_machine_defaults'>




[Back to overview of wls_servers](#attributes)

