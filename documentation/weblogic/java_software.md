---
title: weblogic::java software
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for making sure the Java software is correctly installed on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.






## Attributes



Attribute Name                                                                      | Short Description                                     |
----------------------------------------------------------------------------------- | ----------------------------------------------------- |
[alternatives_priority](#weblogic::java_software_alternatives_priority)             | alternatives priority for jdk.                        |
[cryptography_extension_file](#weblogic::java_software_cryptography_extension_file) | Cryptographic extension file to use.                  |
[full_version](#weblogic::java_software_full_version)                               | The full version of java you want to use.             |
[rsa_key_size_fix](#weblogic::java_software_rsa_key_size_fix)                       | Enable the RSA keysize fix.                           |
[source](#weblogic::java_software_source)                                           | The location where the classes can find the software. |
[urandom_fix](#weblogic::java_software_urandom_fix)                                 | Enable the urandom fix.                               |
[version](#weblogic::java_software_version)                                         | The version of java you want to use.                  |
[x64](#weblogic::java_software_x64)                                                 | Install x64 version of java.                          |




### version<a name='weblogic::java_software_version'>

The version of java you want to use.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::java_version` to change it to your requested value.

Default value: `8u152`


Type: `String`


[Back to overview of weblogic::java_software](#attributes)

### full_version<a name='weblogic::java_software_full_version'>

The full version of java you want to use.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::java_full_version` to change it to your requested value.

Default value: `jdk1.8.0_152`


Type: `String`


[Back to overview of weblogic::java_software](#attributes)

### cryptography_extension_file<a name='weblogic::java_software_cryptography_extension_file'>

Cryptographic extension file to use.

Default value: `jce_policy-8.zip`
Type: `String`


[Back to overview of weblogic::java_software](#attributes)

### source<a name='weblogic::java_software_source'>

The location where the classes can find the software. 

You can specify a local directory, a Puppet url or an http url.

This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::source` to change it to your requested value.

The default is : `puppet:///modules/software/`

Type: `String`


[Back to overview of weblogic::java_software](#attributes)

### urandom_fix<a name='weblogic::java_software_urandom_fix'>

Enable the urandom fix.

This parameter is deprecated and will be removed in a next version.

Default value: `true`
Type: `Optional[Boolean]`


[Back to overview of weblogic::java_software](#attributes)

### rsa_key_size_fix<a name='weblogic::java_software_rsa_key_size_fix'>

Enable the RSA keysize fix.

Default value: `true`
Type: `Optional[Boolean]`


[Back to overview of weblogic::java_software](#attributes)

### x64<a name='weblogic::java_software_x64'>

Install x64 version of java.

Default value: `true`
Type: `Boolean`


[Back to overview of weblogic::java_software](#attributes)

### alternatives_priority<a name='weblogic::java_software_alternatives_priority'>

alternatives priority for jdk.

Default value is: `18001`
Type: `Optional[Integer]`


[Back to overview of weblogic::java_software](#attributes)
