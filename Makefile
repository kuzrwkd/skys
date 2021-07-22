##
# build
#
build-all:
	docker build --no-cache -t skys-client:nextjs client/node/docker
	docker build --no-cache -t skys-client-api:mysql8.0 api/mysql/docker
	docker build --no-cache -t skys-client-api:nestjs api/node/docker
	docker build --no-cache -t skys-scraper:mysql8.0 scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

build-client:
	docker build --no-cache -t skys-client:nextjs client/node/docker

build-client-api:
	docker build --no-cache -t skys-client-api:mysql8.0 api/mysql/docker
	docker build --no-cache -t skys-client-api:nestjs api/node/docker

build-scraper:
	docker build --no-cache -t skys-scraper:mysql8.0 scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

##
# clean
#
clean-all:
	docker rmi skys-client:nextjs
	docker rmi skys-client-api:nestjs
	docker rmi skys-client-api:mysql8.0
	docker rmi skys-scraper:puppeteer-with-nestjs
	docker rmi skys-scraper:mysql8.0

clean-client:
	docker rmi skys-client:nextjs

clean-client-api:
	docker rmi skys-client-api:nestjs
	docker rmi skys-client-api:mysql8.0

clean-scraper:
	docker rmi skys-scraper:puppeteer-with-nestjs
	docker rmi skys-scraper:mysql8.0

##
# apply
#
apply-all:
	kubectl apply -f client/node/pod.yml
	kubectl apply -f client/node/service.yml
	kubectl apply -f api/mysql/configMap.yml
	kubectl apply -f api/mysql/deployment.yml
	kubectl apply -f api/mysql/service.yml
	kubectl apply -f api/node/pod.yml
	kubectl apply -f api/node/service.yml
	kubectl apply -f scraper/mysql/configMap.yml
	kubectl apply -f scraper/mysql/deployment.yml
	kubectl apply -f scraper/mysql/service.yml
	kubectl apply -f scraper/node/pod.yml
	kubectl apply -f scraper/node/service.yml

apply-client:
	kubectl apply -f client/node/pod.yml
	kubectl apply -f client/node/service.yml

apply-client-api:
	kubectl apply -f api/mysql/configMap.yml
	kubectl apply -f api/mysql/deployment.yml
	kubectl apply -f api/mysql/service.yml
	kubectl apply -f api/node/pod.yml
	kubectl apply -f api/node/service.yml

apply-scraper:
	kubectl apply -f scraper/mysql/configMap.yml
	kubectl apply -f scraper/mysql/deployment.yml
	kubectl apply -f scraper/mysql/service.yml
	kubectl apply -f scraper/node/pod.yml
	kubectl apply -f scraper/node/service.yml

##
# delete
#
delete-all:
	kubectl delete -f client/node/pod.yml
	kubectl delete -f client/node/service.yml
	kubectl delete -f api/mysql/configMap.yml
	kubectl delete -f api/mysql/deployment.yml
	kubectl delete -f api/mysql/service.yml
	kubectl delete -f api/node/pod.yml
	kubectl delete -f api/node/service.yml
	kubectl delete -f scraper/mysql/configMap.yml
	kubectl delete -f scraper/mysql/deployment.yml
	kubectl delete -f scraper/mysql/service.yml
	kubectl delete -f scraper/node/pod.yml
	kubectl delete -f scraper/node/service.yml

delete-client:
	kubectl delete -f client/node/pod.yml
	kubectl delete -f client/node/service.yml

delete-client-api:
	kubectl delete -f api/mysql/configMap.yml
	kubectl delete -f api/mysql/deployment.yml
	kubectl delete -f api/mysql/service.yml
	kubectl delete -f api/node/pod.yml
	kubectl delete -f api/node/service.yml

delete-scraper:
	kubectl delete -f scraper/mysql/configMap.yml
	kubectl delete -f scraper/mysql/deployment.yml
	kubectl delete -f scraper/mysql/service.yml
	kubectl delete -f scraper/node/pod.yml
	kubectl delete -f scraper/node/service.yml

##
# dashboard
#
dashboard:
	kubectl apply -f dashboard-adminuser.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.0/aio/deploy/recommended.yaml
	kubectl proxy