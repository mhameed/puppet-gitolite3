# Class: gitolite3
# ===========================
#
# Full description of class gitolite3 here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#

class gitolite3 (
  $admin_key,
  $git_user = $::gitolite3::params::git_user,
  $git_dir = $::gitolite3::params::git_dir,
  $package_name = $::gitolite3::params::package_name,
  $conf_clone_url = '',
) inherits ::gitolite3::params {

  # validate parameters here

  class { '::gitolite3::install': } ->
  Class['::gitolite3']
}
