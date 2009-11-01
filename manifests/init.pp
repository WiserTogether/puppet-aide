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

	file { "/etc/aide.conf":
        source => [ "puppet://$server/files/aide/${fqdn}/aide.conf",
                    "puppet://$server/files/aide/${operatingsystem}/aide.conf",
                    "puppet://$server/files/aide/aide.conf",
                    "puppet://$server/modules/aide/${operatingsystem}/aide.conf",
                    "puppet://$server/modules/aide/aide.conf"
                ],
        ensure => file,
        force => true,
        mode => 0644, owner => root, group => 0;
    }
	file { "/etc/cron.daily/aide.cron":
        source => [ "puppet://$server/files/aide/${fqdn}/aide.cron",
                    "puppet://$server/files/aide/${operatingsystem}/aide.cron",
                    "puppet://$server/files/aide/aide.cron",
                    "puppet://$server/modules/aide/${operatingsystem}/aide.cron",
                    "puppet://$server/modules/aide/aide.cron"
                ],
        ensure => file,
        force => true,
        mode => 0755, owner => root, group => 0;
    }
	file { "/var/lib/aide/aide.db":
        source => "puppet://$server/files/aide/${fqdn}/aide.db",
        ensure => file,
        force => true,
        mode => 0400, owner => root, group => 0;
    }
}

class aide::gentoo inherits aide::base {
    Package[aide] {
        category => 'app-forensics',
    }

    File["/etc/aide.conf"]{
        path => "/etc/aide/aide.conf",
    }
}
