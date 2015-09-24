class php {

    $packages = [
        'php5-cli',
        'php5-curl',
        'php5-mcrypt',
        'php5-mysql',
        'php5-gd',
        'php5-xdebug'
    ]
    
    package { $packages:
        ensure  => present,
        require => Exec['apt-get update']
    }
    
    file { '/etc/php5/cli/php.ini':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/php/templates/php.ini',
        require => Package['php5-cli'],
    }
    
    file { '/etc/php5/mods-available/xdebug.ini':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/php/templates/xdebug.ini',
        require => [Package['php5-cli'], Package['php5-xdebug']],
    }
}