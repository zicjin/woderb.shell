docker pull consul
docker run -d --rm --name consul1 \
	-p 8400:8400 -p 8500:8500/tcp -p 53:8600/udp \
	-v /volumes/cdata:/consul/data \
	-v /volumes/cconfig:/consul/config \
	-e 'CONSUL_LOCAL_CONFIG={"acl_datacenter": "DC1", "acl_master_token": "z5656z", "acl_default_policy": "deny"}' \
    consul agent -server -node=n1 -bootstrap -ui -client="0.0.0.0" -bind='{{ GetPrivateIP }}'

# curl -H "X-Consul-Token: secret" -X PUT -d '{"Name": "DC1", "Type": "management"}' http://127.0.0.1:8500/v1/acl/create?token=z5656z
