#!/bin/sh

mkdir -p /run/mysqld

sleep 5
echo "\033[32minitialize MySQL database...\033[0m"
# MYSQL디렉토리 초기화, 시스템테이블 생성. 
mysql_install_db --user=root > /dev/null

# create wordpress table and give permissions
echo "CREATE DATABASE IF NOT EXISTS wordpress;
        FLUSH PRIVILEGES;
        GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;
        FLUSH PRIVILEGES;" > cmd.sql
# --bootstrap : 서버 시작 전 DB테이블 생성
mysqld -u root --bootstrap < cmd.sql

# mysql 서버 시작
mysqld -u root