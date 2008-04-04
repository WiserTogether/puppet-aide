# modules/aide/manifests/init.pp - manage aide
# Copyright (C) 2007 admin@immerda.ch
# 

class aide {
    case $operatingsystem {
        gentoo: { include aide::gentoo }
        default: { include aide::base }
    }

}

class aide::base {
	package { 'aide':
        ensure => present,
    }

	file { "/etc/aide/aide.conf":
        source => [ "puppet://$servername/files/aide/${fqdn}/aide.conf",
                    "puppet://$servername/files/aide/aide.conf",
                    "puppet://$servername/aide/aide.conf"
                ],
        ensure => file,
        force => true,
        mode => 0644, owner => root, group => 0;
    }
	file { "/etc/cron.daily/aide.cron":
        source => [ "puppet://$servername/files/aide/${fqdn}/aide.cron",
                    "puppet://$servername/files/aide/aide.cron",
                    "puppet://$servername/aide/aide.cron"
                ],
        ensure => file,
        force => true,
        mode => 0755, owner => root, group => 0;
    }
	file { "/var/lib/aide/aide.db":
        source => [
            "puppet://$servername/files/aide/${fqdn}/aide.db",
            "puppet://$servername/files/aide/aide.db",
            "puppet://$servername/aide/aide.db"
        ],
        ensure => file,
        force => true,
        mode => 0400, owner => root, group => 0;
    }
}

class aide::gentoo inherits aide::base {
    Package[aide] {
        category => 'app-forensics',
    }
}
