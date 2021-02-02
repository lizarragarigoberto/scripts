#!/bin/bash

echo "##### DESCARGAR ARCHIVO #####"
#yum install curl unzip jq -y
export CONSUL_VERSION="1.9.2"
export CONSUL_URL="https://releases.hashicorp.com/consul"
curl --silent --remote-name \
  ${CONSUL_URL}/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
curl --silent --remote-name \
  ${CONSUL_URL}/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_SHA256SUMS.sig
unzip consul_${CONSUL_VERSION}_linux_amd64.zip
echo "### move binaries ###"
sudo mv consul /usr/bin/

echo "###### CREATE DIRECTORIES ######"
useradd -m -d /opt/consul consul
mkdir -m 755 /etc/consul.d
mkdir -m 755 /opt/consul/logs

echo "#### CONFIGS ####"
realip=$(hostname -I | awk '{print $1}')
cat << EOF > /etc/consul.d/consul.hcl
datacenter = "dc1"
data_dir = "/opt/consul"
retry_join = "consul.dev.irl.aws.tipicodev.com"
bind_addr = "$realip"
enable_local_script_checks = true
EOF


cat << EOF > /etc/consul.d/redis.json
{
   "service":{
     "name": "redis",
     "port": 6379,
     "check":{
           "args": [
              "redis-cli",
              "-h",
              "$realip",
              "-p",
              "7001",
              "ping"
            ],
     "interval": "15s"
     }
    }
}
EOF

chown -R consul:consul /opt/consul
chown -R consul: /opt/consul.d
chown -R consul:consul /etc/consul.d
sudo chmod 755 /opt/consul/*

cat << EOF > /etc/systemd/system/consul.service
[Unit]
Description="HashiCorp Consul - A service mesh solution"
Documentation=https://www.consul.io/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/consul.d/consul.hcl
[Service]
User=consul
Group=consul
ExecStart=/usr/bin/consul agent -config-dir=/etc/consul.d/
ExecReload=/usr/bin/consul reload
KillMode=process
Restart=always
LimitNOFILE=65536
[Install]
WantedBy=multi-user.target
EOF

echo "#### VALIDATING #####"
consul validate /etc/consul.d/consul.hcl



systemctl daemon-reload
systemctl enable consul
systemctl start consul
systemctl status consul

#ExecStart=/usr/local/bin/consul agent -config-dir=/etc/consul.d/
#ExecReload=/usr/local/bin/consul reload
