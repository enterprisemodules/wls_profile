#++--++
#
# wls_profile::weblogic::java_software
#
# @summary This class is the default implementation for making sure the Java software is correctly installed on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [String] version
#    The version of java you want to use.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::java_version` to change it to your requested value.
#    Default value: `8u152`
#
# @param [String] full_version
#    The full version of java you want to use.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::java_full_version` to change it to your requested value.
#    Default value: `jdk1.8.0_152`
#
# @param [String] cryptography_extension_file
#    Cryptographic extension file to use.
#    Default value: `jce_policy-8.zip`
#
# @param [String] source
#    The location where the classes can find the software.
#    You can specify a local directory, a Puppet url or an http url.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::source` to change it to your requested value.
#    The default is : `puppet:///modules/software/`
#
# @param [Boolean] urandom_fix
#    Enable the urandom fix.
#    Default value: `true`
#
# @param [Boolean] rsa_key_size_fix
#    Enable the RSA keysize fix.
#    Default value: `true`
#
# @param [Boolean] x64
#    Install x64 version of java.
#    Default value: `true`
#
# @param [Integer] alternatives_priority
#    alternatives priority for jdk.
#    Default value is: `18001`
#
#--++--
# lint:ignore:variable_scope
class wls_profile::weblogic::java_software(
  String  $version,
  String  $full_version,
  String  $cryptography_extension_file,
  String  $source,
  Boolean $urandom_fix,
  Boolean $rsa_key_size_fix,
  Boolean $x64,
  Integer $alternatives_priority,
) inherits wls_profile {
  echo {"Java version ${version}":
    withpath => false
  }

  $remove = [ 'java-1.7.0-openjdk.x86_64', 'java-1.6.0-openjdk.x86_64' ]

  package { $remove:
    ensure  => absent,
  }

  ->jdk7::install7{ "jdk-${version}-linux-x64":
    version                     => $version ,
    full_version                => $full_version,
    alternatives_priority       => $alternatives_priority,
    x64                         => $x64,
    download_dir                => $download_dir,
    urandom_java_fix            => $urandom_fix,
    rsa_key_size_fix            => $rsa_key_size_fix,
    cryptography_extension_file => $cryptography_extension_file,
    source_path                 => $source,
  }
}
# lint:endignore:variable_scope
