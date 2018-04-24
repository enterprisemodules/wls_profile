The name of the class you want to execute directly **after** the `ssh_setup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_ssh_setup:  my_module::my_class
```
