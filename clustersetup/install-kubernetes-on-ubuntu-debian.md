# Install Kubernetes Using Script

### `Step1: On Master Node Only`
```
## Install Docker

sudo wget https://raw.githubusercontent.com/satishdevops0/InfraOptim_capstone_project1/main/clustersetup/installDocker.sh -P /tmp
sudo chmod 755 /tmp/installDocker.sh
sudo bash /tmp/installDocker.sh
sudo systemctl restart docker

## Install kubeadm,kubelet,kubectl

sudo wget https://raw.githubusercontent.com/satishdevops0/InfraOptim_capstone_project1/main/clustersetup/installK8S-v1-23.sh -P /tmp
sudo chmod 755 /tmp/installK8S-v1-23.sh
sudo bash /tmp/installK8S-v1-23.sh

   71  docker -v
   72  kubeadm version -o short
   73  kubelet --version
   74  kubectl version --short --client

## Initialize kubernetes Master Node
 
   sudo kubeadm init --ignore-preflight-errors=all

   sudo mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config

   ## install networking driver -- Weave/flannel/canal/calico etc... 

   ## below installs calico networking driver 
    
   kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml 

   # Validate:  kubectl get nodes
```

### `Step2: On All Worker Nodes`

```
## Install Docker

sudo wget https://raw.githubusercontent.com/satishdevops0/InfraOptim_capstone_project1/main/clustersetup/installDocker.sh -P /tmp
sudo chmod 755 /tmp/installDocker.sh
sudo bash /tmp/installDocker.sh
sudo systemctl restart docker

## Install kubeadm,kubelet,kubectl

sudo wget https://raw.githubusercontent.com/satishdevops0/InfraOptim_capstone_project1/main/clustersetup/installK8S-v1-23.sh -P /tmp
sudo chmod 755 /tmp/installK8S-v1-23.sh
sudo bash /tmp/installK8S-v1-23.sh

   71  docker -v
   72  kubeadm version -o short
   73  kubelet --version
   74  kubectl version --short --client

## Run Below on Master Node to get join token 

sudo kubeadm token create --print-join-command 

    copy the kubeadm join token from master & run it as sudo on all nodes

    Ex: sudo kubeadm join 10.128.15.231:6443 --token mks3y2.v03tyyru0gy12mbt \
           --discovery-token-ca-cert-hash sha256:3de23d42c7002be0893339fbe558ee75e14399e11f22e3f0b34351077b7c4b56
```

