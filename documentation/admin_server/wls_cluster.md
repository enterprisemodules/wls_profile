---
title: admin server::wls cluster
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for creating a WebLogic cluster on your system. 

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin_server](./admin_server.html) for an explanation on how to do this.




## Attributes



Attribute Name                                                  | Short Description                                                                   |
--------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
[cluster_defaults](#admin_server::wls_cluster_cluster_defaults) | A Hash of default values used when creating a `wls_cluster` resource.               |
[cluster_name](#admin_server::wls_cluster_cluster_name)         | The name to use for the cluster.                                                    |
[domain_name](#admin_server::wls_cluster_domain_name)           | The name of the WebLogic domain.                                                    |
[servers](#admin_server::wls_cluster_servers)                   | A Hash of machine-servers defining all servers that need to be part of the cluster. |




### domain_name<a name='admin_server::wls_cluster_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of admin_server::wls_cluster](#attributes)

### cluster_name<a name='admin_server::wls_cluster_cluster_name'>

The name to use for the cluster.

The change the domain name, use the hiera key: `wls_profile::cluster_name`. This will make sure the correct domain name gets used in all classes.


Default value is: `main`
Type: `String[1]`


[Back to overview of admin_server::wls_cluster](#attributes)

### servers<a name='admin_server::wls_cluster_servers'>

A Hash of machine-servers defining all servers that need to be part of the cluster.

The default implementations reads these values from the hiera key `wls_profile::admin_server::wls_servers::servers`
Type: `Hash`

Default:`$wls_profile::servers`

[Back to overview of admin_server::wls_cluster](#attributes)

### cluster_defaults<a name='admin_server::wls_cluster_cluster_defaults'>

A Hash of default values used when creating a `wls_cluster` resource.

The default value is:
```yaml
wls_profile::admin_server::wls_cluster::cluster_defaults:
  messagingmode:  unicast
  migrationbasis: consensus
```
Type: `Hash`


[Back to overview of admin_server::wls_cluster](#attributes)
