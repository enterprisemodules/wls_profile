---
title: weblogic::limits
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

This class is the default implementation for making sure the OS Limits on your system are set correctly for WebLogic.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.






## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}


## Attributes



Attribute Name                 | Short Description                   |
------------------------------ | ----------------------------------- |
[list](#weblogic::limits_list) | The OS limits created for WebLogic. |




### list<a name='weblogic::limits_list'>

The OS limits created for WebLogic.

The defaults are:

```yaml
wls_profile::weblogic::limits::list:
  '*/nofile':
    soft: 2048
    hard: 8192
  'oracle/nofile':
    soft: 65536
    hard: 65536
  'oracle/nproc':
    soft: 2048
    hard: 16384
  'oracle/stack':
    soft: 10240
  'oracle/memlock':
    soft: 1048576
    hard: 1048576
```

[Back to overview of weblogic::limits](#attributes)
