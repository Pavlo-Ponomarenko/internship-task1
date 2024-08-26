#!/bin/sh

envsubst '${DESTINATION_IP}' < nginx/nginx.conf.template > /etc/nginx/nginx.conf

nginx -g 'daemon off;'
