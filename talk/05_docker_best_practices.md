## Best Practices for Dockerfiles

- Official Tips from Docker Docs
- Tips by Michael Crosby
- Tips from our Experience

---

### [Official Tips from Docker Docs](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)

- Containers should be ephemeral
- Use a .dockerignore file
- Avoid installing unnecessary packages
- Run only one process per container
- Sort multi-line arguments

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

[__06 Docker Examples__](..)
