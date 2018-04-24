This defined type is the default implementation for defining a managed server in your WebLogic domain. It is called once for every machine server combination you passed to `wls_profile::admin_server::wls_servers`.

Using hiera, you you can customize some of the aspects of this proces.


<%- include_attributes [
  :machine_name,
  :listenaddress,
  :domain_name,
  :server_arguments,
  :server_defaults,
  :machine_defaults,
] %>
