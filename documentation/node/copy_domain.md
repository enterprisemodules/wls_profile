---
title: node::copy domain
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation to copy the packed domain from the Admin Server, unpack it on the current machine and start the nodemanager.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::node](./node.html) for an explanation on how to do this.







## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}


## Attributes



Attribute Name                                                                                    | Short Description                                                                        |
------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
[adminserver_address](#node::copy_domain_adminserver_address)                                     | The address the admin server process will run and listen on.                             |
[adminserver_port](#node::copy_domain_adminserver_port)                                           | The IP port the admin server process will run and listen on.                             |
[custom_identity](#node::copy_domain_custom_identity)                                             |                                                                                          |
[custom_identity_alias](#node::copy_domain_custom_identity_alias)                                 |                                                                                          |
[custom_identity_keystore_filename](#node::copy_domain_custom_identity_keystore_filename)         |                                                                                          |
[custom_identity_keystore_passphrase](#node::copy_domain_custom_identity_keystore_passphrase)     |                                                                                          |
[custom_identity_privatekey_passphrase](#node::copy_domain_custom_identity_privatekey_passphrase) |                                                                                          |
[custom_trust](#node::copy_domain_custom_trust)                                                   | Determine if you want to use a custom trust or not.                                      |
[domain_name](#node::copy_domain_domain_name)                                                     | The name of the WebLogic domain.                                                         |
[domains_dir](#node::copy_domain_domains_dir)                                                     | The top-level directory where the domain directories will reside in.                     |
[jdk_home](#node::copy_domain_jdk_home)                                                           | The location where the JDK is installed.                                                 |
[jsse_enabled](#node::copy_domain_jsse_enabled)                                                   | Determine if you want to enable JSSE security.                                           |
[log_dir](#node::copy_domain_log_dir)                                                             | The directory used for log files.                                                        |
[middleware_home](#node::copy_domain_middleware_home)                                             | The Oracle middleware home directory.                                                    |
[nodemanager_address](#node::copy_domain_nodemanager_address)                                     | The IP address the nodemanager will run and listen on.                                   |
[nodemanager_wait](#node::copy_domain_nodemanager_wait)                                           | The time in seconds Puppet waits for the nodemanager to start before declaring an error. |
[os_group](#node::copy_domain_os_group)                                                           | The os group to use for WebLogic.                                                        |
[os_user](#node::copy_domain_os_user)                                                             | The os user to use for WebLogic.                                                         |
[trust_keystore_file](#node::copy_domain_trust_keystore_file)                                     | File specification of the trust keystore.                                                |
[trust_keystore_passphrase](#node::copy_domain_trust_keystore_passphrase)                         |                                                                                          |
[version](#node::copy_domain_version)                                                             | The version of WebLogic you want to use.                                                 |
[weblogic_home](#node::copy_domain_weblogic_home)                                                 | The directory used as WebLogic home
                                                     |
[weblogic_password](#node::copy_domain_weblogic_password)                                         | The password for the WebLogic account.                                                   |
[weblogic_user](#node::copy_domain_weblogic_user)                                                 | The WebLogic user account to bear all administration rights.                             |




### domain_name<a name='node::copy_domain_domain_name'>

The name of the WebLogic domain. This will be used both as the REAL WebLogic domain name, and also be used by Puppet as a designator for Puppet resources. (e.g. the name before the slash `my_domain/wls_queue1`).

The change the domain name, use the hiera key: `wls_profile::domain_name`. This will make sure the correct domain name gets used in all classes.

The default value is: `MYDOMAIN`
Type: `String[1]`


[Back to overview of node::copy_domain](#attributes)

### version<a name='node::copy_domain_version'>

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

[Back to overview of node::copy_domain](#attributes)

### weblogic_home<a name='node::copy_domain_weblogic_home'>

The directory used as WebLogic home

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12/wlserver`

Type: `Stdlib::Absolutepath`


[Back to overview of node::copy_domain](#attributes)

### log_dir<a name='node::copy_domain_log_dir'>

The directory used for log files.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::log_dir` to change it to your requested value.

Default value: `/opt/oracle/domains/log`
Type: `Stdlib::Absolutepath`


[Back to overview of node::copy_domain](#attributes)

### middleware_home<a name='node::copy_domain_middleware_home'>

The Oracle middleware home directory.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::middleware_home` to change it to your requested value.

Default value: `/opt/oracle/middleware12`
Type: `Stdlib::Absolutepath`


[Back to overview of node::copy_domain](#attributes)

### jdk_home<a name='node::copy_domain_jdk_home'>

The location where the JDK is installed.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::jdk_home` to change it to your requested value.

The default value is: `/usr/java/jdk1.8.0_152`
Type: `Stdlib::Absolutepath`


[Back to overview of node::copy_domain](#attributes)

### domains_dir<a name='node::copy_domain_domains_dir'>

The top-level directory where the domain directories will reside in. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::domains_dir` to change it to your requested value.


The default value is:  `/opt/oracle/domains`
Type: `Stdlib::Absolutepath`


[Back to overview of node::copy_domain](#attributes)

### os_user<a name='node::copy_domain_os_user'>

The os user to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_user` to change it to your requested value.

Default value: `oracle`
Type: `String[1]`


[Back to overview of node::copy_domain](#attributes)

### os_group<a name='node::copy_domain_os_group'>

The os group to use for WebLogic.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::os_group` to change it to your requested value.

Default value: `dba`
Type: `String[1]`


[Back to overview of node::copy_domain](#attributes)

### adminserver_address<a name='node::copy_domain_adminserver_address'>

The address the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_address` to change it to your requested value.

The default value is: The fact `fqdn`
Type: `String[1]`


[Back to overview of node::copy_domain](#attributes)

### adminserver_port<a name='node::copy_domain_adminserver_port'>

The IP port the admin server process will run and listen on. 

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::adminserver_port` to change it to your requested value.

The default value is:  `7001`
Type: `Integer`

Default:`$wls_profile::adminserver_port`

[Back to overview of node::copy_domain](#attributes)

### nodemanager_address<a name='node::copy_domain_nodemanager_address'>

The IP address the nodemanager will run and listen on.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::basic_domain::wls_domain::log_dir` to change it to your requested value.

Default value: `::fqdn`
Type: `String[1]`


[Back to overview of node::copy_domain](#attributes)

### nodemanager_wait<a name='node::copy_domain_nodemanager_wait'>

The time in seconds Puppet waits for the nodemanager to start before declaring an error.

Default value: `20`
Type: `Integer`


[Back to overview of node::copy_domain](#attributes)

### weblogic_user<a name='node::copy_domain_weblogic_user'>

The WebLogic user account to bear all administration rights.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_user` to change it to your requested value.

Default value: `weblogic`
Type: `String[1]`


[Back to overview of node::copy_domain](#attributes)

### weblogic_password<a name='node::copy_domain_weblogic_password'>

The password for the WebLogic account.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::weblogic_password` to change it to your requested value.

Default value: `Welcome01`
Type: `Easy_type::Password`


[Back to overview of node::copy_domain](#attributes)

### jsse_enabled<a name='node::copy_domain_jsse_enabled'>

Determine if you want to enable JSSE security.

Type: `Boolean`


[Back to overview of node::copy_domain](#attributes)

### custom_trust<a name='node::copy_domain_custom_trust'>

Determine if you want to use a custom trust or not.

Type: `Boolean`


[Back to overview of node::copy_domain](#attributes)

### trust_keystore_file<a name='node::copy_domain_trust_keystore_file'>

File specification of the trust keystore.


Type: `Optional[String[1]]`


[Back to overview of node::copy_domain](#attributes)

### trust_keystore_passphrase<a name='node::copy_domain_trust_keystore_passphrase'>

The passphrase for access to the keystore.
Type: `Optional[Easy_type::Password]`


[Back to overview of node::copy_domain](#attributes)

### custom_identity<a name='node::copy_domain_custom_identity'>

Set to true if you want to enable the use of custom identities.
Type: `Boolean`


[Back to overview of node::copy_domain](#attributes)

### custom_identity_keystore_filename<a name='node::copy_domain_custom_identity_keystore_filename'>

The name of the file containing the custom identities.
Type: `Optional[String[1]]`


[Back to overview of node::copy_domain](#attributes)

### custom_identity_alias<a name='node::copy_domain_custom_identity_alias'>

The alias of the entry in the custom identity keystore that we want to use.
Type: `Optional[String[1]]`


[Back to overview of node::copy_domain](#attributes)

### custom_identity_keystore_passphrase<a name='node::copy_domain_custom_identity_keystore_passphrase'>

The passphrase for the custom identity keystore.
Type: `Optional[Easy_type::Password]`


[Back to overview of node::copy_domain](#attributes)

### custom_identity_privatekey_passphrase<a name='node::copy_domain_custom_identity_privatekey_passphrase'>

The passphrase for the private key in the custom identity keystore.
Type: `Optional[Easy_type::Password]`


[Back to overview of node::copy_domain](#attributes)
