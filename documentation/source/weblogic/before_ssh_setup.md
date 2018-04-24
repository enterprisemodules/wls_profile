The name of the class you want to execute directly **before** the `ssh_setup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_ssh_setup:  my_module::my_class
```
