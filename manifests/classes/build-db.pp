class aide::build-db {
    exec { '/usr/sbin/aide --init':
        alias => 'init db',
        timeout => 0,
    }

    exec { '/bin/cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz':
        require => Exec['init db'],
    }

    #Once the DB is in place, we can schedule checks
    cron { aide:
        command => '/usr/sbin/aide --check',
        user => root,
        hour => 4,
    }
}
