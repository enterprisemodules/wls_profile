The name of the class you want to execute directly **after** the `java_software` class.

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::weblogic::after_java_software:  my_module::my_class
```
