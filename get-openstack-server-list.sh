#!/bin/bash
username=$1
env=$2

      case $env in
        "--i" )
          echo "###INTEGRATION###"
openstack server list --os-auth-url https://portal.cdc1.tel.os.tipicodev.com:5000 \
--os-project-name "goldrush-integration" \
--os-project-id fcc1ff8691e049d0a49150dae4231575  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
          ;;
        "--r" )
          echo "###REGULATOR###"
 openstack server list --os-auth-url https://portal.ac.os.tipicodev.com:5000 \
--os-project-name "goldrush-regulator" \
--os-project-id db32c1ddcd114555bc54d193472cd59c  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
          ;;
        "--p" )
          echo "###PRODUCTION###"
openstack server list --os-auth-url https://portal.ac.os.tipicodev.com:5000 \
--os-project-name "goldrush-production" \
--os-project-id 76dfaa6b5ae14dfba3fd3ef86ded44d1  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
          ;;
        "--s" )
          echo "###STAGING###"
openstack server list --os-auth-url https://portal.ac.os.tipicodev.com:5000 \
--os-project-name "goldrush-staging" \
--os-project-id 3eb2c2a6e1ae4e83a0cd7e30cca7b3a0  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
          ;;
        * )
          echo "###ALL###"
openstack server list --os-auth-url https://portal.cdc1.tel.os.tipicodev.com:5000 \
--os-project-name "goldrush-integration" \
--os-project-id fcc1ff8691e049d0a49150dae4231575  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
openstack server list --os-auth-url https://portal.ac.os.tipicodev.com:5000 \
--os-project-name "goldrush-staging" \
--os-project-id 3eb2c2a6e1ae4e83a0cd7e30cca7b3a0  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
openstack server list --os-auth-url https://portal.ac.os.tipicodev.com:5000 \
--os-project-name "goldrush-regulator" \
--os-project-id db32c1ddcd114555bc54d193472cd59c  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
openstack server list --os-auth-url https://portal.ac.os.tipicodev.com:5000 \
--os-project-name "goldrush-production" \
--os-project-id 76dfaa6b5ae14dfba3fd3ef86ded44d1  \
--os-username $username \
--os-user-domain-name "tipico" \
--os-password $KEYOS
          ;;
       esac
