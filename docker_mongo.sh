docker pull mongo
docker run -d --name mongoc -p 27017:27017 -v /volumes/mdata:/data/db mongo --storageEngine wiredTiger
