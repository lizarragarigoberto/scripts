    1  rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
    2  yum clean all
    3  yum install zabbix-server-mysql zabbix-agent
    4  yum install zabbix-server-mysql zabbix-agent -y
    5  yum-config-manager --enable rhel-server-rhscl-7-rpms -y
    6  vi /etc/yum.repos.d/zabbix.repo
    7  yum install zabbix-web-mysql-scl zabbix-apache-conf-scl
    8  yum install httpd php -y
    9  yum install zabbix-web-mysql-scl zabbix-apache-conf-scl
   10  yum list rh-php7\*
   11  yum-config-manager --enable ol7_latest ol7_optional_latest
   12  yum list rh-php7\*
   13  yum-config-manager --enable software_collections
   14  yum list rh-php7\*
   15  yum-config-manager --enable rhel-server-rhscl-7-rpms
   16  yum list rh-php7\*
   17  yum install epel-release -y
   18  yum list rh-php7\*
   19   rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
   20  yum install centos-release-scl
   21  vi /etc/yum.repos.d/zabbix.repo
   22  yum update zabbix-*
   23  yum install rh-php72-php-fpm
   24  yum install zabbix-server-mysql zabbix-agent -y
   25  yum install zabbix-web-mysql-scl zabbix-apache-conf-scl -y
   26  zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
   27  yum install mariadb -y
   28  zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
   29  zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix -h10.99.26.254
   30  zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix -h 10.99.26.254
   31  exit
   32  zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
   33  zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix -h 10.99.26.254
   34  vi /etc/zabbix/zabbix_server.conf
   35  vi /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
   36  systemctl restart zabbix-server zabbix-agent httpd rh-php72-php-fpm
   37  systemctl enable zabbix-server zabbix-agent httpd rh-php72-php-fpm
   38  ip a
   39  ps ax
   40  шз ф
   41  ip a
   42  netstat -plnat
   43  tail -f /var/log/httpd/access_log
   44  tail -f /var/log/httpd/error_log
   45  getenforce
   46  sudo setenforce 0
   47  vi /etc/selinux/config
   48  iptables -L -nv
   49  sestatus
   50  reboot
   51  getenforce
   52  ps ax
   53  ip a
   54  exit
   55  yum install telnet -y
   56  telnet 10.99.24.93 7001
   57  systemctl list-unit-files
   58  systemctl list-unit-files | grep enabled
   59  iptables
   60  iptables -L -nv
   61  getenforce
   62  ls -la
   63  df -h
   64  ps ax
   65  telnet localhost 80
   66  netstat -plnat
   67  tail -f /var/log/httpd/access_log
   68  ip a
   69  tail -f /var/log/httpd/access_log
   70  ps axc
   71  tail -f /var/log/zabbix/zabbix_server.log
   72  vi /etc/zabbix/zabbix_server.conf
   73  systemctl restart zabbix
   74  systemctl restart zabbix-server
   75  tail -f /var/log/zabbix/zabbix_server.log
   76  setsebool -P httpd_can_network_connect on
   77  service httpd restart
   78  tail -f /var/log/zabbix/zabbix_server.log
   79  vi /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
   80  systemctl restart httpdx
   81  systemctl restart httpd
   82  systemctl restart zabbix-server
   83  vi /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
   84  systemctl restart zabbix-server zabbix-agent httpd rh-php72-php-fpm
   85  ps -ef| grep zabbix
   86  tail -f /var/log/messages
   87  tail -f /var/log/zabbix/zabbix_server.log
   88  telnet 10.99.43.186 10050
   89  tail -f /var/log/zabbix/zabbix_server.log
   90  systemctl restart zabbix-server
   91  tail -f /var/log/zabbix/zabbix_server.log
   92  telnet 10.99.40.62 10050
   93  telnet 10.99.42.229 10050
   94  tail -f /var/log/zabbix/zabbix_server.log
   95  telnet 10.99.43.97 10050
   96  tail -f /var/log/zabbix/zabbix_server.log
   97  ip a
   98  tail -f /var/log/zabbix/zabbix_server.log
   99  ping logstash-p-k8s-1-0.prod.ac.os.tipicodev.com
  100  tail -f /var/log/zabbix/zabbix_server.log
  101  cat /etc/resolv.conf
  102  zabbix_get -s 127.0.0.1 -k system.hostname
  103  ping logstash-p-k8s-1-0.acdc.tipicodev.local
  104  ping logstash-p-k8s-1-0.prod.ac.os.tipicodev.com
  105  systemctl restart zabbix-server
  106  tail -f /var/log/zabbix/zabbix_server.log
  107  getenforce
  108  tail -f /var/log/zabbix/zabbix_server.log
  109  cat /etc/zabbix/zabbix_server.conf
  110  cat /etc/zabbix/zabbix_server.conf | grep -v #
  111  cat /etc/zabbix/zabbix_server.conf | grep -v '#'
  112  cat /etc/zabbix/zabbix_server.conf | grep -v '#' | tr -d "[:blank:]"
  113  cat /etc/zabbix/zabbix_server.conf | grep -v '#' | tr -d "[:space:]"
  114  man tr
  115  cat /etc/zabbix/zabbix_server.conf | grep -v '#' | tr -d "[:blank:]"
  116  cat /etc/zabbix/zabbix_server.conf | grep -v '#' | tr -d "[:cntrl:]"
  117  man tr
  118  cat /etc/zabbix/zabbix_agentd.conf
  119  zabbix_get
  120  yum install zabbix-get -y
  121  ipa
  122  ip a
  123  zabbix_get -s 10.99.27.19 -k logstash-p-k8s-1-0.prod.ac.os.tipicodev.com
  124  grep "Server" /etc/zabbix/zabbix_server.conf
  125  vi /etc/zabbix/zabbix_server.conf
  126  tail -f /var/log/zabbix/zabbix_server.log
  127  df -h
  128  free -n
  129  free -m
  130  tail -f /var/log/zabbix/zabbix_server.log
  131  vi /etc/zabbix/zabbix_server.conf
  132  systemctl restart zabbix-server
  133  ps ax
  134  free -m
  135  tail -f /var/log/zabbix/zabbix_server.log
  136  vi /etc/zabbix/zabbix_server.conf
  137  systemctl restart zabbix-server
  138  free -m
  139  exit
  140  tail -f /var/log/zabbix/zabbix_agentd.log
  141  exit
  142  who
  143  top
  144  cd /opt/
  145  ls
  146  top
  147  cat /etc/passwd
  148  cd /etc/systemd/system/
  149  l
  150  ll
  151  cd multi-user.target.wants/
  152  ll
  153  top
  154  free -h
  155  cd /etc/zabbix/
  156  ls
  157  vi zabbix_server.conf
  158  vi zabbix_agentd.conf
  159  vi zabbix_server.conf
  160  systemctl restart zabbix-sdrver
  161  systemctl restart zabbix-server
  162  systemctl status zabbix-server
  163  date
  164  top
  165  free -m
  166  tail -f /var/log/zabbix/zabbix_server.log
  167  exit
  168  grep siarhei /home/centos/.ssh/authorized_keys
  169  cd /etc/zabbix/
  170  ll
  171  less zabbix_server.conf
  172  ps -ef | grep zabbix
  173  top
  174  ps aux | grep php-fpm
  175  ps aux |head
  176  ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5
  177  cd /etc
  178  ll
  179  ps -ef | grep nginx
  180  apachectl status
  181  apachectl -k graceful
  182  ps -ef | grep httpd
  183  free -m
  184  systemctl reload php-fpm
  185  ps -ef | grep apache
  186  cat /etc/*release*
  187  which php-fpm
  188  history
  189  systemctl status rh-php72-php-fpm
  190  systemctl restart rh-php72-php-fpm
  191  df -h
  192  free -m
  193  cd /var/log/
  194  ll
  195  less rh-php72-php-fpm.service
  196  less /usr/lib/systemd/system/rh-php72-php-fpm.service
  197  free -m
  198  ps -ef | grep zabbix
  199  cd /etc/zabbix/
  200  vim zabbix_server.conf
  201  vi zabbix_server.conf
  202  free -m
  203  systemctl restart zabbix-server
  204  ps -ef | grep zabbix
  205  systemctl stop zabbix-server
  206  ps -ef | grep zabbix
  207  systemctl stop zabbix-server
  208  systemctl start zabbix-server
  209  ps -ef | grep zabbix
  210  free -m
  211  tail -f /var/log/zabbix/zabbix_server.log
  212  tail -f /var/log/zabbix/zabbix_server.log | grep slow
  213  free -m
  214  vi zabbix_server.conf
  215  free -m
  216  free -h
  217  cat /etc/zabbix/zabbix_server.conf
  218  history
  
  
  grep -Ev '(#.*$)|(^$)' /etc/zabbix/zabbix_server.conf
