import sys, json; 

hh = json.load(sys.stdin)['external_ip_address_docker']['value'][0]

hosts = { "hosts": [] }
for h in hh:
    hosts["hosts"].append(h)

print('{')
print('"docker":',json.dumps(hosts),',')
print('    "_meta": {"hostvars": {} }')
print('}')