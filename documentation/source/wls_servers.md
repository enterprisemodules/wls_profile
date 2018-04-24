This class makes sure all te required WebLogic machines and servers are defined on your system.

Using hiera, you you can customize some of the aspects of this proces.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
  :domain_name,
  :servers,
  :server_defaults,
  :machine_defaults,
] %>
