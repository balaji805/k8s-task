FROM alpine:3.10 AS base
RUN apk add --no-cache nodejs-current-npm tini && rm -rf /var/cache/apk/*
WORKDIR /root/app
ENTRYPOINT ["/sbin/tini", "--"]
COPY package.json .
COPY server.js .

FROM base AS dep
# Installing dependencies
RUN npm set progress=false && \
    npm config set depth 0 && \
    npm install --save express cors body-parser @rama41222/node-logger

FROM dep AS app
COPY --from=dep /root/app/node_modules ./node_modules
COPY . .
EXPOSE 8080
CMD ["npm", "run", "start"]