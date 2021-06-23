import re
import requests
from datetime import datetime, timedelta
from time import gmtime, strftime
import socket

log_file_path = r"testlog.log"
regex = '(Invalid password)+'
#regex = '(Starting evaluation of policy)+'
counter=0
match_list = []
webhook="https://hooks.slack.com/services/aaaa/aaaaa/aaaaaaaaaaaaa"

hostname = socket.gethostname()
local_ip = socket.gethostbyname(hostname)
print (hostname)
print (local_ip)



with open(log_file_path, "r") as file:

    for line in file:
        for match in re.finditer(regex, line, re.S):
            match_text = match.group()
            match_list.append(match_text)
            time=line.split()
            time2=str(time[0] +" "+ time[1])
            time2=datetime.strptime(time2, '%Y/%m/%d %H:%M:%S')
            now_str=datetime.now().strftime("%Y/%m/%d %H:%M:%S")
            print (now_str)
            now_dt=datetime.strptime(now_str,"%Y/%m/%d %H:%M:%S")
            ten_min_ago_str=(datetime.now() - timedelta(minutes=10)).strftime("%Y/%m/%d %H:%M:%S")
            ten_min_ago_dt=datetime.strptime(ten_min_ago_str,"%Y/%m/%d %H:%M:%S")
            if time2 >= ten_min_ago_dt and  time2 <= now_dt: 
                counter += 1
    print ("Wazuh Errors ",counter," in last 10 min")
    message = ("Wazuh Errors "+ str(counter) + " in last 10 min" + "|"+ str(hostname) +"|"+ str(local_ip))
    data = '{"text": "%s"}' % message 
    r = requests.post(url = webhook, data = data)
    print(r)




#curl -X POST -H 'Content-type: application/json' --data '{"text":"hello, world!"}' https://hooks.slack.com/services/aaaa/aaaa/aaaaaaaa
