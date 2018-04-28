---
title: description
keywords: documentation
layout: documentation
sidebar: wls_profile_sidebar
toc: false
---
## Overview

## Overview

This module has a couple of convenient classes to help you setup your WebLogic environment:

- [`wls_profile::weblogic`](/docs/wls_profile/weblogic.html)       Ensure WebLogic is installed and patched
- [`wls_profile::basic_domain`](/docs/wls_profile/basic_domain.html)   Same as `weblogic` and create an empty domain.
- [`wls_profile::admin_server`](/docs/wls_profile/admin_server.html)   Same as `basic_domain` and create some machines and servers, clusters and some other WebLogic object.
- [`wls_profile::node`](/docs/wls_profile/node.html)           Same as `weblogic` and after that copy the domain from an admin server and load it.

All of these classes contain some steps. All of these stapes have default implementations, but you can add extra Puppet code to the catalog and remove or override the default implementation. This can all be done by adding values to your hiera files.






