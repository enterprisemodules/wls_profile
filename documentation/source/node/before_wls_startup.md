The name of the class you want to execute directly **before** the `wls_startup` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::node::before_wls_startup:  my_module::my_class
```
