











master.ecrg-s-betradar-comp-gol-trading.cnykdf.use1.cache.amazonaws.com:6379
master.ecrg-s-betradar-gol-trading.cnykdf.use1.cache.amazonaws.com:6379
master.ecrg-s-betradar-live-gol-trading.cnykdf.use1.cache.amazonaws.com:6379
master.ecrg-s-zidane-sync-gol-trading.cnykdf.use1.cache.amazonaws.com:6379
master.rg-s-bet-outcome-service-gol-betting.cnykdf.use1.cache.amazonaws.com:6379



ecrg-s-betradar-comp-gol-trading   AUTH-yes
sudo stunnel /etc/stunnel/ecrg-s-betradar-comp-gol-trading.conf
sudo netstat -tulnp | grep -i stunnel
redis-cli -h localhost -p 6379 -a 75vojYdXhgSfnVD4CR39xXBfJ9m4nwB8
sudo pkill stunnel
sudo netstat -tulnp | grep -i stunnel

ecrg-s-betradar-gol-trading        AUTH-yes
sudo stunnel /etc/stunnel/ecrg-s-betradar-gol-trading.conf
sudo netstat -tulnp | grep -i stunnel
redis-cli -h localhost -p 6379 -a 48gvZwtddxW9oEWWD2eisQqrqCFTyomv
sudo pkill stunnel
sudo netstat -tulnp | grep -i stunnel

ecrg-s-betradar-live-gol-trading   AUTH-yes
sudo stunnel /etc/stunnel/ecrg-s-betradar-live-gol-trading.conf
sudo netstat -tulnp | grep -i stunnel
redis-cli -h localhost -p 6379 -a gp6XBfz12WdyjvZO6yfKMvNY8jSlkQrB
sudo pkill stunnel
sudo netstat -tulnp | grep -i stunnel


ecrg-s-zidane-sync-gol-trading     AUTH-yes
sudo stunnel /etc/stunnel/ecrg-s-zidane-sync-gol-trading.conf
sudo netstat -tulnp | grep -i stunnel
redis-cli -h localhost -p 6379 -a D5DDuC5skc2UbIZpPNCKPVycup9GPxbB
sudo pkill stunnel
sudo netstat -tulnp | grep -i stunnel


rg-s-bet-outcome-service-gol-betting  AUTH-no   Encryption in-transit:Yes  redis-cli-conf
sudo apt install stunnel
sudo apt install redis-tools
sudo stunnel /etc/stunnel/rg-s-bet-outcome-service-gol-betting.conf
sudo netstat -tulnp | grep -i stunnel
sudo pkill stunnel





--------------------------------------------


zidane-1 -> 10.99.27.131
from zidane-1/db:1   to-> 
ecrg-s-zidane-sync-gol-trading/db:1
primary endpoint: master.ecrg-s-zidane-sync-gol-trading.cnykdf.use1.cache.amazonaws.com:6379

ecrg-s-zidane-sync-gol-trading     AUTH-yes
sudo stunnel /etc/stunnel/ecrg-s-zidane-sync-gol-trading.conf
sudo netstat -tulnp | grep -i stunnel
redis-cli -h localhost -p 6379 -a D5DDuC5skc2UbIZpPNCKPVycup9GPxbB
redis-cli -h localhost -p 6379 -a D5DDuC5skc2UbIZpPNCKPVycup9GPxbB -n 5
sudo pkill stunnel
sudo netstat -tulnp | grep -i stunnel


sudo stunnel /etc/stunnel/ecrg-s-zidane-sync-gol-trading.conf
./rump -from redis://10.99.25.8:7001/0 -to redis://master.ecrg-s-betradar-comp-gol-trading.cnykdf.use1.cache.amazonaws.com:6379/0 -ttl
./rump -from redis://10.99.27.131:7001/0 -to redis://127.0.0.1:6379/5 -ttl
./rump -from dump-translation-i.rdb -to redis://D5DDuC5skc2UbIZpPNCKPVycup9GPxbB@localhost:6379/5

./rump -from dump-translation-i.rdb -to redis://localhost:6379/5?password=D5DDuC5skc2UbIZpPNCKPVycup9GPxbB

redis-cli -h 10.99.27.131 -p 7001 BGSAVE
sudo ls -l /opt/redis-5.0.6/lib/
aws s3 cp /opt/redis-5.0.6/lib/dump.rdb s3://poc-awsinsagnt/zidane-1/

