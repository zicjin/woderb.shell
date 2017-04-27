docker pull mongo

docker run --rm -d --name mongo1 -p 27017:27017 -v /volumes/mdata:/data/db mongo --auth
