#!/bin/bash
echo "++++ Kill tunnel +++++"
sudo pkill stunnel
echo "++++ start stunnel ++++"
sudo stunnel /etc/stunnel/ecrg-s-betradar-comp-gol-trading.conf
echo "++++ verify tunnel up +++"
sudo netstat -tulnp | grep -i stunnel
echo "+++ FLUSHDB REMOTE DB0"
redis-cli -h localhost -p 6379 -a 75vojYdXhgSfnVD4CR39xXBfJ9m4nwB8 FLUSHDB
echo "+++ GET INFO LOCAL+++"
redis-cli -h 10.99.25.8 -p 7001 INFO | grep "db1:"
echo "+++ START MIGRATION++++"
./rump -from redis://10.99.25.8:7001/1 -to redis://127.0.0.1:6379/0?password=7b8 -ttl
echo "+++ GET INFO REMOTE +++"
redis-cli -h localhost -p 6379 -a 75B8 INFO | grep "db0:"
