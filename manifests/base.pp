class aide::base {
	package { 'aide':
        ensure => present,
    }

	file { "/etc/aide.conf":
        source => [ "puppet://$server/modules/site-aide/${fqdn}/aide.conf",
                    "puppet://$server/modules/site-aide/${operatingsystem}/aide.conf",
                    "puppet://$server/modules/site-aide/aide.conf",
                    "puppet://$server/modules/aide/${operatingsystem}/aide.conf",
                    "puppet://$server/modules/aide/aide.conf"
                ],
        ensure => file,
        force => true,
        mode => 0644, owner => root, group => 0;
    }
	file { "/etc/cron.daily/aide.cron":
        source => [ "puppet://$server/modules/site-aide/${fqdn}/aide.cron",
                    "puppet://$server/modules/site-aide/${operatingsystem}/aide.cron",
                    "puppet://$server/modules/site-aide/aide.cron",
                    "puppet://$server/modules/aide/${operatingsystem}/aide.cron",
                    "puppet://$server/modules/aide/aide.cron"
                ],
        ensure => file,
        force => true,
        mode => 0755, owner => root, group => 0;
    }
	file { "/var/lib/aide/aide.db":
        source => "puppet://$server/modules/site-aide/${fqdn}/aide.db",
        ensure => file,
        force => true,
        mode => 0400, owner => root, group => 0;
    }
}
