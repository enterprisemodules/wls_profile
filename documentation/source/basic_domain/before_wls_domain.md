The name of the class you want to execute directly **before** the `wls_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::before_wls_domain:  my_module::my_class
```
