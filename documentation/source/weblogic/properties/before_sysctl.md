The name of the class you want to execute directly **before** the `sysctl` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_sysctl:  my_module::my_class
```
