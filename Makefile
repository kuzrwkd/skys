##
# build
#
build-all:
	docker build --no-cache -t skys-api:mysql8.0 client-api/mysql/docker
	docker build --no-cache -t skys-api:nestjs client-api/node/docker
	docker build --no-cache -t skys-scraper:mysql8.0 scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer scraper/node/docker

build-api:
	docker build --no-cache -t skys-api:mysql8.0 client-api/mysql/docker
	docker build --no-cache -t skys-api:nestjs client-api/node/docker

build-scraper:
	docker build --no-cache -t skys-scraper:mysql8.0 scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer scraper/node/docker

##
# clean
#
clean-all:
	docker rmi skys-api:nestjs
	docker rmi skys-api:mysql8.0
	docker rmi skys-scraper:puppeteer
	docker rmi skys-scraper:mysql8.0

clean-api:
	docker rmi skys-api:nestjs
	docker rmi skys-api:mysql8.0

clean-scraper:
	docker rmi skys-scraper:puppeteer
	docker rmi skys-scraper:mysql8.0

##
# apply
#
apply-all:
	kubectl apply -f client-api/mysql/configMap.yml
	kubectl apply -f client-api/mysql/deployment.yml
	kubectl apply -f client-api/mysql/service.yml
	kubectl apply -f client-api/node/deployment.yml
	kubectl apply -f client-api/node/service.yml
	kubectl apply -f scraper/mysql/configMap.yml
	kubectl apply -f scraper/mysql/deployment.yml
	kubectl apply -f scraper/mysql/service.yml
	kubectl apply -f scraper/node/deployment.yml
	kubectl apply -f scraper/node/service.yml

apply-api:
	kubectl apply -f client-api/mysql/configMap.yml
	kubectl apply -f client-api/mysql/deployment.yml
	kubectl apply -f client-api/mysql/service.yml
	kubectl apply -f client-api/node/deployment.yml
	kubectl apply -f client-api/node/service.yml

apply-scraper:
	kubectl apply -f scraper/mysql/configMap.yml
	kubectl apply -f scraper/mysql/deployment.yml
	kubectl apply -f scraper/mysql/service.yml
	kubectl apply -f scraper/node/deployment.yml
	kubectl apply -f scraper/node/service.yml

##
# delete
#
delete-all:
	kubectl delete -f client-api/mysql/configMap.yml
	kubectl delete -f client-api/mysql/deployment.yml
	kubectl delete -f client-api/mysql/service.yml
	kubectl delete -f client-api/node/deployment.yml
	kubectl delete -f client-api/node/service.yml
	kubectl delete -f scraper/mysql/configMap.yml
	kubectl delete -f scraper/mysql/deployment.yml
	kubectl delete -f scraper/mysql/service.yml
	kubectl delete -f scraper/node/deployment.yml
	kubectl delete -f scraper/node/service.yml

delete-api:
	kubectl delete -f client-api/mysql/configMap.yml
	kubectl delete -f client-api/mysql/deployment.yml
	kubectl delete -f client-api/mysql/service.yml
	kubectl delete -f client-api/node/deployment.yml
	kubectl delete -f client-api/node/service.yml

delete-scraper:
	kubectl delete -f scraper/mysql/configMap.yml
	kubectl delete -f scraper/mysql/deployment.yml
	kubectl delete -f scraper/mysql/service.yml
	kubectl delete -f scraper/node/deployment.yml
	kubectl delete -f scraper/node/service.yml

dashboard:
	kubectl apply -f dashboard-adminuser.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.0/aio/deploy/recommended.yaml
	kubectl proxy