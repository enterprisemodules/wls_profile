Use this value if you want to skip or use your own class for stage `copy_domain`.

## Use your own class

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::node::copy_domain:  my_module::my_class
```

## Skip

You can use hiera to set this value. Here is an example:

```yaml
wls_profile::node::copy_domain:  skip
```
