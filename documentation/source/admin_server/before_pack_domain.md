The name of the class you want to execute directly **before** the `pack_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_pack_domain:  my_module::my_class
```
