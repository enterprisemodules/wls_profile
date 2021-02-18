This class is the default implementation for ensuring your WebLogic software has all the required patches installed.

Using hiera, you can customize some of the aspects of this process.

When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.

The easiest and best way to specify your patches is to specify a `level`. An example of a patch level is `JAN2021RU`, meaning the JAN 2021 patch level update.

You can also add additional 'one-off's'. Use the `list` property to add these.

When you don't specify a patch windows, Puppet will never patch a running domain. It will however provide your installations with the specified patch level at the initial run or when the WebLogic domain is not running at the start of the Puppet run.

<%- include_attributes [
  :level,
  :version,
  :middleware_home,
  :orainst_dir,
  :jdk_home,
  :os_user,
  :list,
  :domains_dir,
  :weblogic_home,
  :os_group,
  :weblogic_user,
  :weblogic_password,
  :adminserver_port,
  :nodemanager_port,
  :wait_for_nodemanager,
  :nodemanager_address,
  :adminserver_address,
  :jsse_enabled,
  :custom_trust,
  :trust_keystore_file,
  :patch_window,
  :logoutput
] %>