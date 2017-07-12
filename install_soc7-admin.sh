INSTALL_IMG="SLE-12-SP2-Server-DVD-x86_64-GM-DVD1.iso"
OS_VARIANT="sles12sp2"
BASE_NAME="soc7-admin"

NOW=$(date '+%Y-%m-%d_%H-%M-%S')
VM_NAME="${BASE_NAME}_${NOW}"
NET_NAME="${BASE_NAME}"

OS_TYPE="Linux"
RAM="4096"
VCPUS="2"

DISK_IMG="${VM_NAME}_disk.qcow2"
DISK_SIZE="50G"
EXTRA_ARGS="netdevice=eth0 netsetup=dhcp autoyast=file:///autoyast_${BASE_NAME}.xml"

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
    --location ${INSTALL_IMG} \
    --network=network=${NET_NAME} \
    --initrd-inject "autoyast_${BASE_NAME}.xml" \
    --initrd-inject "autoyast_registration_email.xml" \
    --initrd-inject "autoyast_registration_code_sles.xml" \
    --initrd-inject "autoyast_registration_code_ses.xml" \
    --initrd-inject "autoyast_registration_code_soc.xml" \
    --extra-args "${EXTRA_ARGS}"
