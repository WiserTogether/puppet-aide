# modules/aide/manifests/init.pp - manage aide
# Copyright (C) 2007 admin@immerda.ch
# 

class aide {
    case $operatingsystem {
        gentoo: { include aide::gentoo }
        default: { include aide::base }
    }
}
