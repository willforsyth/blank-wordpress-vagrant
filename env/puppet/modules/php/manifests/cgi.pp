class php::cgi {

    include php
    
    $packages = [
        'php5-cgi',
        'spawn-fcgi'
    ]
    
    package { $packages:
        ensure  => present,
        require => Exec['apt-get update']
    }

    service { 'php-fastcgi':
        ensure  => running,
        start   => '/etc/init.d/php-fastcgi start',
        stop    => '/etc/init.d/php-fastcgi stop',
        restart => '/etc/init.d/php-fastcgi stop && /etc/init.d/php-fastcgi start',
        status  => 'ps aux | grep php5-cgi | grep -v grep',
        require => [File['/etc/init.d/php-fastcgi'], File['/etc/php5/cgi/php.ini']]
    }

    file { '/etc/php5/cgi/php.ini':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/php/templates/php.ini',
        require => Package['php5-cgi'],
        notify  => Service['php-fastcgi']
    }
    
    file { '/etc/init.d/php-fastcgi':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/php/templates/php-fastcgi',
        require => [Package['spawn-fcgi'], Package['php5-cgi']],
        mode    => '0777'
    }
    
    exec { 'update-rc.d php-fastcgi defaults':
        unless  => 'service --status-all 2>&1|grep php-fastcgi',
        command => 'update-rc.d php-fastcgi defaults',
        require => File['/etc/init.d/php-fastcgi']
    }
}