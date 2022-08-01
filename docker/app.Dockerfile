FROM node:18.6.0-alpine as build

WORKDIR /app

COPY files/api.yml /app/

#RUN npx redoc-cli bundle api.yml

FROM nginx:1.23.0-alpine

COPY --from=build /app/redoc-static.html /app/index.html

COPY files/nginx.conf /etc/nginx/conf.d/
