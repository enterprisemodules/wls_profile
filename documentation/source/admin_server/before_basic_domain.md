The name of the class you want to execute directly **before** the `basic_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_basic_domain:  my_module::my_class
```
