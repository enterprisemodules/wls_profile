The name of the class you want to execute directly **before** the `wls_software` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::before_wls_software:  my_module::my_class
```
