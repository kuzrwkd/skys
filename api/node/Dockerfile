FROM node:15.14.0-alpine3.10

WORKDIR /var/www

COPY bash/entrypoint.sh /

COPY bash/wait-for-it.sh /

RUN chmod +x /entrypoint.sh \
    && chmod +x /wait-for-it.sh \
    && npm install -g npm \
    && npm install -g pm2 \
    && npm install -g ts-node \
    && npm install -g npm-check-updates

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
