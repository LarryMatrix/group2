FROM node:12.14-alpine AS node

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm cache clean --force

RUN npm i

COPY . .

RUN ./node_modules/.bin/ng build --prod


FROM nginx

COPY --from=node /app/dist/group2 /usr/share/nginx/html

EXPOSE 80
