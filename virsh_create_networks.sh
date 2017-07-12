virsh net-destroy soc7-admin
virsh net-undefine soc7-admin
virsh net-define virsh_net-soc7-admin.xml
virsh net-autostart soc7-admin
virsh net-start soc7-admin
#virsh net-dumpxml soc7-admin

virsh net-destroy soc7-public-floating
virsh net-undefine soc7-public-floating
virsh net-define virsh_net-soc7-public-floating.xml
virsh net-autostart soc7-public-floating
virsh net-start soc7-public-floating
#virsh net-dumpxml soc7-public-floating

virsh net-list --all
