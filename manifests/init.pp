# modules/aide/manifests/init.pp - manage aide
# Copyright (C) 2007 admin@immerda.ch
# 

modules_dir { "aide": }

class aide {

	package { 'aide':
                ensure => present,
                category => $operatingsystem ? {
                        gentoo => 'app-forensics',
                        default => '',
                },
        }


	#service { aide: ensure  => running, enable  => true, }

	file {
        	"/etc/aide/aide.conf":
                	source => "puppet://$servername/aide/aide.conf",
        		ensure => file,
        		force => true,
        		mode => 0644, owner => root, group => root;
        }
	file {
        	"/etc/cron.daily/aide.cron":
                	source => "puppet://$servername/aide/aide.cron",
        		ensure => file,
        		force => true,
        		mode => 0644, owner => root, group => root;
        }
	
}

