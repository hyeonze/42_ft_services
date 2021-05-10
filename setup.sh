minikube start --driver=virtualbox
# 로컬에 있는 도커 이미지를 사용가능하게
eval $(minikube docker-env)

#metallb
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml

# nginx
cd ./srcs/nginx
echo "\033[32mnginx image build\033[0m"
docker build -t nginx:latest .	> /dev/null
echo "\033[36mnginx deployment\033[0m"
kubectl apply -f ./nginx.yaml

# mysql
cd ../mysql
echo "\033[32mmysql image build\033[0m"
docker build -t mysql:latest .	> /dev/null
echo "\033[36mmysql deployment\033[0m"
kubectl apply -f mysql.yaml

# phpmyadmin
cd ../phpmyadmin
echo "\033[32mphpmyadmin image build\033[0m"
docker build -t phpmyadmin:latest .	> /dev/null
echo "\033[36mphpmyadmin deployment\033[0m"
kubectl apply -f phpmyadmin.yaml

# wordpress
cd ../wordpress
echo "\033[32mwordpress image build\033[0m"
docker build -t wordpress:latest . > /dev/null
echo "\033[36mwordpress deployment\033[0m"
kubectl apply -f wordpress.yaml

# ftps
cd ../ftps
echo "\033[32mftps image build\033[0m"
docker build -t ftps:latest .	> /dev/null
echo "\033[36mftps deployment\033[0m"
kubectl apply -f ftps.yaml