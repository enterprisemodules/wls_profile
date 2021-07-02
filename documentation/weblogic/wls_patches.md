---
title: weblogic::wls patches
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for ensuring your WebLogic software has all the required patches installed.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.

The easiest and best way to specify your patches is to specify a `level`. An example of a patch level is `JAN2021RU`, meaning the JAN 2021 patch level update.

You can also add additional 'one-off's'. Use the `list` property to add these.

When you don't specify a patch windows, Puppet will never patch a running domain. It will however provide your installations with the specified patch level at the initial run or when the WebLogic domain is not running at the start of the Puppet run.




## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}


## Attributes



Attribute Name                                                      | Short Description                                                    |
------------------------------------------------------------------- | -------------------------------------------------------------------- |
[adminserver_address](#weblogic::wls_patches_adminserver_address)   | The address the admin server process will run and listen on.         |
[adminserver_port](#weblogic::wls_patches_adminserver_port)         | The IP port the admin server process will run and listen on.         |
[custom_trust](#weblogic::wls_patches_custom_trust)                 | Determine if you want to use a custom trust or not.                  |
[domains_dir](#weblogic::wls_patches_domains_dir)                   | The top-level directory where the domain directories will reside in. |
[jdk_home](#weblogic::wls_patches_jdk_home)                         | The location where the JDK is installed.                             |
[jsse_enabled](#weblogic::wls_patches_jsse_enabled)                 | Determine if you want to enable JSSE security.                       |
[level](#weblogic::wls_patches_level)                               | The specified patch level.                                           |
[list](#weblogic::wls_patches_list)                                 | A Hash describing the WebLogic patches you want be installed.        |
[logoutput](#weblogic::wls_patches_logoutput)                       | log the outputs of Puppet exec and wls_exec or not.                  |
[middleware_home](#weblogic::wls_patches_middleware_home)           | The Oracle middleware home directory.                                |
[nodemanager_address](#weblogic::wls_patches_nodemanager_address)   | The IP address the nodemanager will run and listen on.               |
[nodemanager_port](#weblogic::wls_patches_nodemanager_port)         | The IP port the nodemanager listens on.                              |
[orainst_dir](#weblogic::wls_patches_orainst_dir)                   |                                                                      |
[os_group](#weblogic::wls_patches_os_group)                         | The os group to use for WebLogic.                                    |
[os_user](#weblogic::wls_patches_os_user)                           | The os user to use for WebLogic.                                     |
[patch_window](#weblogic::wls_patches_patch_window)                 | The service window in which any patching will be executed.           |
[trust_keystore_file](#weblogic::wls_patches_trust_keystore_file)   | File specification of the trust keystore.                            |
[version](#weblogic::wls_patches_version)                           | The version of WebLogic you want to use.                             |
[wait_for_nodemanager](#weblogic::wls_patches_wait_for_nodemanager) |                                                                      |
[weblogic_home](#weblogic::wls_patches_weblogic_home)               | The directory used as WebLogic home
                                 |
[weblogic_password](#weblogic::wls_patches_weblogic_password)       | The password for the WebLogic account.                               |
[weblogic_user](#weblogic::wls_patches_weblogic_user)               | The WebLogic user account to bear all administration rights.         |




### level<a name='weblogic::wls_patches_level'>

The specified patch level. The default value is 'NONE'.
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### version<a name='weblogic::wls_patches_version'>

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
Type: `Integer`


[Back to overview of weblogic::wls_patches](#attributes)

### middleware_home<a name='weblogic::wls_patches_middleware_home'>

The Oracle middleware home directory.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### orainst_dir<a name='weblogic::wls_patches_orainst_dir'>

The directory where the orainst file is located.
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### jdk_home<a name='weblogic::wls_patches_jdk_home'>

The location where the JDK is installed.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.

The default value is: `/usr/java/jdk1.8.0_152`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### os_user<a name='weblogic::wls_patches_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### list<a name='weblogic::wls_patches_list'>

A Hash describing the WebLogic patches you want be installed.

Default value is: `{}`
Type: `Hash`


[Back to overview of weblogic::wls_patches](#attributes)

### domains_dir<a name='weblogic::wls_patches_domains_dir'>

The top-level directory where the domain directories will reside in. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.


The default value is:  `/opt/oracle/domains`
Type: `Stdlib::Absolutepath`


[Back to overview of weblogic::wls_patches](#attributes)

### weblogic_home<a name='weblogic::wls_patches_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of weblogic::wls_patches](#attributes)

### os_group<a name='weblogic::wls_patches_os_group'>

The os group to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.

Default value: `dba`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### weblogic_user<a name='weblogic::wls_patches_weblogic_user'>

The WebLogic user account to bear all administration rights.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.

Default value: `weblogic`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### weblogic_password<a name='weblogic::wls_patches_weblogic_password'>

The password for the WebLogic account.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.

Default value: `Welcome01`
Type: `Easy_type::Password`


[Back to overview of weblogic::wls_patches](#attributes)

### adminserver_port<a name='weblogic::wls_patches_adminserver_port'>

The IP port the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.

The default value is:  `7001`
Type: `Integer`


[Back to overview of weblogic::wls_patches](#attributes)

### nodemanager_port<a name='weblogic::wls_patches_nodemanager_port'>

The IP port the nodemanager listens on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::nodemanager_port` to change it to your requested value.

Default value: `5556`
Type: `Integer`


[Back to overview of weblogic::wls_patches](#attributes)

### wait_for_nodemanager<a name='weblogic::wls_patches_wait_for_nodemanager'>

The time in seconds we wait for the nodemanager to be started in the restart phase of the patching.
Type: `Integer`


[Back to overview of weblogic::wls_patches](#attributes)

### nodemanager_address<a name='weblogic::wls_patches_nodemanager_address'>

The IP address the nodemanager will run and listen on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.

Default value: `::fqdn`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### adminserver_address<a name='weblogic::wls_patches_adminserver_address'>

The address the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.

The default value is: The fact `fqdn`
Type: `String[1]`


[Back to overview of weblogic::wls_patches](#attributes)

### jsse_enabled<a name='weblogic::wls_patches_jsse_enabled'>

Determine if you want to enable JSSE security.

Type: `Boolean`


[Back to overview of weblogic::wls_patches](#attributes)

### custom_trust<a name='weblogic::wls_patches_custom_trust'>

Determine if you want to use a custom trust or not.

Type: `Boolean`


[Back to overview of weblogic::wls_patches](#attributes)

### trust_keystore_file<a name='weblogic::wls_patches_trust_keystore_file'>

File specification of the trust keystore.


Type: `Optional[String[1]]`


[Back to overview of weblogic::wls_patches](#attributes)

### patch_window<a name='weblogic::wls_patches_patch_window'>

The service window in which any patching will be executed. 

Type: `Optional[String[1]]`

Default:`undef`

[Back to overview of weblogic::wls_patches](#attributes)

### logoutput<a name='weblogic::wls_patches_logoutput'>

log the outputs of Puppet exec and wls_exec or not.

When you specify `true` Puppet will log all output of `exec` types.

Valid values are:

- `true`
- `false`
- `on_failure`

Type: `Variant[Boolean,Enum['on_failure']]`

Default:`lookup({name => 'logoutput', default_value => 'on_failure'})`

[Back to overview of weblogic::wls_patches](#attributes)
