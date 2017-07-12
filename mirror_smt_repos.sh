for REPO in SLES12-SP2-{Pool,Updates}; do
    smt-repos $REPO sle-12-x86_64 -e
done

for REPO in SLE-HA12-SP2-{Pool,Updates}; do
    smt-repos $REPO sle-12-x86_64 -e
done

for REPO in SUSE-OpenStack-Cloud-7-{Pool,Updates}; do
    smt-repos $REPO sle-12-x86_64 -e
done

for REPO in SUSE-Enterprise-Storage-4-{Pool,Updates}; do
    smt-repos $REPO sle-12-x86_64 -e
done

smt-mirror -L /var/log/smt/smt-mirror.log
