for ISO in SLE-12-SP2-Server-DVD-x86_64-GM-DVD1.iso SUSE-OPENSTACK-CLOUD-7-x86_64-GM-DVD1.iso; do
    sshpass -p "root" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ISO root@192.168.124.10:~/
done
