# Docker Use Cases

- Dev and Testing
- CI and CD
- Operations

---

## Dev and Testing

- same environment for everyone
- easy setup of complex architectures
- use common base image and extend it with your application
- containerize the different parts of your application

---

## Dev and Testing

- new developers need Docker only
- QA can spin up containers for testing (no need for long-running installs)
- reproducing errors is not affected by different environments

---

## Dev and Testing

- use containers for testing
- test environment can be setup more easily
- test environment uses same images as dev environment
- increase testing capabilities by increasing no. of available containers
- [docker-selenium](https://github.com/SeleniumHQ/docker-selenium/) provides pre-built images with Selenium

---

## CI and CD

- CI/CD with [Jenkins](https://hub.docker.com/_/jenkins/)
- [Jenkins in Docker tutorial](http://shashikantjagtap.net/get-started-with-brand-new-jenkins-2-0-with-docker)
- Data Analysis with [Logstash](https://www.elastic.co/products/logstash) and [Elasticsearch](https://www.elastic.co/products/elasticsearch)

---

## Operations

- Build environment with custom perl
- Icinga2 configuration check
- Running containers in [Kubernetes](http://kubernetes.io) cluster

---

[__08 Docker Workshops__](http://localhost:1948/08_docker_workshops.md#/)
