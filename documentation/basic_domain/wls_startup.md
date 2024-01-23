---
title: basic domain::wls startup
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for making sure WebLogic gets started after a system reboot.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.






## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}


## Attributes



Attribute Name                                                  | Short Description                                                    |
--------------------------------------------------------------- | -------------------------------------------------------------------- |
[domain_name](#basic_domain::wls_startup_domain_name)           | The name of the WebLogic domain.                                     |
[domains_dir](#basic_domain::wls_startup_domains_dir)           | The top-level directory where the domain directories will reside in. |
[environment_file](#basic_domain::wls_startup_environment_file) | Optional name of the environment file to use in the startup unit.    |
[log_dir](#basic_domain::wls_startup_log_dir)                   | The directory used for log files.                                    |
[os_user](#basic_domain::wls_startup_os_user)                   | The os user to use for WebLogic.                                     |
[version](#basic_domain::wls_startup_version)                   | The version of WebLogic you want to use.                             |
[weblogic_home](#basic_domain::wls_startup_weblogic_home)       | The directory used as WebLogic home
                                 |




### domain_name<a name='basic_domain::wls_startup_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of basic_domain::wls_startup](#attributes)

### version<a name='basic_domain::wls_startup_version'>

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

[Back to overview of basic_domain::wls_startup](#attributes)

### weblogic_home<a name='basic_domain::wls_startup_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of basic_domain::wls_startup](#attributes)

### domains_dir<a name='basic_domain::wls_startup_domains_dir'>

The top-level directory where the domain directories will reside in. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.


The default value is:  `/opt/oracle/domains`
Type: `Stdlib::Absolutepath`


[Back to overview of basic_domain::wls_startup](#attributes)

### log_dir<a name='basic_domain::wls_startup_log_dir'>

The directory used for log files.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.

Default value: `/opt/oracle/domains/log`
Type: `Stdlib::Absolutepath`


[Back to overview of basic_domain::wls_startup](#attributes)

### os_user<a name='basic_domain::wls_startup_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of basic_domain::wls_startup](#attributes)

### environment_file<a name='basic_domain::wls_startup_environment_file'>

Optional name of the environment file to use in the startup unit. You must use your own Puppet code to ensure the correct content of the file.

[Back to overview of basic_domain::wls_startup](#attributes)
