The name of the class you want to execute directly **after** the `wls_domain` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::after_wls_domain:  my_module::my_class
```
