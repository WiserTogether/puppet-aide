class aide::check-db {
    exec { '/usr/sbin/aide --check':
        timeout => 0,
    }
}
