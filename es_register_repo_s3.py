[ec2-user@ip-10-192-5-102 tmp]$ cat registertrading.py
import boto3
import requests
from requests_aws4auth import AWS4Auth

host = 'https://vpc-es-s-pds-gol-trading-y656xlrricefutlglq2h6onpsu.us-east-1.es.amazonaws.com/'
region = 'us-east-1'
service = 'es'
credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

# Register repository
path = '_snapshot/my_ES_S3_Snapshot'
url = host + path

payload = {
          "type": "s3",
            "settings": {
                    "bucket": "s3-s-us-east-1-openstack-es-migration-675553057094",
                        "region": "us-east-1",
                            "role_arn": "arn:aws:iam::675553057094:role/iamp-s-account-tipico-openstack-es_migration-s3-role_TEST"
                              }
            }

headers = {"Content-Type": "application/json"}

r = requests.put(url, auth=awsauth, json=payload, headers=headers)

print(r.status_code)
print(r.text)
[ec2-user@ip-10-192-5-102 tmp]$ cat register.py
import boto3
import requests
from requests_aws4auth import AWS4Auth

host = 'https://vpc-es-s-gms-gol-trading-otam6qmdn2nto5tjadjzj5n2o4.us-east-1.es.amazonaws.com/'
region = 'us-east-1'
service = 'es'
credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

# Register repository
path = '_snapshot/my_ES_S3_Snapshot'
url = host + path

payload = {
          "type": "s3",
            "settings": {
                    "bucket": "test-repo-es",
                        "region": "us-east-1",
                            "role_arn": "arn:aws:iam::675553057094:role/iamp-s-account-tipico-openstack-es_migration-s3-role_TEST"
                              }
            }

headers = {"Content-Type": "application/json"}

r = requests.put(url, auth=awsauth, json=payload, headers=headers)

print(r.status_code)
print(r.text)
[ec2-user@ip-10-192-5-102 tmp]$ cat registerbetting.py
import boto3
import requests
from requests_aws4auth import AWS4Auth

host = 'https://vpc-es-s-bds-gol-betting-qpkhxje7ul3eatpoffvhqrikfa.us-east-1.es.amazonaws.com/'
region = 'us-east-1'
service = 'es'
credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

# Register repository
path = '_snapshot/my_ES_S3_Snapshot'
url = host + path

payload = {
          "type": "s3",
            "settings": {
                    "bucket": "s3-s-us-east-1-openstack-es-migration-675553057094",
                        "region": "us-east-1",
                            "role_arn": "arn:aws:iam::675553057094:role/iamp-s-account-tipico-openstack-es_migration-s3-role_TEST"
                              }
            }

headers = {"Content-Type": "application/json"}

r = requests.put(url, auth=awsauth, json=payload, headers=headers)

print(r.status_code)
print(r.text)
