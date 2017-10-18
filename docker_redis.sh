docker pull redis

docker run --rm --name redis1 -p 16379:6379 \
    -v /volumes/rdata:/data \
    -v redis.conf:/etc/redis/redis.conf \
    redis redis-server /etc/redis/redis.conf --appendonly yes
