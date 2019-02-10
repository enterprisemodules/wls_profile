---
title: wls domain
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for defining a domain on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::basic_domain](./basic_domain.html) for an explanation on how to do this.




## Attributes



Attribute Name                                           | Short Description                                                                        |
-------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
[adminserver_address](#wls_domain_adminserver_address)   | The address the admin server process will run and listen on.                             |
[adminserver_port](#wls_domain_adminserver_port)         | The IP port the admin server process will run and listen on.                             |
[adminserver_settings](#wls_domain_adminserver_settings) | A Hash containing settings (of type `wls_server`) to define for the Admin server.        |
[b2b_enabled](#wls_domain_b2b_enabled)                   | A boolean value specifying if you want to enable b2b.                                    |
[bam_enabled](#wls_domain_bam_enabled)                   | A boolean value specifying if you want to enable bam.                                    |
[development_mode](#wls_domain_development_mode)         | A boolean value specifying if you want to enable development mode.                       |
[domain_name](#wls_domain_domain_name)                   | The name of the WebLogic domain.                                                         |
[domains_dir](#wls_domain_domains_dir)                   | The top-level directory where the domain directories will reside in.                     |
[ess_enabled](#wls_domain_ess_enabled)                   | A boolean value specifying if you want to enable ess.                                    |
[log_dir](#wls_domain_log_dir)                           | The directory used for log files.                                                        |
[nodemanager_address](#wls_domain_nodemanager_address)   | The IP address the nodemanager will run and listen on.                                   |
[nodemanager_port](#wls_domain_nodemanager_port)         | The IP port the nodemanager listens on.                                                  |
[nodemanager_wait](#wls_domain_nodemanager_wait)         | The time in seconds Puppet waits for the nodemanager to start before declaring an error. |
[os_group](#wls_domain_os_group)                         | The os group to use for WebLogic.                                                        |
[os_user](#wls_domain_os_user)                           | The os user to use for WebLogic.                                                         |
[template_name](#wls_domain_template_name)               | The domain template to use when creating the domain.                                     |
[version](#wls_domain_version)                           | The version of WebLogic you want to use.                                                 |
[weblogic_home](#wls_domain_weblogic_home)               | The directory used as WebLogic home
                                                     |
[weblogic_password](#wls_domain_weblogic_password)       | The password for the WebLogic account.                                                   |
[weblogic_user](#wls_domain_weblogic_user)               | The WebLogic user account to bear all administration rights.                             |




### domain_name<a name='wls_domain_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### version<a name='wls_domain_version'>

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

Default value: `12213`
Type: `Wls_install::Versions`

Default:`$wls_profile::weblogic_version`

[Back to overview of wls_domain](#attributes)

### weblogic_home<a name='wls_domain_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of wls_domain](#attributes)

### domains_dir<a name='wls_domain_domains_dir'>

The top-level directory where the domain directories will reside in. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.


The default value is:  `/opt/oracle/domains`
Type: `Stdlib::Absolutepath`


[Back to overview of wls_domain](#attributes)

### log_dir<a name='wls_domain_log_dir'>

The directory used for log files.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.

Default value: `/opt/oracle/domains/log`
Type: `Stdlib::Absolutepath`


[Back to overview of wls_domain](#attributes)

### template_name<a name='wls_domain_template_name'>

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

Type: `Enum[
    'standard',
    'forms'
    ]`


[Back to overview of wls_domain](#attributes)

### nodemanager_address<a name='wls_domain_nodemanager_address'>

The IP address the nodemanager will run and listen on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.

Default value: `::fqdn`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### nodemanager_port<a name='wls_domain_nodemanager_port'>

The IP port the nodemanager listens on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::nodemanager_port` to change it to your requested value.

Default value: `5556`
Type: `Integer`

Default:`$wls_profile::nodemanager_port`

[Back to overview of wls_domain](#attributes)

### adminserver_address<a name='wls_domain_adminserver_address'>

The address the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.

The default value is: The fact `fqdn`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### adminserver_port<a name='wls_domain_adminserver_port'>

The IP port the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.

The default value is:  `7001`
Type: `Integer`

Default:`$wls_profile::adminserver_port`

[Back to overview of wls_domain](#attributes)

### os_user<a name='wls_domain_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### os_group<a name='wls_domain_os_group'>

The os group to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.

Default value: `dba`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### weblogic_user<a name='wls_domain_weblogic_user'>

The WebLogic user account to bear all administration rights.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.

Default value: `weblogic`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### weblogic_password<a name='wls_domain_weblogic_password'>

The password for the WebLogic account.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.

Default value: `Welcome01`
Type: `String[1]`


[Back to overview of wls_domain](#attributes)

### bam_enabled<a name='wls_domain_bam_enabled'>

A boolean value specifying if you want to enable bam.

Default value: `false`
Type: `Boolean`


[Back to overview of wls_domain](#attributes)

### b2b_enabled<a name='wls_domain_b2b_enabled'>

A boolean value specifying if you want to enable b2b.

Default value: `false`
Type: `Boolean`


[Back to overview of wls_domain](#attributes)

### ess_enabled<a name='wls_domain_ess_enabled'>

A boolean value specifying if you want to enable ess.

Default value: `false`
Type: `Boolean`


[Back to overview of wls_domain](#attributes)

### development_mode<a name='wls_domain_development_mode'>

A boolean value specifying if you want to enable development mode.

Default value: `false`
Type: `Boolean`


[Back to overview of wls_domain](#attributes)

### nodemanager_wait<a name='wls_domain_nodemanager_wait'>

The time in seconds Puppet waits for the nodemanager to start before declaring an error.

Default value: `20`
Type: `Integer`


[Back to overview of wls_domain](#attributes)

### adminserver_settings<a name='wls_domain_adminserver_settings'>

A Hash containing settings (of type `wls_server`) to define for the Admin server.

The default value is: `{}`
Type: `Hash`


[Back to overview of wls_domain](#attributes)
