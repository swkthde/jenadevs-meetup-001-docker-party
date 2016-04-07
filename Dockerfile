FROM node:4.4.2

MAINTAINER Christian Koehler <c.koehler@epages.com>

RUN npm install -g reveal-md && \
    npm cache clean

EXPOSE 1948

VOLUME ["/data"]

CMD reveal-md --port 1948 /data --theme white
