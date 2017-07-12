mkdir -p /srv/tftpboot/suse-12.2/x86_64/install/
#mount -o loop /root/SLE-12-SP2-Server-DVD-x86_64-GM-DVD1.iso /srv/tftpboot/suse-12.2/x86_64/install

mkdir -p /srv/tftpboot/suse-12.2/x86_64/repos/Cloud/
#mount -o loop /root/SUSE-OPENSTACK-CLOUD-7-x86_64-GM-DVD1.iso /srv/tftpboot/suse-12.2/x86_64/repos/Cloud

cp /etc/fstab /etc/fstab.original
echo "/root/SLE-12-SP2-Server-DVD-x86_64-GM-DVD1.iso /srv/tftpboot/suse-12.2/x86_64/install iso9660 loop 0 0" >> /etc/fstab
echo "/root/SUSE-OPENSTACK-CLOUD-7-x86_64-GM-DVD1.iso /srv/tftpboot/suse-12.2/x86_64/repos/Cloud iso9660 loop 0 0" >> /etc/fstab

mount -a
