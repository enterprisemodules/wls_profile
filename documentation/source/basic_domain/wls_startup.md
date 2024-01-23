This class is the default implementation for making sure WebLogic gets started after a system reboot.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
  :domain_name,
  :version,
  :weblogic_home,
  :domains_dir,
  :log_dir,
  :os_user,
  :environment_file
] %>
