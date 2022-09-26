# Changelog

All notable changes to this project will be documented in this file.


## Release 0.23.0


**Features**

- [wls_domain,copy_domain] Add support for java_update_window

**Bug fixes**

- [docs] Re-add documentation to puppet source

## Release 0.22.0

**Bug fixes**

- [em_license] Fix for using EM profile classed together

## Release 0.21.0

**Features**

- [wls_patches] Warn when patchlevel not defined
- [data] Added JUL2022RU patchlevels for 12.2.1.3, 12.2.1.4
- [data] Added APR2022RU patchlevels for 12.2.1.3, 12.2.1.4 and 14.1
- [stop_managed_servers] Removed debugging notice

## Release 0.20.0

**Features**

- [wls_patches] Only stop the managed servers on current node for patching
- [copy_domain] Also add the basic wls_setting information to the node

**Bugs**

- [wls_domain] Remove hard coded machine name
- [wls_servers] Change default port for nodemanager from 7001 to 5556
- [managed_server] Pass the log directory when defining server
- [release] update required version of easy_type

## Release 0.19.0

**Features**

-[release] Add support for AlmaLinux and RockyLinux

**Bugs**

- [em_license] Use license::activate instead of license::available

## Release 0.18.0

**Features**

- [data] Add January 2022 PSU patch levels for 1.2.1.3, 12.2.1.4 and 14.1

**Bugs**

- [wls_patches] Remove unused variable


## Release 0.17.1


**Bugs**

- [weblogic] ADF doesn’t need additional fmw software


## Release 0.17.0

**Features**

- [core] Add fact caching
- [wls_patches] Adjust for new fact structure of wls_install


**Bugs**

- [core] Fix installation and creation of ADF

## Release 0.15.3

**Bugs**

- [copy_domain] Add support for different adminserver ports
- [wls_patches] Fix stopping nodemanager

## Release 0.15.2

**Bugs**

- [plan/apply_patches] Fix typo

## Release 0.15.1

**Bugs**

- [wls_patches] Stop the wlst daemon for sane restarts

## Release 0.15.0

**Features**

- [wls_domain] Add support for administration_port_enabled

## Release 0.14.0

**Features**

- [copy_domain] Add support for custom identities

## Release 0.13.0

**Features**

- [java_software] Support skipping JCE installation

## Release 0.12.1

**Bugs**

- [groups_and_users] Use defined os_user for directory too

## Release 0.12.0

**Features**

- [wls_domain] Add support for specifying a puppet domain alias

**Bugs**

- [wls_domain] Use domain alias for identifying Adminserver


## Release 0.11.1

**Chore**

- [data] Remove default managed servers

## Release 0.11.0

**Features**

- [apply_patches] Add initial bolt plan to apply WebLogic patches from bolt
- [wls_patches] Add patchlevel functionality


## Release 0.10.3

**Bugs**

- [groups_and_users] Fix OS password generation

## Release 0.10.2

**Bugs**

- [groups_and_users] Leave hashing of os passwords to class

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