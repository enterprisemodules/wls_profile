# Changelog

All notable changes to this project will be documented in this file.

## Release 0.10.1

**Bugs**

- [release] Add WebLogic 14.1.1.0 support to rhe README
- [basic_domain] replace deprecated staged_contain for ordered_steps

## Release 0.10.0

**Features**

- [release] Add support for puppet 7 to the metadata

## Release 0.9.0

**Features**

- [weblogic] Automaticaly fetch EM licenses

## Release 0.8.1

**Bugfixes**

- [wls_startup] Use custom trusts for startup
- [java_software] Add entropy fix

## Release 0.8.0

**Features**

- [java_software] Start using module puppetlabs-java

## Release 0.7.0

**Features**

- [wls_domain] Add support for ssl communication

**Bugfixes**

- [core] Remove hardcoded passwords

## Release 0.6.1

**Bugfixes**

- [wls_domain] Add repo_sys_password to list of keys to convert to Sensitive

## Release 0.6.0

**Features**

- [core] Generated password added
- [core] Add support for Sensitive data
- [weblogic] Don’t install fusion software when install_type is ADF

**Bugfixes**

- [core] Also include original lookups of Sensitive passwords in lookup options

## Release 0.5.1

**Features**

- [wls_domain] Add support for more fusion domain types
- [release] Update readme to indicate support for WebLogic 12.2.1.4

## Release 0.5.0

**Features**

[core] Add basic support for Solaris

## Release 0.4.0

**Features**

- [core] Add AIX support

## Release 0.3.3

**Bugfixes**

- [wls_domain] Add extra properties parameter

## Release 0.3.2

**Bugfixes**

- [core] Export the download_dir and temp_dir parameters
- [copy_domain] Fix directory issues

## Release 0.3.1

**Features**

None

**Bugfixes**

-[copy_domain] Fix used app dir

## Release 0.3.0

**Features**

- [wls_opatch] Initial implementation

**Bugfixes**

None

## Release 0.2.1

**Features**

None

**Bugfixes**

- [wls_patches] Fix puppet type for the patches
- [weblogic] Add missing fmw_software variables
- [core] Add support for Sensitive data
- [packages] Use Hash, like other profiles

## Release 0.2.0

**Features**

- Add basic support for Fusion Middleware
- Make ready for Puppet 6

**Bugfixes**

None

## Release 0.1.4

**Features**

None

**Bugfixes**

- Fix used resource types in wls_jms

## Release 0.1.3

**Features**

- Manage firewall ports on both RHEL5 and RHEL > 5 systems
- Add unit and acceptance tests
- Remove reliance on old defauts
- implement EM Quality control

**Bugfixes**

None

**Known Issues**

None

## Release 0.1.2

**Features**

None

**Bugfixes**

Fix README

**Known Issues**

None

## Release 0.1.1

**Features**

None

**Bugfixes**

Fix README

**Known Issues**

None

## Release 0.1.0

**Features**

- Install basic Weblogic systems

**Bugfixes**

None

**Known Issues**

- No good firewall implementation
- No good wls_patches implementation