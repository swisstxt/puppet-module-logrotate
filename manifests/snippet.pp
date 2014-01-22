define logrotate::snippet(
  $template = false,
  $source_module = $caller_module_name,
) {
  file{"/etc/logrotate.d/$name":
    owner   => root,
    group   => root,
    mode    => 0644,
    require => Package['logrotate'],
  }
  if $template {
		File["/etc/logrotate.d/$name"]{
			content => template("$source_module/$name"),
		}
  } else {
		File["/etc/logrotate.d/$name"]{
			source => [
				"puppet:///modules/$source_module/$name",
				"puppet:///modules/logrotate/$name",
			],
		}
  }
}
