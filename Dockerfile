FROM node:4.4.2
MAINTAINER Christian Köhler <c.koehler@epages.com>

RUN npm install -g reveal-md && \
    npm cache clean

EXPOSE 8080
VOLUME ["/data"]

CMD reveal-md --port 8080 /data --theme white
