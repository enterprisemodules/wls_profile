---
title: installation
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

To install these modules, you can use a `Puppetfile`

```
mod 'enterprisemodules/wls_profile'               ,'0.1.0'
```

Then use the `librarian-puppet` or `r10K` to install the software.

You can also install the software using the `puppet module`  command:

```
puppet module install enterprisemodules-wls_profile
```





## Experience the Power of Puppet for WebLogic

If you want to play and experiment with Puppet and WebLogic, please take a look at our playgrounds. At our playgrounds, we provide you with a pre-installed environment, where you experiment fast and easy.

{% include super_hero.html title="For WebLogic" ref="/playgrounds#weblogic" %}



