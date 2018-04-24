This class is the default implementation for ensuring the correct WebLogic users and groups are available on the system.

Using hiera, you you can customize some of the aspects of this proces.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.


<%- include_attributes [
  :group_list,
  :user_list,
] %>
