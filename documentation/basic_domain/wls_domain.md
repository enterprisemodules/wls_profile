---
title: basic domain::wls domain
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for defining a domain on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::basic_domain](./basic_domain.html) for an explanation on how to do this.





## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}


## Attributes



Attribute Name                                                                       | Short Description                                                                                        |
------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- |
[administration_port](#basic_domain::wls_domain_administration_port)                 | The common secure administration port for this WebLogic Server domain.                                   |
[administration_port_enabled](#basic_domain::wls_domain_administration_port_enabled) | Specifies whether the domain-wide administration port should be enabled for this WebLogic Server domain. |
[adminserver_address](#basic_domain::wls_domain_adminserver_address)                 | The address the admin server process will run and listen on.                                             |
[adminserver_port](#basic_domain::wls_domain_adminserver_port)                       | The IP port the admin server process will run and listen on.                                             |
[adminserver_settings](#basic_domain::wls_domain_adminserver_settings)               | A Hash containing settings (of type `wls_server`) to define for the Admin server.                        |
[adminserver_ssl_port](#basic_domain::wls_domain_adminserver_ssl_port)               | SSL port to use for the Admin server.                                                                    |
[b2b_enabled](#basic_domain::wls_domain_b2b_enabled)                                 | A boolean value specifying if you want to enable b2b.                                                    |
[bam_enabled](#basic_domain::wls_domain_bam_enabled)                                 | A boolean value specifying if you want to enable bam.                                                    |
[development_mode](#basic_domain::wls_domain_development_mode)                       | A boolean value specifying if you want to enable development mode.                                       |
[domain_alias](#basic_domain::wls_domain_domain_alias)                               | The domain alias.                                                                                        |
[domain_name](#basic_domain::wls_domain_domain_name)                                 | The name of the WebLogic domain.                                                                         |
[domains_dir](#basic_domain::wls_domain_domains_dir)                                 | The top-level directory where the domain directories will reside in.                                     |
[ess_enabled](#basic_domain::wls_domain_ess_enabled)                                 | A boolean value specifying if you want to enable ess.                                                    |
[java_update_window](#basic_domain::wls_domain_java_update_window)                   | The time frame in which any required java updates will be applied to your domain by Puppet.              |
[log_dir](#basic_domain::wls_domain_log_dir)                                         | The directory used for log files.                                                                        |
[nodemanager_address](#basic_domain::wls_domain_nodemanager_address)                 | The IP address the nodemanager will run and listen on.                                                   |
[nodemanager_port](#basic_domain::wls_domain_nodemanager_port)                       | The IP port the nodemanager listens on.                                                                  |
[nodemanager_properties](#basic_domain::wls_domain_nodemanager_properties)           |                                                                                                          |
[nodemanager_wait](#basic_domain::wls_domain_nodemanager_wait)                       | The time in seconds Puppet waits for the nodemanager to start before declaring an error.                 |
[os_group](#basic_domain::wls_domain_os_group)                                       | The os group to use for WebLogic.                                                                        |
[os_user](#basic_domain::wls_domain_os_user)                                         | The os user to use for WebLogic.                                                                         |
[template_name](#basic_domain::wls_domain_template_name)                             | The domain template to use when creating the domain.                                                     |
[version](#basic_domain::wls_domain_version)                                         | The version of WebLogic you want to use.                                                                 |
[weblogic_home](#basic_domain::wls_domain_weblogic_home)                             | The directory used as WebLogic home
                                                                     |
[weblogic_password](#basic_domain::wls_domain_weblogic_password)                     | The password for the WebLogic account.                                                                   |
[weblogic_user](#basic_domain::wls_domain_weblogic_user)                             | The WebLogic user account to bear all administration rights.                                             |
[wlst_args](#basic_domain::wls_domain_wlst_args)                             | Add additional arguments to the WLST script                                             |




### domain_name<a name='basic_domain::wls_domain_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of basic_domain::wls_domain](#attributes)

### domain_alias<a name='basic_domain::wls_domain_domain_alias'>

The domain alias. 

This is the name puppet uses to identify this domain. When you leave this parameter undefined, it will default to the current WebLogic domain name. When you specify the string 'default', Puppet will use this domain by default when you don't specify a resource for all of the `wls_config` resources.
Type: `String[1]`

Default:`$domain_name`

[Back to overview of basic_domain::wls_domain](#attributes)

### version<a name='basic_domain::wls_domain_version'>

The version of WebLogic you want to use.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::version` to change it to your requested value.

Valid values are:

  - `1036`
  - `1111`
  - `1112`
  - `1211`
  - `1212`
  - `1213`
  - `1221`
  - `12211`
  - `12212`
  - `12213`
  - `12214`

Default value: `12213`
Type: `Wls_install::Versions`

Default:`$wls_profile::weblogic_version`

[Back to overview of basic_domain::wls_domain](#attributes)

### weblogic_home<a name='basic_domain::wls_domain_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of basic_domain::wls_domain](#attributes)

### domains_dir<a name='basic_domain::wls_domain_domains_dir'>

The top-level directory where the domain directories will reside in. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.


The default value is:  `/opt/oracle/domains`
Type: `Stdlib::Absolutepath`


[Back to overview of basic_domain::wls_domain](#attributes)

### log_dir<a name='basic_domain::wls_domain_log_dir'>

The directory used for log files.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.

Default value: `/opt/oracle/domains/log`
Type: `Stdlib::Absolutepath`


[Back to overview of basic_domain::wls_domain](#attributes)

### template_name<a name='basic_domain::wls_domain_template_name'>

The domain template to use when creating the domain.

The default value is `standard`.

Valid values are:

- `standard`
- `ohs_standalone`
- `adf_restricted`
- `osb`
- `osb_soa`
- `osb_soa_bpm`
- `soa`
- `soa_bpm`
- `bam`
- `adf`
- `oim`
- `oud`
- `wc`
- `wc_wcc_bpm`

Type: `Enum['standard','forms','ohs_standalone','adf_restricted','osb','osb_soa','osb_soa_bpm','soa','soa_bpm','bam','adf','oim','oud','wc','wc_wcc_bpm']`


[Back to overview of basic_domain::wls_domain](#attributes)

### nodemanager_address<a name='basic_domain::wls_domain_nodemanager_address'>

The IP address the nodemanager will run and listen on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.

Default value: `::fqdn`
Type: `String[1]`


[Back to overview of basic_domain::wls_domain](#attributes)

### adminserver_address<a name='basic_domain::wls_domain_adminserver_address'>

The address the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.

The default value is: The fact `fqdn`
Type: `String[1]`


[Back to overview of basic_domain::wls_domain](#attributes)

### nodemanager_properties<a name='basic_domain::wls_domain_nodemanager_properties'>

These are the additional parameters required for nodemanager creation, which will be stored in the nodemanager.properties file.
Type: `Hash`


[Back to overview of basic_domain::wls_domain](#attributes)

### nodemanager_port<a name='basic_domain::wls_domain_nodemanager_port'>

The IP port the nodemanager listens on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::nodemanager_port` to change it to your requested value.

Default value: `5556`
Type: `Integer`

Default:`$wls_profile::nodemanager_port`

[Back to overview of basic_domain::wls_domain](#attributes)

### adminserver_port<a name='basic_domain::wls_domain_adminserver_port'>

The IP port the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.

The default value is:  `7001`
Type: `Integer`

Default:`$wls_profile::adminserver_port`

[Back to overview of basic_domain::wls_domain](#attributes)

### administration_port_enabled<a name='basic_domain::wls_domain_administration_port_enabled'>

Specifies whether the domain-wide administration port should be enabled for this WebLogic Server domain. Because the administration port uses SSL, enabling the administration port requires that SSL must be configured for all servers in the domain.

The domain-wide administration port enables you to start a WebLogic Server instance in STANDBY state. It also allows you to separate administration traffic from application traffic in your domain. Because all servers in the domain must enable or disable the administration port at once, you configure the default administration port settings at the domain level.

If you enable the administration port:

The administration port accepts only connections that specify administrator credentials.

Connections that specify administrator credentials can use only the administration port.

The command that starts managed servers must specify a secure protocol and the administration port: -Dweblogic.management.server=https://admin_server:administration_port


Type: `Boolean`


[Back to overview of basic_domain::wls_domain](#attributes)

### administration_port<a name='basic_domain::wls_domain_administration_port'>

The common secure administration port for this WebLogic Server domain. (Requires you to enable the administration port.)
Type: `Optional[Integer]`


[Back to overview of basic_domain::wls_domain](#attributes)

### adminserver_ssl_port<a name='basic_domain::wls_domain_adminserver_ssl_port'>

SSL port to use for the Admin server.

Type: `Optional[Integer]`


[Back to overview of basic_domain::wls_domain](#attributes)

### java_update_window<a name='basic_domain::wls_domain_java_update_window'>

The time frame in which any required java updates will be applied to your domain by Puppet. Puppet will apply any detected java updates immediately if the value is `undef`, which is the default.
Type: `Optional[String[1]]`

Default:`undef`

[Back to overview of basic_domain::wls_domain](#attributes)

### os_user<a name='basic_domain::wls_domain_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of basic_domain::wls_domain](#attributes)

### os_group<a name='basic_domain::wls_domain_os_group'>

The os group to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.

Default value: `dba`
Type: `String[1]`


[Back to overview of basic_domain::wls_domain](#attributes)

### weblogic_user<a name='basic_domain::wls_domain_weblogic_user'>

The WebLogic user account to bear all administration rights.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.

Default value: `weblogic`
Type: `String[1]`


[Back to overview of basic_domain::wls_domain](#attributes)

### weblogic_password<a name='basic_domain::wls_domain_weblogic_password'>

The password for the WebLogic account.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.

Default value: `Welcome01`
Type: `Easy_type::Password`


[Back to overview of basic_domain::wls_domain](#attributes)

### bam_enabled<a name='basic_domain::wls_domain_bam_enabled'>

A boolean value specifying if you want to enable bam.

Default value: `false`
Type: `Boolean`


[Back to overview of basic_domain::wls_domain](#attributes)

### b2b_enabled<a name='basic_domain::wls_domain_b2b_enabled'>

A boolean value specifying if you want to enable b2b.

Default value: `false`
Type: `Boolean`


[Back to overview of basic_domain::wls_domain](#attributes)

### ess_enabled<a name='basic_domain::wls_domain_ess_enabled'>

A boolean value specifying if you want to enable ess.

Default value: `false`
Type: `Boolean`


[Back to overview of basic_domain::wls_domain](#attributes)

### development_mode<a name='basic_domain::wls_domain_development_mode'>

A boolean value specifying if you want to enable development mode.

Default value: `false`
Type: `Boolean`


[Back to overview of basic_domain::wls_domain](#attributes)

### nodemanager_wait<a name='basic_domain::wls_domain_nodemanager_wait'>

The time in seconds Puppet waits for the nodemanager to start before declaring an error.

Default value: `20`
Type: `Integer`


[Back to overview of basic_domain::wls_domain](#attributes)

### adminserver_settings<a name='basic_domain::wls_domain_adminserver_settings'>

A Hash containing settings (of type `wls_server`) to define for the Admin server.

The default value is: `{}`
Type: `Hash`


[Back to overview of basic_domain::wls_domain](#attributes)

### wlst_args<a name='basic_domain::wls_domain_wlst_args'>

Add additional arguments to the WLST script

The default value is: `undef`
Type: `Array`


[Back to overview of basic_domain::wls_domain](#attributes)
