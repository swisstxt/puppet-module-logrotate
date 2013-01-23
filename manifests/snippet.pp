define logrotate::snippet(
  $site_module = 'site_logrotate',
  $template = false
) {
  file{"/etc/logrotate.d/$name":
    require => Package['logrotate'],
    owner => root, group => root, mode => 0644;
  }
  if $template {
		File["/etc/logrotate.d/$name"]{
			content => template("$site_module/$name"),
		}
  } else {
		File["/etc/logrotate.d/$name"]{
			source => [
				"puppet://modules/$site_module/$fqdn/$name",
				"puppet://modules/$site_module/$name",
				"puppet://modules/logrotate/$name",
			],
		}
  }
}
