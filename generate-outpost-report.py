import boto3


#outpost subnets
#https://console.aws.amazon.com/vpc/home?region=us-east-1#subnets:OutpostId=op-084697626755eadc2
outpost_subnet_id = ["subnet-03f",
"subnet-0f8",
"subnet-032",
"subnet-081",
"subnet-0fc",
"subnet-032",
"subnet-0c",
"subnet-02",
"subnet-02",
"subnet-04"]


ec2 = boto3.resource('ec2')
#create file
#f= open("inventory.txt","w+")
#f.write("[OUTPOST INVENTORY]")
#f.write("HOSTNAME | PURPOSE | VIRTUALIZED | HYPERVISOR HOSTNAME | HYPERVISOR IP | HYPERVISOR MAKE & VERSION | US MULTIHOMED ")
#f.write("\n")
# create filter for instances in running state
filters = [
     {
        'Name': 'instance-state-name',
        'Values': ['running']
     },
     {
        'Name': 'tag:Environment',
        'Values': ['p']
     }
]

# filter the instances based on filters() above
instances = ec2.instances.filter(Filters=filters)
# instantiate empty array
RunningInstances = []
#print(type(instances))
for instance in instances:
    # for each instance, append to array and print instance id
    for tag in instance.tags:
        if tag['Key'] == 'Name':
            instanceName=tag['Value']
            #verify instance is using a OUTPOST SUBNET
            if (instance.subnet_id in outpost_subnet_id) is True:
                #print instanceName,"|",instance.subnet_id in outpost_subnet_id
                #print instanceName,"(",instance.id,")","|",instance.private_ip_address,"|",instance.platform,"|",instance.hypervisor,"|","YES","|","AWS", instance.instance_type
                #print instanceName,"(",instance.id,")","|",instance.private_ip_address,"|","Amazon Linux","|",instance.hypervisor,"|","YES","|","AWS", instance.instance_type
                #print("%s(%s)| %s | Amazon Linux | purpose | yes | n/a | n/a | AWS |Yes|%s|"%(instanceName,instance.id,instance.private_ip_address,instance.hypervisor,instance.instance_type))
                
                print("%s(%s)| Server %s | Amazon Linux | %s | ansible_user=ec2-user ansible_ssh_private_key_file=aws.pem"%(instanceName,instance.id,instance.instance_type,instance.private_ip_address))
                
                #print("%s(%s)| %s |%s|%s|"%(instanceName,instance.id,instance.private_ip_address,instance.hypervisor,instance.instance_type))
    #data=instance.public_ip_address + " ansible_user=ec2-user ansible_ssh_private_key_file="+instance.key_name+".pem"
    #f.write(data)
    #f.write("\n")
