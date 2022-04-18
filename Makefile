.DEFAULT_GOAL := help

.PHONY: docker_auth docker_build docker_tag docker_push

docker_auth:
	echo "$$DOCKERHUB_PASSWORD" | docker login --username "$$DOCKERHUB_USERNAME" --password-stdin

docker_build:
	docker build -t udagram-api-feed ./udagram-api-feed
	docker build -t udagram-api-user ./udagram-api-user
	docker build -t udagram-frontend ./udagram-frontend
	docker build -t reverseproxy ./udagram-reverseproxy
	
docker_tag: docker_build
	docker tag udagram-api-feed meharusama/udagram-api-feed:${GITHUB_SHA}
	docker tag udagram-api-user meharusama/udagram-api-user:${GITHUB_SHA}
	docker tag udagram-frontend meharusama/udagram-frontend:${GITHUB_SHA}
	docker tag reverseproxy meharusama/reverseproxy:${GITHUB_SHA}

	docker tag udagram-api-feed meharusama/udagram-api-feed:latest
	docker tag udagram-api-user meharusama/udagram-api-user:latest
	docker tag udagram-frontend meharusama/udagram-frontend:latest
	docker tag reverseproxy meharusama/reverseproxy:latest

docker_push: docker_tag docker_auth
	docker push meharusama/udagram-api-feed:${GITHUB_SHA}
	docker push meharusama/udagram-api-user:${GITHUB_SHA}
	docker push meharusama/udagram-frontend:${GITHUB_SHA}
	docker push meharusama/reverseproxy:${GITHUB_SHA}

	docker push meharusama/udagram-api-feed:latest
	docker push meharusama/udagram-api-user:latest
	docker push meharusama/udagram-frontend:latest
	docker push meharusama/reverseproxy:latest
