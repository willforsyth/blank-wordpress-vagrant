class ruby {
    
    package { 'ruby':
        ensure  => 'present',
        require => Exec['apt-get update']
    }
    
    package { 'g++':
        ensure  => 'present',
        require => Exec['apt-get update']
    }
    
    package { 'ruby-dev':
        ensure  => 'present',
        require => Exec['apt-get update']
    }
}