This class is the default implementation for installing the WebLogic software on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
  :version,
  :file_name,
  :oracle_base,
  :middleware_home,
  :jdk_home,
  :os_user,
  :os_group,
  :source,
  :fmw_infra,
] %>
