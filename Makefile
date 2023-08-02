docker_image_repo=us-central1-docker.pkg.dev/ca-planton-gcp-sh-zg/afs-planton-oss-gcp-uc1-docker
docker_image_path=github.com/plantoncloud/docker-image-nodejs-with-planton-cli
docker_image_tag?=nodejs-18-12-0-yarn-3-planton-cli-v0.0.60
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
