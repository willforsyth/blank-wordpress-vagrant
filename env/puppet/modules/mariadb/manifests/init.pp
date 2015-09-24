class mariadb {

    $password = 'root'
    
    package { 'mariadb-server':
        ensure  => present,
        require => Exec['apt-get update']
    }
    
    service { 'mysql':
        ensure  => running,
        require => Package['mariadb-server']
    }
    
    file { '/etc/mysql/my.cnf':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///data/modules/mariadb/templates/my.cnf',
        require => Package['mariadb-server'],
        notify  => Service['mysql']
    }
    
    exec { 'mariadb-root-password':
        unless  => "mysqladmin -u root -p${password} status",
        command => "mysqladmin -u root password ${password}",
        require => Service['mysql']
    }

    file { '/usr/local/bin/mysqlbackup':
        owner   => 'root',
        group   => 'root',
        mode    => 0755,
        content => template('mariadb/mysqlbackup.erb'),
        require => Service['mysql']
    }

    cron { 'mysqlbackup cron':
        ensure  => present,
        command => '/usr/local/bin/mysqlbackup >> /var/log/mysqlbackup.log',
        user    => root,
        hour    => [10, 12, 14, 16],
        minute  => 0,
        require => File['/usr/local/bin/mysqlbackup']
    }
    
    exec { 'add-remote-root':
        command => "echo 'GRANT ALL PRIVILEGES ON *.* TO '\\''root'\\''@'\\''%'\\'' IDENTIFIED BY '\\''${password}'\\'';' | mysql -u root -p${password}",
        require => Exec['mariadb-root-password']
    }
    
    exec { 'flush-privileges':
        command => "echo 'FLUSH PRIVILEGES;' | mysql -u root -p${password}",
        require => Exec['add-remote-root']
    }
}