sudo yum -y update
sudo amazon-linux-extras install epel -y
sudo yum install redis -y

echo 1024 > /proc/sys/net/core/somaxconn
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo "vm.overcommit_memory = 1" > /etc/sysctl.conf
