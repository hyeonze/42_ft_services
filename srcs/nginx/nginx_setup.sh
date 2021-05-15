#!/bin/sh

# ssl 인증키 생성(ft_server), -p : 없으면 만들기
mkdir -p /etc/nginx/ssl
openssl req -new -x509 -nodes -newkey rsa:4096 -keyout localhost-nginx.key -out localhost-nginx.crt -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=localhost"
mv localhost-nginx.key /etc/nginx/ssl
mv localhost-nginx.crt /etc/nginx/ssl

# nginx 디렉토리 만들고(nginx 구동 시 필요) html파일 생성
mkdir -p /run/nginx
echo "<h1>hello world!.HTML</h1>" >> /var/www/index.html

# nginx global, foreground에서 실행(1파드 1컨테이너일 때 사용)
/usr/sbin/nginx -g "daemon off;"