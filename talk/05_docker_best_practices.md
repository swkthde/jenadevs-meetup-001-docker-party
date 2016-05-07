## Best Practices for Dockerfiles

- Official Tips from Docker Docs
- Tips by Michael Crosby
- Tips from our Experience

---

# [Docker 101](https://docs.docker.com/engine/reference/builder)

## Official Best Practices for Writing Dockerfiles

---

### [General guidelines](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)

- (01) Containers should be ephemeral
- (02) Use a .dockerignore file
- (03) Avoid installing unnecessary packages
- (04) Run only one process per container
- (05) Minimize the number of layers

---

#### (06) Sort multi-line arguments

```
RUN apt-get update && apt-get install --yes \
   bzr \
   cvs \
   git \
   mercurial \
   subversion
```

---

#### (07) Build cache

- **CACHING:** Use whenever possible. Saves time.
- **DISABLE:** `docker build --no-cache=true -t .`
- **CHECKSUMS:** For `ADD` and `COPY` the contents of the file(s) in the image are examined and a checksum is calculated for each file. During the cache lookup, the checksum is compared against the checksum in the existing images. Cache is invalid if anything has changed (besides file access dates)!
- **NO CACHE LOOKUP**: All other commands are not evaluted on a file level to determine a cache match/hit. Just the command string itself is used to find a match when processing files updated in the container, e.g. `RUN apt-get -y update`

---

### [The Dockerfile instructions](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)

- (08) FROM: use current official Repositories, e.g. [Debian](https://hub.docker.com/_/debian) is tightly controlled and kept minimal: 150 mb.
- (09) RUN: split long or complex RUN statements on multiple lines separated
- (10) Avoid `RUN apt-get upgrade` or `dist-upgrade` as many of the “essential” packages from the base images won’t upgrade inside an unprivileged container.

---

#### (11) apt-get update

- **CACHE BUSTING:** Always combine `RUN apt-get update && apt-get install -y ...`. Using apt-get update alone in a RUN statement causes caching issues and subsequent apt-get install instructions fail.
```
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y curl
```
```
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y curl nginx
```
- **VERSION PINNING:** forces the build to retrieve a particular version regardless of what’s in the cache. new versions cause a cache bust of `apt-get update`.
```
RUN apt-get update && apt-get install 
	package-foo=1.3.* \
	s3cmd=1.1.* \
```

---

#### (12) CMD

- alway use this format: 
```
CMD [“executable”, “param1”, “param2”…]`
CMD ["apache2","-DFOREGROUND"]
CMD ["perl", "-de0"]
CMD ["python"]
CMD [“php”, “-a”]
```
- do only rarle use `CMD [“param”, “param”]` in conjunction with `ENTRYPOINT` unless you/your users are familiar with `ENTRYPOINT`

---

#### (14) EXPOSE

- use the common, traditional port for your application, e.g. 
```
EXPOSE 80 # Apache 
EXPOSE 27017 # MongoDB
```
- For container linking, Docker provides environment variables for the path from the recipient container back to the source (ie, `MYSQL_PORT_3306_TCP`

---

### (15) ENV

- Update path to ensure commands work:
```
ENV PATH /usr/local/nginx/bin:$PATH
CMD [“nginx”]
```
- Provide needed env vars for services eg. Postgres `PGDATA`.
- Use for version numbers and pathes (like constant vars):
```
ENV PG_MAJOR 9.3
ENV PG_VERSION 9.3.4
RUN curl -SL http://example.com/postgres-$PG_VERSION.tar.xz | tar -xJC /usr/src/postgress && …
```

---

### (16) COPY

- Prefer `COPY`. more transparent than `ADD`.
- `COPY` only supports the basic copying of local files into the container, while `ADD` has some features (like local-only tar extraction and remote URL support) that are not immediately obvious.

- **FEWER CACHE INVALIDATIONS:** Reuse multiple COPY steps individually. Ensures that each step’s build cache is only invalidated (forcing the step to be re-run) if a file changes.
```
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/
```

---

### (17) ADD

- **TAR AUTO-EXTRACTION**: `ADD rootfs.tar.xz /`
- Because image size matters, using `ADD` to fetch packages from remote URLs is strongly discouraged; you should use `curl` or `wget`

```
# Bad
ADD http://example.com/big.tar.xz /usr/src/things/
RUN tar -xJf /usr/src/things/big.tar.xz -C /usr/src/things
RUN make -C /usr/src/things all 

# Good
RUN mkdir -p /usr/src/things \
    && curl -SL http://example.com/big.tar.xz \
    | tar -xJC /usr/src/things \
    && make -C /usr/src/things all
```

---

### (18) Entrypoint Script

- Simple Example epagesdocs: [Dockerfile](https://github.com/ePages-de/epages-docs/blob/develop/Dockerfile.ruby), [Entrypoint Script](https://github.com/ePages-de/epages-docs/blob/develop/_docker/ruby/docker-entrypoint.sh), CAUTION: uses root user for testing!

- Complex Example **to-logstash**: [Dockerfile](https://github.com/ePages-de/to-logstash/blob/dev/Dockerfile), [Entrypoint Script](https://github.com/ePages-de/to-logstash/blob/dev/docker-entrypoint.sh)

---

### Tips by Michael Crosby


- Use the build cache
- Use tags
- Don't upgrade in builds
- Use small base images
- Group common operatinos

<small>Michael Crosby (working for Docker) is a blogger, Docker and Go expert.
Links: [1](http://crosbymichael.com/dockerfile-best-practices.html), [2](http://crosbymichael.com/dockerfile-best-practices-take-2.html).</small>

---

### Our Experience

- Use fixed version for base image
- Prefer offical base images
- Use [gosu](https://github.com/tianon/gosu) for easy-stepdown from root
- Define own entrypoint if needed
- Write integration tests, e.g. with CircleCI
- More Tips: [[1](https://getcarina.com/docs/best-practices/docker-best-practices-dockerfile)] [[2](http://jonathan.bergknoff.com/journal/building-good-docker-images)] [[3](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images)] [[4](http://www.carlboettiger.info/2014/08/29/docker-notes.html)]

---

### Testing with CircleCI before usage

- Simple example to-elasticsearch: [circel.yml](https://github.com/ePages-de/to-elasticsearch/blob/dev/circle.yml)

- Complex example to-logstash: [circel.yml](https://github.com/ePages-de/to-logstash/blob/dev/circle.yml), [test scripts](https://github.com/ePages-de/to-logstash/tree/dev/test)

---

[__06 Docker Examples__](http://localhost:1948/06_docker_examples.md#/)
