class bootstrap {

    group { 'puppet':
        ensure  => 'present',
        require => Exec['apt-get update']
    }
    
    exec { 'locale-gen en_GB.UTF-8':
        command => 'locale-gen en_GB.UTF-8'
    }
    
    exec { 'set home directory':
        command => 'echo "if [ -d /vagrant ]; then cd /vagrant; fi" >> /home/vagrant/.bashrc'
    }
}