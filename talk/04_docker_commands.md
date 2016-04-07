
## Docker Commands

* Toolbox
* Workflow
* CLI Commands
* Dockerfile Commands

---

![Docker Toolbox](images/docker_toolbox.jpg)

Installation for [Mac](https://docs.docker.com/engine/installation/mac) / [Windows](https://docs.docker.com/engine/installation/windows) / [Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux)

---

### Workflow

_See Flipchart_

---

### [CLI Commandos](https://docs.docker.com/engine/reference/commandline/cli/)

```
docker build -t ${DOCKER_IMAGE_NGINX}:${DOCKER_IMAGE_TAG} ${DIR}

docker run -it --name my-first-container \
	ubuntu:14.04 \
	/bin/echo "Hello World"

docker ps -a

docker run --rm -d \
    --env-file "<PATH_TO_ENV_FILE>" \
    -p ${HOST_HTTP_PORT}:${DOCKER_HTTP_PORT} \
    -p ${HOST_TCP_PORT}:${DOCKER_TCP_PORT} \
    -v ${HOST_DATA_DIR}:${DOCKER_DATA_VOL} \
    --name ${DOCKER_CONTAINER_NAME} \
     ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
```

---

### [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)

```
FROM <IMAGE_NAME>:<IMAGE_TAG>

MAINTAINER <NAME> <SURNAME> "name.surname@company.com"

ENV <VARIABLE>=<VALUE>

# (e.g. apt-get update)
RUN <Shell_COMMAND> 

ADD <FILE> <CONTAINER_FOLDER>

COPY <FILE/FOLDER> <CONTAINER_LOCATION>

VOLUME <FOLDER_TO_BE_MOUNTED>

EXPOSE <PORT>

ENTRYPOINT ["<PROGRAM>"]

CMD ["<PARAM1>", "<PARAM2>"]
```

---

[__Finally, it's DEMO time!__](..)
