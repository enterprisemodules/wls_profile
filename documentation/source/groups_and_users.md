This class is the default implementation for creating the required OS users and groups for the installation of WebLoic.

Using hiera, you you can customize some of the aspects of this proces.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
  :users,
  :groups,
] %>

