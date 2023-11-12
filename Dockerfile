# syntax=docker/dockerfile:1

FROM node:18-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . .
CMD [ "node", "src/index.js" ]
EXPOSE 3000

# multi-stages build
# https://docs.docker.com/get-started/09_image_best/#multi-stage-builds
# FROM node:18 AS build
# WORKDIR /app
# COPY package* yarn.lock ./
# RUN yarn install
# COPY public ./public
# COPY src ./src
# RUN yarn run build

# FROM nginx:alpine
# COPY --from=build /app/build /usr/share/nginx/html