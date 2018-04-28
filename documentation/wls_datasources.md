---
title: wls datasources
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for defining WebLogic datasources. 

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.





## Attributes



Attribute Name                | Short Description                |
----------------------------- | -------------------------------- |
[list](#wls_datasources_list) | A list of datasources to define. |




### list<a name='wls_datasources_list'>



A list of datasources to define.

The default value is: `{}`

This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.
[Back to overview of wls_datasources](#attributes)

