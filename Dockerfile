FROM nginx:latest

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./public /www
