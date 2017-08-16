#!/bin/bash

gpgkey=https://builds.midonet.org/midorepo.key
repos=(
    https://builds.midonet.org/openstack-newton/stable/sles12/
    https://builds.midonet.org/midonet-5.4/stable/sles12/
    http://download.opensuse.org/repositories/home:nicolasbock:midokura/SLE_12_SP2
)

wget ${gpgkey}
rpmkeys --import midorepo.key

for i in ${!repos[@]}; do
    zypper addrepo --refresh ${repos[${i}]} midonet-${i}
done
zypper --gpg-auto-import-keys refresh
