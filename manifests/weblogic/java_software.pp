#
# wls_profile::weblogic::java_software
#
# @summary This class is the default implementation for making sure the Java software is correctly installed on your system.
# Using hiera, you can customize some of the aspects of this process.
# 
# When these customizations aren't enough, you can replace the class with your own class. See [wls_profile::weblogic](./weblogic.html) for an explanation on how to do this.
#
# @param [String[1]] version
#    The version of java you want to use.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::java_version` to change it to your requested value.
#    Default value: `8u152`
#
# @param [String[1]] full_version
#    The full version of java you want to use.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::java_full_version` to change it to your requested value.
#    Default value: `jdk1.8.0_152`
#
# @param [Optional[String[1]]] cryptography_extension_file
#    Cryptographic extension file to use.
#    Default value: `jce_policy-8.zip`
#
# @param [String[1]] source
#    The location where the classes can find the software.
#    You can specify a local directory, a Puppet url or an http url.
#    This value is used in multiple places. To make sure in all classed the correct value is used, use the hiera key `wls_profile::source` to change it to your requested value.
#    The default is : `puppet:///modules/software/`
#
# @param [Optional[Boolean]] urandom_fix
#    Enable the urandom fix.
#    This parameter is deprecated and will be removed in a next version.
#    Default value: `true`
#
# @param [Optional[Boolean]] rsa_key_size_fix
#    Enable the RSA keysize fix.
#    Default value: `true`
#
# @param [Boolean] x64
#    Install x64 version of java.
#    Default value: `true`
#
# @param [Optional[Integer]] alternatives_priority
#    alternatives priority for jdk.
#    Default value is: `18001`
#
#
# See the file "LICENSE" for the full license governing this code.
#
class wls_profile::weblogic::java_software (
  Optional[Integer]   $alternatives_priority,
  String[1]           $full_version,
  Optional[Boolean]   $rsa_key_size_fix,
  String[1]           $source,
  Optional[Boolean]   $urandom_fix,
  String[1]           $version,
  Boolean             $x64,
  Optional[String[1]] $cryptography_extension_file = undef,
) inherits wls_profile {
  echo { "Java version ${version}":
    withpath => false,
  }

  $java_homes = '/usr/java'

  if $alternatives_priority != undef {
    deprecation (alternatives_priority, "Parameter 'wls_profile::weblogic::java_software::alternatives_priority' is deprecated and will be removed in a future release")
  }

  if $cryptography_extension_file != undef {
    $jce = true
  } else {
    $jce = false
  }

  $version_major = $version.split('u')[0]
  $version_minor = $version.split('u')[1]

  case  $facts['os']['name'] {
    'AIX': {
      package { 'Java8_64.jre':
        ensure   => $version,
        source   => $source,
        provider => 'aix',
      }
      package { 'Java8_64.sdk':
        ensure   => $version,
        source   => $source,
        provider => 'aix',
      }
    }
    'RedHat', 'CentOS', 'OracleLinux', 'AlmaLinux', 'Rocky': {
      $remove = ['java-1.8.0-openjdk.x86_64', 'java-1.7.0-openjdk.x86_64', 'java-1.6.0-openjdk.x86_64']

      easy_type::debug_evaluation() # Show local variable on extended debug

      package { $remove:
        ensure => absent,
      }
      -> java::download { "jdk-${version}-linux-x64.tar.gz":
        ensure         => 'present',
        java_se        => 'jdk',
        version_major  => $version,
        version_minor  => '',
        url            => "${source}/jdk-${version}-linux-x64.tar.gz",
        package_type   => 'tar.gz',
        jce            => $jce,
        jce_url        => "${source}/${cryptography_extension_file}",
        manage_basedir => true,
        java_home      => $wls_profile::jdk_home,
      }

      -> file { '/usr/bin/java':
        ensure => 'link',
        target => "${wls_profile::jdk_home}/bin/java",
      }

      if ($urandom_fix == true) {
        exec { "set urandom ${full_version}":
          command => "sed -i -e's/^securerandom.source=.*/securerandom.source=file:\\/dev\\/.\\/urandom/g' ${java_homes}/${full_version}/jre/lib/security/java.security",
          unless  => "grep '^securerandom.source=file:/dev/./urandom' ${java_homes}/${full_version}/jre/lib/security/java.security",
          require => Java::Download["jdk-${version}-linux-x64.tar.gz"],
          path    => '/bin',
        }
      }

      if ($rsa_key_size_fix == true) {
        exec { "sleep 3 sec for urandomJavaFix ${full_version}":
          command => '/bin/sleep 3',
          unless  => "grep 'RSA keySize < 512' ${java_homes}/${full_version}/jre/lib/security/java.security",
          require => Java::Download["jdk-${version}-linux-x64.tar.gz"],
          path    => '/bin',
        }
        ~> exec { "set RSA keySize ${full_version}":
          command     => "sed -i -e's/RSA keySize < 1024/RSA keySize < 512/g' ${java_homes}/${full_version}/jre/lib/security/java.security",
          unless      => "grep 'RSA keySize < 512' ${java_homes}/${full_version}/jre/lib/security/java.security",
          refreshonly => true,
          path        => '/bin',
        }
      }
    }
    'Solaris': {
      jdksolaris::install7 { "jdk-${version}-solaris":
        version      => $version ,
        full_version => $full_version,
        x64          => $x64,
        download_dir => $wls_profile::download_dir,
        source_path  => $source,
      }
    }
    default: {
      fail "Don't know how to install Java on ${facts['os']['name']}"
    }
  }
}
