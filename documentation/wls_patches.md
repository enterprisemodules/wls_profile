---
title: wls patches
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for ensuring your WebLogic software has all the rquired patches installed.

Using hiera, you you can customize some of the aspects of this proces.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.




## Attributes



Attribute Name            | Short Description                                             |
------------------------- | ------------------------------------------------------------- |
[list](#wls_patches_list) | A Hash describing the WebLogic patches you want be installed. |




### list<a name='wls_patches_list'>



A Hash describing the WebLogic patches you want be installed.

Default value is: `{}`
[Back to overview of wls_patches](#attributes)

