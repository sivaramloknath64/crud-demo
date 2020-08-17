# Stage 1
FROM node:10.15.3-alpine as builder
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --prod


# Stage 2
FROM nginx:1.15.8-alpine

COPY --from=builder /usr/src/app/dist /usr/share/nginx/html

