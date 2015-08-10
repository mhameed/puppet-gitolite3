# == Class gitolite3::params
#
# This class is meant to be called from gitolite3.
# It sets variables according to platform.
#
class gitolite3::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'gitolite3'
      $service_name = 'gitolite3'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $gitdir    = "/var/lib/gitolite3"
  $gituser    = "gitolite3"

}
