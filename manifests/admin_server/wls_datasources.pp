# wls_profile::admin_server::wls_datasources
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include wls_profile::admin_server::wls_datasources
class wls_profile::admin_server::wls_datasources(
  Hash $list,
) {
  echo {"WebLogic Datasources ${list.keys.join(',')} ":
    withpath => false,
  }
  #
  # This is a simple way to get started. It is easy to get started, but
  # soon your hiera yaml become a nightmare. Our advise is when you need
  # to let puppet manage your tablespaces, to override this class and 
  # add your own puppet implementation. This is much better maintainable
  # and adds more consistency,
  #
  create_resources(wls_datasource, $list)
}
