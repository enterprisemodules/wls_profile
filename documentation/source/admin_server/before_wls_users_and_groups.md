The name of the class you want to execute directly **before** the `wls_users` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::before_wls_users:  my_module::my_class
```
