import "classes/*"

class aide {
    package { 'aide':
        ensure => installed,
    }

    #Ensure prelinking is disabled
    exec { '/usr/bin/perl -pi -e s/PRELINKING=yes/PRELINKING=no/ /etc/sysconfig/prelink':
        alias => 'disable prelink config',
    }
    exec { '/usr/sbin/prelink -ua':
        alias => 'disable prelink',
        require => Exec['disable prelink config'],
    }
}
