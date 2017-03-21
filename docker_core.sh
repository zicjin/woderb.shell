docker login -u zicjin@live.com -p z565656z registry.cn-hangzhou.aliyuncs.com
docker pull registry.cn-hangzhou.aliyuncs.com/zicjin/woderb.core
docker run --rm --name woderb.core -p 8080:80 -d registry.cn-hangzhou.aliyuncs.com/zicjin/woderb.core
