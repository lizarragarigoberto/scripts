#!/bin/bash
echo "###### INSTALL KUBECTL ########"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
echo "###### KUBECTL VERSION #######"
kubectl version --client
echo "###### INSTALL KUBENS AND KUBECTX #####"
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

echo "###########INSTALL GO ##############"
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
go get -u
go mod tidy
echo "########### INSTALL MAKE #########"
sudo apt install make
echo "######## INSTALL K9S ##############"
cd /tmp
git clone https://github.com/derailed/k9s.git
cd k9s
make build && ./execs/k9s
cd /tmp/k9s/execs
sudo cp k9s /bin/

echo "######### K9S INFO ##############"
k9s info
