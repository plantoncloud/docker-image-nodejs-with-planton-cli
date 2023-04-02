docker_image_repo=us-central1-docker.pkg.dev/planton-shared-services-jx/planton-pcs-docker-repo-external
docker_image_path=gitlab.com/plantoncode/planton/oss/docker-images/nodejs-with-planton-cli
docker_image_tag?=nodejs-17-3-1-yarn-3-planton-cli-v0.0.37
docker_image=${docker_image_repo}/${docker_image_path}:${docker_image_tag}

.PHONY: build
build:
	docker build --platform linux/amd64 -t ${docker_image} .

.PHONY: release
release: build
	docker push ${docker_image}

.PHONY: tag
tag:
	git tag ${docker_image_tag}
	git push origin ${docker_image_tag}
