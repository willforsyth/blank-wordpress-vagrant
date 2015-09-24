Exec {
    path => ['/usr/bin', '/bin', '/usr/sbin', '/sbin', '/usr/local/bin', '/usr/local/sbin']
}

include bootstrap
include apt
include php
include php::cgi
include nginx
include mariadb
#include mailcatcher
#include ruby
