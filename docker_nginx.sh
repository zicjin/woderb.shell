docker run --name nginx1 -p 80:80 \
  -v /root/woderb.web/dist:/usr/share/nginx/www:ro \
  -v /root/woderb.weather:/usr/share/nginx/weather:ro \
  -v /root/woderb.web/nginx.conf:/etc/nginx/nginx.conf:ro \
  -d nginx
