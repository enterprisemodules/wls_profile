---
title: wls users and groups
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for ensuring the correct WebLogic users and groups are available on the system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.





## Attributes



Attribute Name                                 | Short Description                    |
---------------------------------------------- | ------------------------------------ |
[group_list](#wls_users_and_groups_group_list) | A list of WebLogic groups to define. |
[user_list](#wls_users_and_groups_user_list)   | A list of WebLogic users to define.  |




### group_list<a name='wls_users_and_groups_group_list'>

A list of WebLogic groups to define.

The default value is: `{}`

This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.

Type: `Hash`


[Back to overview of wls_users_and_groups](#attributes)

### user_list<a name='wls_users_and_groups_user_list'>

A list of WebLogic users to define.

The default value is: `{}`

This is a simple way to get started. It is easy to get started, but soon your hiera yaml become a nightmare. Our advice is when you need to let puppet manage your Oracle profiles, to override this class and add your own puppet implementation. This is much better maintainable and adds more consistency.

Type: `Hash`


[Back to overview of wls_users_and_groups](#attributes)
