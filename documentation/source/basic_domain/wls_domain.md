This class is the default implementation for defining a domain on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::basic_domain](./basic_domain.html) for an explanation on how to do this.

<%- include_attributes [
  :domain_name,
  :domain_alias,
  :version,
  :weblogic_home,
  :domains_dir,
  :log_dir,
  :template_name,
  :nodemanager_address,
  :adminserver_address,
  :nodemanager_properties,
  :nodemanager_port,
  :adminserver_port,
  :administration_port_enabled,
  :administration_port,
  :adminserver_ssl_port,
  :java_update_window,
  :os_user,
  :os_group,
  :weblogic_user,
  :weblogic_password,
  :bam_enabled,
  :b2b_enabled,
  :ess_enabled,
  :development_mode,
  :nodemanager_wait,
  :adminserver_settings,
  :wslt_args,
] %>
