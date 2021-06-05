.PHONY: build setup delete

build:
	docker build --no-cache -t sky-api:mysql5.7 api/mysql/docker
	docker build --no-cache -t sky-api:express api/node/docker

setup:
	kind create cluster --name sky
	kind load docker-image sky-api:mysql5.7 sky-api:express --name sky
	kind load docker-image sky-api:express --name sky
	kubectl apply -f api/mysql/configMap.yml
	kubectl apply -f api/mysql/pod.yml
	kubectl apply -f api/node/pod.yml
	docker exec sky-control-plane crictl images
	kubectl get all

delete:
	kubectl delete -f api/mysql/configMap.yml
	kubectl delete -f api/mysql/pod.yml
	docker exec sky-control-plane crictl rmi sky-api:mysql5.7
	docker exec sky-control-plane crictl rmi sky-api:express
	docker exec sky-control-plane crictl images
	kind delete cluster --name sky