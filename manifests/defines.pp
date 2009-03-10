# manifests/defines.pp

define logrotate::snippet($source = 'absent' ){

    if $source == 'absent' {
        $real_source = [ "puppet://$server/files/logrotate/snippets/${fqdn}/${name}",
                         "puppet://$server/files/logrotate/snippets/${domain}/${name}",
                         "puppet://$server/files/logrotate/snippets/${name}" ]
    } else {
        $real_source = $source
    }   
 
    file{"/etc/logrotate.d/${name}":
        source => $real_source,
        owner => root, group => 0, mode => 0644;
    }
}
