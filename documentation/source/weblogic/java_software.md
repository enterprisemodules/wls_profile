This class is the default implementation for making sure the Java software is correctly installed on your system.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
  :version,
  :full_version,
  :cryptography_extension_file,
  :source,
  :urandom_fix,
  :rsa_key_size_fix,
  :x64,
  :alternatives_priority,
] %>

