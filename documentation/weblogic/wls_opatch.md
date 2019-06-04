---
title: weblogic::wls opatch
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for ensuring your WebLogic Opatch is up-to-date.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.




## Attributes



Attribute Name                     | Short Description                                                   |
---------------------------------- | ------------------------------------------------------------------- |
[list](#weblogic::wls_opatch_list) | A Hash describing the WebLogic opatchupgrade you want be installed. |




### list<a name='weblogic::wls_opatch_list'>

A Hash describing the WebLogic opatchupgrade you want be installed.

Default value is: `{}`
Type: `Hash`


[Back to overview of weblogic::wls_opatch](#attributes)
