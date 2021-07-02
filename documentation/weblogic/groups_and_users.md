---
title: weblogic::groups and users
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



Attribute Name                               | Short Description                          |
-------------------------------------------- | ------------------------------------------ |
[groups](#weblogic::groups_and_users_groups) | The list of groups to create for WebLogic. |
[users](#weblogic::groups_and_users_users)   | The OS users to create for WebLogic.       |




### users<a name='weblogic::groups_and_users_users'>

The OS users to create for WebLogic.

The default value is:

```yaml
wls_profile::weblogic::groups_and_users::users:
  oracle:
    uid:        54321
    gid:        dba
    groups:
    - dba
    shell:      /bin/bash
    password:   '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.'
    home:       /home/oracle
    comment:    This user oracle was created by Puppet
    managehome: true
```

[Back to overview of weblogic::groups_and_users](#attributes)

### groups<a name='weblogic::groups_and_users_groups'>

The list of groups to create for WebLogic.

The default value is:

```yaml
wls_profile::weblogic::groups_and_users::groups:
  dba:
    gid:  54321,
```


[Back to overview of weblogic::groups_and_users](#attributes)
