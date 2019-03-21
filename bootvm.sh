#!/bin/bash

#openstack keypair create --public-key ~/.ssh/devosp.pub  devosp-pub

#openstack server create --image ubuntu1804 --flavor kube-mn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value build-ens3) \
--config-drive True --user-data ~/dev3/kube-build.yaml --wait kube-build


openstack server create --image ubuntu1804 --flavor kube-mn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value master1-ens3) \
--config-drive True  --user-data ~/dev3/master1.yaml --wait master1

openstack server create --image ubuntu1804 --flavor kube-mn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value master2-ens3) \
--config-drive True --user-data ~/dev3/master2.yaml --wait master2

openstack server create --image ubuntu1804 --flavor kube-mn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value master3-ens3) \
--config-drive True --user-data ~/dev3/master3.yaml --wait master3

openstack server create --image ubuntu1804 --flavor kube-cn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value ingress1-ens3) \
--config-drive True --user-data ~/dev3/ingress1.yaml --wait ingress1

openstack server create --image ubuntu1804 --flavor kube-cn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value ingress2-ens3) \
--config-drive True --user-data ~/dev3/ingress2.yaml --wait ingress2

openstack server create --image ubuntu1804 --flavor kube-cn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value node1-ens3) \
--config-drive True --user-data ~/dev3/node1.yaml --wait node1

openstack server create --image ubuntu1804 --flavor kube-cn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value node2-ens3) \
--config-drive True --user-data ~/dev3/node2.yaml --wait node2

openstack server create --image ubuntu1804 --flavor kube-cn --security-group default --key-name devosp-pub --availability-zone nova \
--nic port-id=$(openstack port show -c id -f value node3-ens3) \
--config-drive True --user-data ~/dev3/node3.yaml --wait node3
