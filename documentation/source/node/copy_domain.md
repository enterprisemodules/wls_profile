This class is the default implementation to copy the packed domain from the Admin Server, unpack it on the current machine and start the nodemanager.

Using hiera, you can customize some of the aspects of this process.

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
  :administration_port,
  :administration_port_enabled,
  :adminserver_ssl_port,
  :nodemanager_address,
  :nodemanager_properties,
  :nodemanager_wait,
  :weblogic_user,
  :weblogic_password,
  :java_update_window,
  :jsse_enabled,
  :custom_trust,
  :trust_keystore_file,
  :trust_keystore_passphrase,
  :custom_identity,
  :custom_identity_keystore_filename,
  :custom_identity_alias,
  :custom_identity_keystore_passphrase,
  :custom_identity_privatekey_passphrase,
  :use_ssh,
  :copy_script,
  :domain_pack_dir,
] %>


