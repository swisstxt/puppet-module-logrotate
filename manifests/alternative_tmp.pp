class logrotate::alternative_tmp inherits logrotate::base {
  file{"/var/roottmp":
    ensure => directory,
    mode => 0750, owner => root, group => 0;
  }
  File["/etc/cron.daily/logrotate"]{
    source => [
      "puppet://$server/modules/logrotate/alternative_tmp/logrotate.cron.daily.$operatingsystem.$lsbdistrelease",
      "puppet://$server/modules/logrotate/alternative_tmp/logrotate.cron.daily.$operatingsystem",
      "puppet://$server/modules/logrotate/alternative_tmp/logrotate.cron.daily",
    ],
    require +> File["/var/roottmp"],
  }
}
