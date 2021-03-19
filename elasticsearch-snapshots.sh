#!/bin/bash
echo "change directory"
cd /opt/elasticsearch/bin
pwd

echo "install repository-s3 plugin"
sudo ./elasticsearch-plugin install repository-s3

echo "configure credentials"
echo -n 'AKIA' | ./elasticsearch-keystore add --stdin s3.client.default.access_key
echo -n '2000000000000000000000z' | ./elasticsearch-keystore add --stdin s3.client.default.secret_key

echo "change permissions"
sudo chown booxware:booxware /opt/elasticsearch/config/elasticsearch.keystore


echo "restart service"
sudo systemctl restart elasticsearch
sudo systemctl status elasticsearch


echo "create repository"
curl -XPUT 'http://localhost:9200/_snapshot/s3_repository' -H 'Content-Type: application/json' -d'
{
  "type": "s3",
  "settings": {
    "bucket": "poc-awsinsagnt",
    "region": "us-east-1",
    "client": "default",
    "endpoint": "s3.us-east-1.amazonaws.com"
  }
}'


echo "list repositories"
curl -X GET "http://localhost:9200/_cat/repositories?v"

echo "verify repositories"
curl -X POST "http://localhost:9200/_snapshot/s3_repository/_verify"

echo "create snapshot"
 curl -XPUT "http://localhost:9200/_snapshot/s3_repository/gmsgrouptest?wait_for_completion=true" -H 'Content-Type: application/json' -d'
 {
    "indices": "gms_group",
     "ignore_unavailable": true,
    "include_global_state": false
 }'
