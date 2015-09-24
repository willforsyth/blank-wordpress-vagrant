class apt {
    
    exec { 'apt-get update':
        command => '/usr/bin/apt-get update --fix-missing',
        unless  => "cat /var/log/apt/history.log | grep `date '+%Y-%m-%d'`"
    }
}
