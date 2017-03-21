docker pull consul
docker run --rm -d --name cn1 \
	-p 8400:8400 -p 8500:8500/tcp -p 53:8600/udp \
	-v /volumes/cdata:/consul/data \
	-v /volumes/cconfig:/consul/config \
    consul agent -server -node=n1 -bootstrap -ui -client="0.0.0.0" -bind='{{ GetPrivateIP }}'
