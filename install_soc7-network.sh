OS_VARIANT="sles12sp2"
BASE_NAME="soc7-network"

NOW=$(date '+%Y-%m-%d_%H-%M-%S')
VM_NAME="${BASE_NAME}_${NOW}"
NET_NAME="soc7-admin"
MAC="52:54:00:00:02:01"

OS_TYPE="Linux"
RAM="2048"
VCPUS="2"

DISK_IMG="${VM_NAME}_disk.qcow2"
DISK_SIZE="20G"
EXTRA_ARGS="netdevice=eth0 netsetup=dhcp"

qemu-img create -f qcow2 ${DISK_IMG} ${DISK_SIZE}

virt-install \
    --debug \
    --name ${VM_NAME} \
    --os-type=${OS_TYPE} \
    --os-variant=${OS_VARIANT} \
    --ram=${RAM} \
    --vcpus=${VCPUS} \
    --disk path=${DISK_IMG},device=disk \
    --graphics vnc,listen=0.0.0.0 \
    --network=network=${NET_NAME} \
    --mac=${MAC} \
    --pxe

virsh dumpxml ${VM_NAME} > ${VM_NAME}.xml
xmlstarlet ed --inplace -d "/domain/os/boot" ${VM_NAME}.xml
xmlstarlet ed --inplace --subnode "/domain/os" --type elem -n boot -v "" -i "/domain/os/boot[1]" --type attr -n dev -v network ${VM_NAME}.xml
xmlstarlet ed --inplace --subnode "/domain/os" --type elem -n boot -v "" -i "/domain/os/boot[2]" --type attr -n dev -v hd ${VM_NAME}.xml
virsh define ${VM_NAME}.xml
virsh destroy ${VM_NAME}
virsh start ${VM_NAME}
