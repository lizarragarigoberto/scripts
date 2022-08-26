#!/bin/bash
#accounts=("main" "prod")

function push_new_zone(){
    echo "curl to cluster"
}
function get_cluster_info(){
    echo "backup current config"
    cluster_info=$(databricks clusters get --cluster-id $1 --profile $2)
    cluster_name=$(echo $cluster_info | jq -r '.cluster_name')
    echo $cluster_name
    [[ $(echo $cluster_info | grep "does not exist" | wc -l) -eq 1 ]] && echo "Cluster no longer exist" || echo "$cluster_info" >> $cluster_name.json
    #echo $cluster_info
    push_new_zone 
}
function delete_instance_pool(){
    echo "delete instance pool"
}
function get_instance_pool_info(){
    echo "backup current config"
    ip_info=$(databricks instance-pools get --instance-pool-id $1 --profile $2) 
    ip_name=$(echo $ip_info | jq -r '.instance_pool_name')
    echo $ip_name
    [[ $(echo $ip_info | grep "not a valid instance pool" | wc -l) -eq 1 ]] && echo "instance pool no longer exist" || echo "$ip_info" >> $ip_name.json
    delete_instance_pool

}
function get_clustername(){
                clustername=$(databricks clusters get --cluster-id $1 --profile $2 | jq  '.cluster_name')
                zone_id=$(databricks clusters get  --cluster-id $1 --profile $2 | jq '.aws_attributes.zone_id')
                echo "$clustername | $zone_id"
                #echo $clustername
                #echo $(databricks clusters get --cluster-id $1 --profile $2)
}
function get_jobname(){
      job_name=$(databricks jobs get --job-id $1 --profile $2 | jq -r '.settings.name')
      echo "$job_name"
}
function get_ipn(){
      ipn=$(databricks instance-pools get --instance-pool-id $1 --profile $2 | jq -r '.instance_pool_name')
      echo "$ipn"
}

function get_instance_pool_zone(){
    zone=$(databricks instance-pools get --instance-pool-id $1 --profile $2 | jq -r '.aws_attributes.zone_id')
    instance_type=$(databricks instance-pools get --instance-pool-id $1 --profile $2 | jq -r '.node_type_id')
    #databricks instance-pools get --instance-pool-id $1 --profile $2 | jq -r '.aws_attributes'
    #echo "$zone | $instance_type"
    echo "$zone"
}

function get_instance_pool(){
    pool_id=$(databricks jobs get --job-id $1 --profile $2 | jq -r '.settings.job_clusters[].new_cluster.instance_pool_id')
    echo "$pool_id"
}

function get_inventory(){
accounts=($1)
for account in $accounts
do
jobs1=$(databricks jobs list --output json --profile $account | jq '.[] |.[].job_id') 
for job in $jobs1 #get job id
do 

###  "availability": "SPOT_WITH_FALLBACK"
region=$(databricks jobs get --job-id $job --profile $account | jq '.settings.tasks[].new_cluster.aws_attributes.zone_id' | tr -d '\n')
if [ $(echo $region | grep "null" | wc -l) -eq 1 ];
then
#validar si ese job tiene un cluster o un pool de clusters
#echo "no tiene zonda definida"
     cluster_profile=$(databricks jobs get --job-id $job --profile $account | jq '.settings.job_clusters')
     #cluster_profile=$(databricks jobs get --job-id $job --profile $account | jq '.settings.job_clusters[].new_cluster.spark_conf."spark.databricks.cluster.profile"')

     #echo "---->$cluster_profile"
     if [ $(echo $cluster_profile | grep "null" | wc -l) -eq 1 ];
     then
     
     
     #pool_id_sn=$(databricks jobs get --job-id $job --profile $account | jq -r '.settings.tasks[].new_cluster.instance_pool_id')
     #echo "$job |  -> SINGLE NODE | $(get_instance_pool_zone $pool_id_sn $account)" 
            #---- NEW_CLUSTER?
            new_cluster=$(databricks jobs get --job-id $job --profile $account | jq -r '.settings.tasks[].new_cluster')
            if [ $(echo $new_cluster | grep "null" | wc -l) -eq 1 ];
            then 
                #$cluster_id=$(databricks jobs get --job-id $job --profile main | jq '.settings.tasks[].existing_cluster_id')
                #echo "$job |  -> ALGO | EXISTING_CLUSTER -> $(databricks jobs get --job-id $job --profile $account | jq '.settings.tasks[].existing_cluster_id')"
                ex_clusterid=$(databricks jobs get --job-id $job --profile $account | jq -r '.settings.tasks[].existing_cluster_id')
                #echo "$job | $(get_jobname $job $account)| Existing-cluster |$(get_clustername $ex_clusterid $account)"
                #echo "$ex_clusterid"
                #echo $(databricks clusters get --cluster-id $ex_clusterid --profile $account | jq  '.cluster_name')
                #--->clustername=$(databricks clusters get --cluster-id $ex_clusterid --profile $account | jq  '.cluster_name')
                
                
                #echo "$job | $(get_jobname $job $account)| Existing-cluster |$(get_clustername $ex_clusterid $account)"
                echo $ex_clusterid
                #name cluster
                #databricks clusters get --profile main --cluster-id 0722-195400-code948 | jq '.cluster_name'
                #databricks clusters get --profile main --cluster-id 0722-195400-code948 | jq '.aws_attributes.zone_id'
                [[ $(databricks clusters get --cluster-id $ex_clusterid --profile $account | grep "does not exist" | wc -l) -eq 1 ]] && echo "$job | $(get_jobname $job $account)| Existing-cluster | Cluster no longer exist" || echo "$job | $(get_jobname $job $account)| Existing-cluster |$(get_clustername $ex_clusterid $account)"
            else
                pool_id_xx=$(databricks jobs get --job-id $job --profile $account | jq -r '.settings.tasks[].new_cluster.instance_pool_id')
                #echo "$job |$(get_jobname $job $account)|GENERIC | POOL_ID -> $pool_id_xx   "
                echo "$job |$(get_jobname $job $account)| Instance-Pool |$(get_ipn $pool_id_xx $account) | $(get_instance_pool_zone $pool_id_xx $account)"
            fi    
     
     else
     instance_pool=$(get_instance_pool $job $account)
     #SERVERLESS=HIGHCONCURRENCY
     echo "$job |$(get_jobname $job $account)| Serverless | $(get_ipn $instance_pool $account) |$(get_instance_pool_zone $instance_pool $account)" 

     fi
else
echo "$job |$(get_jobname $job $account)| "SPOT_WITH_FALLBACK" | $region" 
fi

done
done
}




while [ ! -z "$1" ]; do
  case "$1" in
     --update-cluster)
         shift
         uc+=( "$1" )
         uc+=( "$2" )
         get_cluster_info $1 $2
         ;;
     --get-inventory)
         shift
         i=( "$1" )
         get_inventory $1
         ;;
     --update-instance-pool)
         shift
         i=( "$1" )
         i=( "$2" )
         get_instance_pool_info $1 $2
         ;;
  esac
shift
done

#echo "The first value of the array is '$uc'"
#echo "The whole list of values is '${uc[@]}'|${uc[1]}"
