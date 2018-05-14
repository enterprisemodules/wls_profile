# wls_profile::weblogic::java_software
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::weblogic::java_software
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
    download_dir                => '/var/tmp/install',
    urandom_java_fix            => $urandom_fix,
    rsa_key_size_fix            => $rsa_key_size_fix,
    cryptography_extension_file => $cryptography_extension_file,
    source_path                 => $source,
  }
}
