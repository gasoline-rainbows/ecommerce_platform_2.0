FROM nginx:1.7
RUN mkdir /tmp/cache
RUN chown www-data /tmp/cache
RUN rm /etc/nginx/conf.d/*
COPY app.conf /etc/nginx/conf.d/