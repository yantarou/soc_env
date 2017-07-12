SUSE OpenStack Cloud 7 - KVM Test Environment
=============================================

This repositories contains scripts and configuration to create a KVM-based
SUSE OpenStack Cloud 7 environment.



Administration Server
---------------------

SMT Configuration:

https://www.suse.com/documentation/suse-openstack-cloud-7/book_cloud_deploy/data/app_deploy_smt_config.html

Setting up Repository Mirroring on the SMT Server:

https://www.suse.com/documentation/suse-openstack-cloud-7/book_cloud_deploy/data/app_deploy_smt_repos.html

The script "mirror_smt_repos.sh" can be run on the administration server to setup the necessary repositories.

Copying the Product Media Repositories:

https://www.suse.com/documentation/suse-openstack-cloud-7/book_cloud_deploy/data/sec_depl_adm_conf_repos_product.html

The script "copy_product_isos.sh" can be used to copy the ISO images to the administration server.

The script "mount_product_isos.sh" can be run on the administration server to (temporary) mount the ISO images.

Crowbar Setup:

https://www.suse.com/documentation/suse-openstack-cloud-7/book_cloud_deploy/data/sec_depl_adm_inst_crowbar.html

Starting the SUSE OpenStack Cloud Crowbar installation:

https://www.suse.com/documentation/suse-openstack-cloud-7/book_cloud_deploy/data/sec_depl_adm_start_crowbar.html

Direct root Login:

https://www.suse.com/documentation/suse-openstack-cloud-7/book_cloud_deploy/data/sec_depl_inst_nodes_prep.html

Set the default password for the nodes' root user to "root".

"root_password_hash": "$1$SDDuNjvR$6TiMRV0ECYPfraxF/Oquf0"
