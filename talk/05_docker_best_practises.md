## Best Practices for Dockerfiles

- Official Tips from Docker Docs
- Tips by Michael Crosby
- Tips by Jeff Lindsay
- Our experience

---

### Official Tips from Docker Docs [1](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)

- 1
- 2
- 3
- 4

---

### Tips by Michael Crosby [1](http://crosbymichael.com/dockerfile-best-practices.html) [2](http://crosbymichael.com/dockerfile-best-practices-take-2.html)

- 1
- 2
- 3
- 4

<small>Michael Crosby is a blogger, Docker and Go expert.</small>

---

### Tips by Jeff Lindsay [1](http://www.infoq.com/interviews/lindsay-docker)

- 1
- 2
- 3
- 4

<small>Jeff Lindsay is the author of Dokku and many Docker related OSS projects.</small>

---

### Our experience [1](https://getcarina.com/docs/best-practices/docker-best-practices-dockerfile) [2](http://jonathan.bergknoff.com/journal/building-good-docker-images) [3](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images) [4](http://www.carlboettiger.info/2014/08/29/docker-notes.html)

- Use fixed version for base image
- Prefer offical base images
- Use [gosu](https://github.com/tianon/gosu) for easy-stepdown from root
- Define own entrypoint if needed
- Write integration tests, e.g. with CircleCI

---

[__HOME__](..)
