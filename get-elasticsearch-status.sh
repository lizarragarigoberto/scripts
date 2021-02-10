#!/bin/bash


#elasticsearch-p-betting
#192.168.2.107, 10.99.40.62

#elasticsearch-p-gms-1
#192.168.0.172, 10.99.40.56

#elasticsearch-p-trading-2
#192.168.2.90, 10.99.42.68

#elasticsearch-p-trading-1
#192.168.0.116, 10.99.40.203

#elk-kibana-p-k8s
#192.168.3.241, 10.99.40.184

#elk-kibana-p-zidane
#192.168.1.199, 10.99.40.209

#elk-p-k8s
#192.168.2.151, 10.99.41.229

#elk-p-zidane
#192.168.1.100, 10.99.42.120

echo "elasticsearch-p-trading-1"
curl -X GET "10.99.40.203:9200/_cluster/health?pretty"
echo "elasticsearch-p-trading-2"
curl -X GET "10.99.42.68:9200/_cluster/health?pretty"
echo "elasticsearch-p-gms-1"
curl -X GET "10.99.40.56:9200/_cluster/health?pretty"
echo "elasticsearch-p-betting"
curl -X GET "10.99.40.62:9200/_cluster/health?pretty"



