# Stage 1
FROM node:10.15.3-alpine as node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --prod

# Stage 2
FROM nginx:1.17-alpine

COPY --from=node /usr/src/app/dist /usr/share/nginx/html

