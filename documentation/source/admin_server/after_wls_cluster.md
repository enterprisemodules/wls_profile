The name of the class you want to execute directly **after** the `wls_cluster` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::admin_server::after_wls_cluster:  my_module::my_class
```
