The name of the class you want to execute directly **before** the `copy_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::node::before_copy_domain:  my_module::my_class
```
