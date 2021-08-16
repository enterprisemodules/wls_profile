---
title: weblogic::fmw software
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for creating the required OS users and groups for the installation of WebLogic.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.







## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}


## Attributes



Attribute Name                                             | Short Description                                             |
---------------------------------------------------------- | ------------------------------------------------------------- |
[file_name](#weblogic::fmw_software_file_name)             |                                                               |
[jdk_home](#weblogic::fmw_software_jdk_home)               | The location where the JDK is installed.                      |
[middleware_home](#weblogic::fmw_software_middleware_home) | The Oracle middleware home directory.                         |
[oracle_base](#weblogic::fmw_software_oracle_base)         | The directory used as the base for all Oracle weblogic files. |
[os_group](#weblogic::fmw_software_os_group)               | The os group to use for WebLogic.                             |
[os_user](#weblogic::fmw_software_os_user)                 | The os user to use for WebLogic.                              |
[source](#weblogic::fmw_software_source)                   | The location where the classes can find the software.         |
[version](#weblogic::fmw_software_version)                 | The version of WebLogic you want to use.                      |
[weblogic_home](#weblogic::fmw_software_weblogic_home)     | The directory used as WebLogic home
                          |




### file_name<a name='weblogic::fmw_software_file_name'>


Type: `Array[String[1]]`


[Back to overview of weblogic::fmw_software](#attributes)

### oracle_base<a name='weblogic::fmw_software_oracle_base'>

The directory used as the base for all Oracle weblogic files.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::oracle_base` to change it to your requested value.

Default value: `/opt/oracle`
Type: `Stdlib::Absolutepath`


[Back to overview of weblogic::fmw_software](#attributes)

### middleware_home<a name='weblogic::fmw_software_middleware_home'>

The Oracle middleware home directory.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12`
Type: `Stdlib::Absolutepath`


[Back to overview of weblogic::fmw_software](#attributes)

### weblogic_home<a name='weblogic::fmw_software_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of weblogic::fmw_software](#attributes)

### jdk_home<a name='weblogic::fmw_software_jdk_home'>

The location where the JDK is installed.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.

The default value is: `/usr/java/jdk1.8.0_152`
Type: `Stdlib::Absolutepath`


[Back to overview of weblogic::fmw_software](#attributes)

### os_user<a name='weblogic::fmw_software_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of weblogic::fmw_software](#attributes)

### os_group<a name='weblogic::fmw_software_os_group'>

The os group to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.

Default value: `dba`
Type: `String[1]`


[Back to overview of weblogic::fmw_software](#attributes)

### source<a name='weblogic::fmw_software_source'>

The location where the classes can find the software. 

You can specify a local directory, a Puppet url or an http url.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::source` to change it to your requested value.

The default is : `puppet:///modules/software/`

Type: `String[1]`


[Back to overview of weblogic::fmw_software](#attributes)

### version<a name='weblogic::fmw_software_version'>

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

[Back to overview of weblogic::fmw_software](#attributes)
