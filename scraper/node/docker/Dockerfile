FROM node:15.11.0

WORKDIR /var/www

COPY entrypoint.sh /usr/local/bin

COPY wait-for-it.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/wait-for-it.sh \
    && npm install -g npm \
    && npm install -g pm2 \
    && npm install -g ts-node \
    && npm install -g npm-check-updates \
    && npm install -g @nestjs/cli \
    && npm install -g prisma

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
