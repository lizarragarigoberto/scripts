Heap can be increased in this script:
/srv/kafka/bin/kafka-server-start.sh
export KAFKA_HEAP_OPTS="-Xmx30G -Xms30G"

also there was a known bug with kafka 0.10.2.1 with logcleaner, 0.10.2.2 had a patch for fixing this. manual upgrade was done.

-> kill cron-scheduled chef-running
vim /etc/cron.d/chef-autorun
#5 8-20/3 * * *  root /bin/chef-client -L /opt/chef/logs/chef-client.log > /dev/null

download package
/opt/maas]# wget https://archive.apache.org/dist/kafka/0.10.2.2/kafka_2.12-0.10.2.2.tgz && tar xvf kafka_2.12-0.10.2.2.tgz
symlink to kafka 0.10.2.1 could be removed and linked to new version
/opt]# unlink kafka
/opt]# ln -s /opt/maas/kafka_2.12-0.10.2.2 kafkato enable graceful stop of kafka without corrupting indexes

systemctl stop kafka && systemctl start kafka

systemd's default of 90 seconds had to be increased. currently set timeout for stop to 1 hour to enable handling the increased amount of data before force-stop in. 
force-stop was corrupting indexes
/etc/systemd/system/kafka.service
TimeoutSec=3600 was added
indexes could be cleaned by generating a list of corrupted indexes.
grep -iR  "corrupted index" /var/log/kafka/server.log | awk '{print $18}' | tr -d \( | tr -d \) > brokenindexes.txt
systemctl stop kafka

for i in $(cat brokenindexes.txt | sort |uniq); do rm -f $i; done

We also had to increase the vm.max_map_count cause of this error:
Error: OutofMemory.
[2020-08-17 14:21:13,714] ERROR There was an error in one of the threads during logs loading: java.io.IOException: Map failed (kafka.log.LogManager)
systemctl stop kafka
[root@kafka01-prod kafka]# sysctl vm.max_map_count
vm.max_map_count = 65530

[root@kafka01-prod kafka]# sysctl -w vm.max_map_count=262144
vm.max_map_count = 262144
systemctl start kafka
