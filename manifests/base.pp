class aide::base {
    package { 'aide':
        ensure => present,
    }

    file { "/etc/aide.conf":
        source => [ "puppet:///modules/site-aide/${fqdn}/aide.conf",
                    "puppet:///modules/site-aide/${operatingsystem}/aide.conf",
                    "puppet:///modules/site-aide/aide.conf",
                    "puppet:///modules/aide/${operatingsystem}/aide.conf",
                    "puppet:///modules/aide/aide.conf"
                ],
        ensure => file,
        force => true,
        mode => 0644, owner => root, group => 0;
    }
        file { "/etc/cron.daily/aide.cron":
        source => [ "puppet:///modules/site-aide/${fqdn}/aide.cron",
                    "puppet:///modules/site-aide/${operatingsystem}/aide.cron",
                    "puppet:///modules/site-aide/aide.cron",
                    "puppet:///modules/aide/${operatingsystem}/aide.cron",
                    "puppet:///modules/aide/aide.cron"
                ],
        ensure => file,
        force => true,
        mode => 0755, owner => root, group => 0;
    }
}
