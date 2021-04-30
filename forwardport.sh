  605  clear
  606  iptables
  607  iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 9200
  608  sudo iptables -t nat -v -L PREROUTING -n --line-number
  609  iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 9200
  610  sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 9200
  611   curl http://localhost/_cat/master
  612  exit
  613  clear
  614   curl http://localhost/_cat/master
  615   curl http://localhost/
  616  iptables  -L
  617  sudo iptables  -L
  618  sudo iptables -L -t PREROUTING
  619  sudo iptables -L -t POSTROUTING
  620  sudo iptables -L -t NAT
  621  sudo iptables -L -t nat
  622  sysctl net.ipv4.conf.eth0.forwarding
  623  sudo sysctl net.ipv4.conf.eth0.forwarding=1
  624  sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 9200
  625   curl http://localhost/_cat/master
  626  sudo iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
  627   curl http://localhost/_cat/master
  628  sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 9200
  629   curl http://localhost/_cat/master
