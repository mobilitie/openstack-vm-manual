##sriov networks


#Create kube-orch network
openstack network create  --project dev2 --provider-network-type vlan   --internal kube-orch
openstack subnet create --network kube-orch  --subnet-range 192.168.21.0/24 --gateway 192.168.21.1 --dhcp --project dev2 kube-orch-sub

openstack router create  --project dev2 kube-rtr 
openstack router set kube-rtr --external-gateway public
openstack router add subnet kube-rtr kube-orch-sub


##orch ingress node ports
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.20 ingress1-ens3
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.21 ingress2-ens3

##orch master node ports
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.15 master1-ens3
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.16 master2-ens3
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.17 master3-ens3

##node orch ports
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.31 node1-ens3
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.32 node2-ens3
openstack port create --network kube-orch --fixed-ip subnet=kube-orch-sub,ip-address=192.168.21.33 node3-ens3


#Calico
openstack port list --device-owner=compute:nova -c ID -f value | xargs -tI@ openstack port set @ --allowed-address ip-address=10.233.0.0/18 --allowed-address ip-address=10.233.64.0/18

