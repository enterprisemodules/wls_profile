The name of the class you want to execute directly **after** the `wls_jms` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_jms:  my_module::my_class
```
