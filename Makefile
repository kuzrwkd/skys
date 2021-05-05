.PHONY: build setup delete

build:
	docker build --no-cache -t market-navi-api:mysql5.7 api/mysql
	docker build --no-cache -t market-navi-api:express api/node

setup:
	kind create cluster --name market-navi
	kind load docker-image market-navi-api:mysql5.7 market-navi-api:express --name market-navi
	#kind load docker-image market-navi-api:express --name market-navi
	kubectl apply -f api/mysql/configMap.yml
	kubectl apply -f api/mysql/pod.yml
	docker exec market-navi-control-plane crictl images
	kubectl get all

delete:
	kubectl delete -f api/mysql/configMap.yml
	kubectl delete -f api/mysql/pod.yml
	docker exec market-navi-control-plane crictl rmi market-navi-api:mysql5.7
	#docker exec market-navi-control-plane crictl rmi market-navi-api:express
	docker exec market-navi-control-plane crictl images
	kind delete cluster --name market-navi