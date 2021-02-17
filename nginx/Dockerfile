FROM nginx:1.17.5

RUN rm -f /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/atopic_share.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf