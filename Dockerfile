FROM node:20 AS build

WORKDIR /usr/src/app

# copy package.json
COPY ./app/package.json ./

# install deps
RUN npm install --only=production

# copy everything else
COPY ./app/app.js .
COPY ./app/views/ ./app/views

EXPOSE 5000

ENTRYPOINT ["node", "app.js"]
