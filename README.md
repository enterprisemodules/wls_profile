
[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)

#### Table of Contents

1. [Overview](#overview)
2. [License](#license)
3. [Description - What the module does and why it is useful](#description)
4. [Setup](#setup)
  * [Requirements](#requirements)
  * [Installing the wls_install module](#installing-the-wls_install-module)
5. [Usage - Configuration options and additional functionality](#usage)
6. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
7. [Limitations - OS compatibility, etc.](#limitations)

## Overview

The `wls_profile` module allows an easy path from first simple installation to a fully customized Enterprise setup. It is part of our family of Puppet modules to install, manage and secure WebLogic and Fusion Middleware with Puppet. Besides the `wls_profile` module, this family also contains:

- [wls_config](https://www.enterprisemodules.com/shop/products/puppet-wls_config-module) For configuring an Oracle WebLogic and other Fusion products
- [wls_install](https://www.enterprisemodules.com/shop/products/puppet-wls_install-module) For installing an Oracle WebLogic and other Fusion products

## License

Most of the [Enterprise Modules](https://www.enterprisemodules.com) modules are commercial modules. This one is **NOT**. It is an Open Source module. You are free to use it any way you like. It, however, is based on our commercial Puppet WebLogic modules.

## Description

This module has a couple of convenient classes to help you setup your WebLogic environment:

- [`wls_profile::weblogic`](https://www.enterprisemodules.com/docs/wls_profile/weblogic.html)       Ensure WebLogic is installed and patched
- [`wls_profile::basic_domain`](https://www.enterprisemodules.com/docs/wls_profile/basic_domain.html)   Same as `weblogic` and create an empty domain.
- [`wls_profile::admin_server`](https://www.enterprisemodules.com/docs/wls_profile/admin_server.html)   Same as `basic_domain` and create some machines and servers, clusters and some other WebLogic object.
- [`wls_profile::node`](https://www.enterprisemodules.com/docs/wls_profile/node.html)           Same as `weblogic` and after that copy the domain from an admin server and load it.

All of these classes contain some steps. All of these stapes have default implementations, but you can add extra Puppet code to the catalog and remove or override the default implementation. This can all be done by adding values to your hiera files.

Check [here](https://www.enterprisemodules.com/docs/wls_profile/description.html) to see the full documentation for this module.

## Setup

### Requirements

The [`wls_profile`](https://www.enterprisemodules.com/shop/products/puppet-wls_install-module) module requires:

- Puppet module [`enterprisemodules-easy_type`](https://forge.puppet.com/enterprisemodules/easy_type) installed.
- Puppet module [`enterprisemodules-wls_install`](https://forge.puppet.com/enterprisemodules/wls_install) installed.
- Puppet module [`enterprisemodules-wls_config`](https://forge.puppet.com/enterprisemodules/wls_config) installed.
- Puppet version 4.10.8 or higher. Can be Puppet Enterprise or Puppet Open Source
- WebLogic 10g or higher
- A valid Oracle Weblogic or Fusion license
- A valid Enterprise Modules license for usage.
- Runs on most Linux systems.
- Runs on Solaris
- Windows systems are **NOT** supported

This module uses some other public Puppet forge modules. Check the metadata to ensure you have all dependencies installed.

#### We support WebLogic versions:

- WebLogic 10g
- WebLogic 11g
- WebLogic 12.1.2
- WebLogic 12.1.3
- WebLogic 12.2.1
- WebLogic 12.2.1.1
- WebLogic 12.2.1.2
- WebLogic 12.2.1.3

And Fusion versions:

- WebLogic 10g
- WebLogic 11g
- WebLogic 12c ( 12.1.1, 12.1.2, 12.1.3, 12.2.1, 12.2.1.1, 12.2.1.2, 12.2.1.3)

### Installing the wls_profile module

To install these modules, you can use a `Puppetfile`

```
mod 'enterprisemodules/wls_profile'               ,'0.1.0'
```

Then use the `librarian-puppet` or `r10K` to install the software.

You can also install the software using the `puppet module`  command:

```
puppet module install enterprisemodules-wls_profile
```
## Usage

To get started, include the `wls_profile::admin_server` class in your role, make sure you have a module called `software` that has a folder `files` and that directory contains the next files:

- `fmw_12.2.1.3.0_wls.jar`      WebLogic software
- `jdk-8u152-linux-x64.tar.gz`  Java JDK software
- `jce_policy-8.zip`            Java Encryption Policy

Run Puppet and you have a Server with WebLogic installed, a domain called `MYDOMAIN` and a cluster called `main`.  Check the documentation for all the settings you can manage. Here is a list of the most basic stuff you'd probably want to change:

```yaml
wls_profile::domain_name:         MYDOMAIN                      # The domain name
wls_profile::cluster_name:        main                          # Cluster name
wls_profile::weblogic_password:   Welcome01                     # Weblogic password
wls_profile::source:              puppet:///modules/software    # Location where the files are fetched from
wls_profile::weblogic::ssh_setup::public_key:                     AAAAB3N.....M43olbQ==
wls_profile::weblogic::ssh_setup::private_key: |
  -----BEGIN RSA PRIVATE KEY-----
  MIIJKQIBAAKCAgEA5zOPmOVSF3MFXaEoLlbZICXuG0q2uT5kW1BwRzDbzVdiJtuA
  ...
  PsLoml7g3jpGkRb3xgW1N4N4Xt+Vkzp6qAB5aqvCZO3EoHfeOS5DE9O+XbSW
  -----END RSA PRIVATE KEY-----
```

## Reference

Here you can find some more information regarding this puppet module:
- [The `wls_profile` documentation](https://www.enterprisemodules.com/docs/wls_profile/description.html)
- [The `wls_install` documentation](https://www.enterprisemodules.com/docs/wls_install/description.html)
- [The `wls_config` documentation](https://www.enterprisemodules.com/docs/wls_config/description.html)

Here are related blog posts:
- [Introducing version 3 of wls_config](https://www.enterprisemodules.com//blog/2016/05/introducing-version-3-of-wls-config/)
- [Know thy WebLogic configuration using Puppet](https://www.enterprisemodules.com//blog/2016/01/know-thy-weblogic-configuration-using-puppet/)
- [Manage your WebLogic JMS config with Puppet](https://www.enterprisemodules.com//blog/2016/01/manage-your-weblogic-jms-config-with-puppet/)
- [Using Puppet to install and manage your WebLogic infrastructure](https://www.enterprisemodules.com//blog/2015/11/using-puppet-to-configure-your-weblogic-infrastructure/)

Some example code:
- [Simple WLS demo](https://github.com/enterprisemodules/simple_wls_demo)
- [Simple osb demo](https://github.com/enterprisemodules/simple_osb_demo)
- [Simple soa demo](https://github.com/enterprisemodules/simple_soa_demo)

## Limitations

This module runs on Solaris and most Linux versions. It requires a puppet version higher than 4.10.8. The module does **NOT** run on windows systems.
