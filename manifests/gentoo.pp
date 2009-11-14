class aide::gentoo inherits aide::base {
    Package[aide] {
        category => 'app-forensics',
    }

    File["/etc/aide.conf"]{
        path => "/etc/aide/aide.conf",
    }
}
