This class is the default implementation for creating the required OS users and groups for the installation of WebLogic.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
    :file_name,
    :oracle_base,
    :middleware_home,
    :weblogic_home,
    :jdk_home,
    :os_user,
    :os_group,
    :source,
    :version
] %>

