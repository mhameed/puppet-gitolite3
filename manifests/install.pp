# == Class gitolite3::install
#
# This class is called from gitolite3 for install.
#
class gitolite3::install {
  $admin_key = $::gitolite3::admin_key
  $git_user = $::gitolite3::git_user
  $git_dir = $::gitolite3::git_dir
  $pkg = $::gitolite3::package_name
  $preseed_file = "/tmp/${pkg}.preseed"

  $line1 = "gitolite3	gitolite3/adminkey	string	${admin_key}"
  $line2 = "gitolite3	gitolite3/gituser	string	${git_user}"
  $line3 = "gitolite3	gitolite3/gitdir	string	${git_dir}"
  $settings = "${line1}\n${line2}\n${line3}\n"

  file { $preseed_file:
    owner => 'root',
    group => 'root',
    mode  => '0600',
    content => $settings,
  }

  package { $pkg:
    ensure => present,
    responsefile => $preseed_file,
    require => File[$preseed_file],
  }
}
