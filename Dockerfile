FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN yarn

COPY . .

RUN node_modules/.bin/tsc

RUN yarn build

ENTRYPOINT ["node", "./build/index.js"]
