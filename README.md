## Docker Party - Introduction and Best Practices for Containers

_This is the 1st [Jena Developers Meetup](www.meetup.com/jenadevs) of [Softwerkskammer Jena](https://www.softwerkskammer.org/groups/jena), the Software Craftsmanship Community around Jena._

The repository contains the material for the talk, the workshops and references like a cheatsheet and linklist.

The event and its participants are listed here:

* [Softwerkskammer Activity](https://www.softwerkskammer.org/activities/jenadevs-001)
* [Jena Developers Meetup](http://www.meetup.com/jenadevs/events/229510357)

### Talk

Slides can be run via [reveal-md](https://github.com/webpro/reveal-md).

```
# open all slide decks via dir
reveal-md talk/ --theme white
````

On the meetup day we opened the slide decks with these settings.

```
# Short intro to the meetup
reveal-md talk/01_welcome.md --theme jenadevs
#
# Talk (part 1)
reveal-md talk/02_docker_party.md --theme white
reveal-md talk/03_docker_basics.md --theme white
reveal-md talk/04_docker_commands.md --theme white
#
# Demo (hello-world and show basic workflows)
#
# Talk (part 2)
reveal-md talk/05_docker_best_practices.md --theme white
reveal-md talk/06_docker_examples.md --theme white
reveal-md talk/07_docker_use_cases.md --theme white
#
# Demo (show use cases)
#
# Outline the workshop groups
reveal-md talk/08_docker_workshops.md --theme white
```

Run from container
```
docker build -t jenadevs-meetup:001 .
docker run -v `pwd`/talk:/data -p 1948:1948 jenadevs-meetup:001
```

### Workshops

* Beginner: [Official Docker Birthday App](https://github.com/docker/docker-birthday-3)
* Advanced: Inside this repo use `circle.yml` and fulfill `workshop/` dir tasks
* Special: [Core OS Experiments](https://github.com/jenadevs/coreos-vagrant)
* ...

