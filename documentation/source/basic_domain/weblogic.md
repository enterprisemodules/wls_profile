Use this value if you want to skip or use your own class for stage `weblogic`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::weblogic:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::basic_domain::weblogic:  skip
```
