build:
	docker build --no-cache -t skys-api:mysql5.7 api/mysql/docker
	docker build --no-cache -t skys-api:nestjs api/node/docker

clean:
	docker rmi skys-api:nestjs
	docker rmi skys-api:mysql5.7

apply:
	kubectl apply -f api/mysql/configMap.yml
	kubectl apply -f api/mysql/deployment.yml
	kubectl apply -f api/mysql/service.yml
	kubectl apply -f api/node/deployment.yml
	kubectl apply -f api/node/service.yml

delete:
	kubectl delete -f api/mysql/configMap.yml
	kubectl delete -f api/mysql/deployment.yml
	kubectl delete -f api/mysql/service.yml
	kubectl delete -f api/node/deployment.yml
	kubectl delete -f api/node/service.yml

dashboard:
	kubectl apply -f dashboard-adminuser.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.0/aio/deploy/recommended.yaml
	kubectl proxy

dashboard-token:
	kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

dashboard-open:
	open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/