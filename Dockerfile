FROM node:latest

MAINTAINER Kenneth Black

COPY 		. /var/www
WORKDIR 	/var/www


EXPOSE 3000

ENTRYPOINT ["node", "keystone"]
