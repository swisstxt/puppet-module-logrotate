#
# logrotate module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

# modules_dir { "logrotate": }

class logrotate {
    include logrotate::base
}

class logrotate::base {
    package{logrotate:
        ensure => present,
    }

    file{"/etc/cron.daily/logrotate":
        source => [ "puppet://$server/logrotate/logrotate.cron.daily.${operatingsystem}.${lsbdistrelease}",
                    "puppet://$server/logrotate/logrotate.cron.daily.${operatingsystem}",
                    "puppet://$server/logrotate/logrotate.cron.daily" ],
        require => Package[logrotate],
        owner => root, group => 0, mode => 0755;
    }
}


