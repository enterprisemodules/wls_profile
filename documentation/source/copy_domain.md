This class is the default implementation to copy the packed domain from the Admin Server, unpack it on the current machine and start the nodemanager.

Using hiera, you you can customize some of the aspects of this proces.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::node](./node.html) for an explanation on how to do this.

<%- include_attributes [
  :domain_name,
  :version,
  :weblogic_home,
  :log_dir,
  :middleware_home,
  :jdk_home,
  :domains_dir,
  :os_user,
  :os_group,
  :adminserver_address,
  :adminserver_port,
  :nodemanager_address,
  :nodemanager_wait,
  :weblogic_user,
  :weblogic_password,
] %>


