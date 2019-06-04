This class is the default implementation for creating a WebLogic cluster on your system. 

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::admin_server](./admin_server.html) for an explanation on how to do this.

<%- include_attributes [
  :domain_name,
  :cluster_name,
  :servers,
  :cluster_defaults,
] %>