# you need to call this if you have network issue
# like NetworkPlugin cni failed to set up pod "hawq-cluster-1-master-0_default" network: failed to set bridge addr: "cni0" already has an IP address different from 10.244.4.1/24
kubeadm reset
systemctl stop kubelet
systemctl stop docker
rm -rf /var/lib/cni/
rm -rf /var/lib/kubelet/*
rm -rf /etc/cni/
ifconfig cni0 down
ifconfig flannel.1 down
ifconfig docker0 down
ip link delete cni0
ip link delete flannel.1
systemctl start docker

#after run this with root, run kubeadm join to add node
