class mailcatcher {

    service { 'catchmail':
        ensure  => running,
        require => Exec['update-rc.d catchmail defaults']
    }

    package { 'libsqlite3-dev':
        ensure  => present,
        require => Exec['apt-get update']
    }

    exec { 'install mailcatcher':
        command => 'gem install mailcatcher',
        unless  => 'gem list mailcatcher -i',
        require => Package['ruby-dev', 'ruby', 'g++', 'libsqlite3-dev']
    }

    file { '/etc/init.d/catchmail':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/mailcatcher/templates/catchmail',
        require => Exec['install mailcatcher'],
        mode    => '0777'
    }

    exec { 'update-rc.d catchmail defaults':
        unless  => 'service --status-all 2>&1|grep mailcatcher',
        command => 'update-rc.d catchmail defaults',
        require => File['/etc/init.d/catchmail']
    }

    file { '/etc/php5/mods-available/mailcatcher.ini':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/mailcatcher/templates/mailcatcher.ini',
        require => Package['php5-cgi'],
        mode    => '0777'
    }

    exec { 'php5enmod mailcatcher':
        command => 'php5enmod mailcatcher',
        require => File['/etc/php5/mods-available/mailcatcher.ini']
    }
}
