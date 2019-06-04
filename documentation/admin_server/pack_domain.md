---
title: admin server::pack domain
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for packing a domain on the current server. The packed domain can be used to create other WebLogic nodes in the same domain. When you are creating just a single node WebLogic server, you can skip this class.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin_server](./admin_server.html) for an explanation on how to do this.





## Attributes



Attribute Name                                                | Short Description                                                    |
------------------------------------------------------------- | -------------------------------------------------------------------- |
[domain_name](#admin_server::pack_domain_domain_name)         | The name of the WebLogic domain.                                     |
[domains_dir](#admin_server::pack_domain_domains_dir)         | The top-level directory where the domain directories will reside in. |
[jdk_home](#admin_server::pack_domain_jdk_home)               | The location where the JDK is installed.                             |
[middleware_home](#admin_server::pack_domain_middleware_home) | The Oracle middleware home directory.                                |
[os_group](#admin_server::pack_domain_os_group)               | The os group to use for WebLogic.                                    |
[os_user](#admin_server::pack_domain_os_user)                 | The os user to use for WebLogic.                                     |
[weblogic_home](#admin_server::pack_domain_weblogic_home)     | The directory used as WebLogic home
                                 |




### domain_name<a name='admin_server::pack_domain_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of admin_server::pack_domain](#attributes)

### middleware_home<a name='admin_server::pack_domain_middleware_home'>

The Oracle middleware home directory.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12`
Type: `Stdlib::Absolutepath`


[Back to overview of admin_server::pack_domain](#attributes)

### weblogic_home<a name='admin_server::pack_domain_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of admin_server::pack_domain](#attributes)

### jdk_home<a name='admin_server::pack_domain_jdk_home'>

The location where the JDK is installed.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.

The default value is: `/usr/java/jdk1.8.0_152`
Type: `Stdlib::Absolutepath`


[Back to overview of admin_server::pack_domain](#attributes)

### domains_dir<a name='admin_server::pack_domain_domains_dir'>

The top-level directory where the domain directories will reside in. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.


The default value is:  `/opt/oracle/domains`
Type: `Stdlib::Absolutepath`


[Back to overview of admin_server::pack_domain](#attributes)

### os_user<a name='admin_server::pack_domain_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of admin_server::pack_domain](#attributes)

### os_group<a name='admin_server::pack_domain_os_group'>

The os group to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.

Default value: `dba`
Type: `String[1]`


[Back to overview of admin_server::pack_domain](#attributes)
