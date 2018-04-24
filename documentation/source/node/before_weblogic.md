The name of the class you want to execute directly **before** the `weblogic` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::node::before_weblogic:  my_module::my_class
```
