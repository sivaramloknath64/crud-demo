# Stage 1
FROM node:10.15.3-alpine as builder

WORKDIR /DOCKERDEMO
COPY ..
RUN npm install
RUN npm run build --prod

# Stage 2
FROM nginx:1.15.8-alpine

COPY --from=builder /usr/src/app/dist /usr/share/nginx/html

