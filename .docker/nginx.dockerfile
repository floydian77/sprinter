FROM nginx:latest

RUN apt-get update && apt-get install -y openssl --no-install-recommends

COPY conf/nginx/openssl.cnf /etc/nginx/ssl/openssl.cnf

RUN openssl genrsa -out /etc/nginx/ssl/server.key 3072
RUN openssl req -new -x509 -key /etc/nginx/ssl/server.key -sha256 -config /etc/nginx/ssl/openssl.cnf -out /etc/nginx/ssl/server.crt -days 730

COPY conf/nginx/default.conf /etc/nginx/conf.d/default.conf
