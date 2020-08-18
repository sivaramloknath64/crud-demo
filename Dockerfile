# Stage 1
FROM node:10.15.3-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod
# Stage 2
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/docs /usr/share/nginx/html


# # Stage 1
# FROM node:10.15.3-alpine as builder
# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN npm run build --prod


# # Stage 2

# FROM nginx:1.13.12-alpine

# COPY --from=node /usr/src/app/dist /usr/share/nginx/html

# COPY /nginx.conf /etc/nginx/conf.d/default.conf

