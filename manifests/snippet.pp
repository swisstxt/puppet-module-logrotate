define logrotate::snippet(
  $source = 'absent'
) {
  if $source == 'absent' {
    $real_source = [
      "puppet://$server/modules/site-logrotate/snippets/$fqdn/$name",
      "puppet://$server/modules/site-logrotate/snippets/$domain/$name",
      "puppet://$server/modules/site-logrotate/snippets/$name",
    ]
  } else {
    $real_source = $source
  }   
  file{"/etc/logrotate.d/$name":
    source => $real_source,
    owner => root, group => 0, mode => 0644;
  }
}
