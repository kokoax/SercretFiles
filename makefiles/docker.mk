DOCKER_CMD			:= docker
CONTAINER_NAME	:= dotfiles
CMD							:= /usr/local/bin/bash --login; apk add --no-cache --virtual make
IMAGE_NAME			:= bash

docker/run: ## Docker start and into the container , if exit then remove container
	$(DOCKER_CMD) run -d --privileged --name $(CONTAINER_NAME) \
	--add-host="dotfiles.com:127.0.0.1" \
	-p 127.0.0.1:8080:8080 \
	-v ${PWD}:/root/dotfiles -w /root/dotfiles \
	$(IMAGE_NAME) /sbin/init
	$(DOCKER_CMD) exec -it $(CONTAINER_NAME) $(CMD)
	$(MAKE) docker/rm

docker/rm: ## Docker container remove
	[ ! `$(DOCKER_CMD) ps -q -a --filter name=$(CONTAINER_NAME)` ] || $(DOCKER_CMD) rm --force `$(DOCKER_CMD) ps -q -a --filter name=$(CONTAINER_NAME)`

