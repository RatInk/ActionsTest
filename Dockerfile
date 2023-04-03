FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN yarn

RUN yarn eslint

RUN yarn test

COPY . .

RUN node_modules/.bin/tsc

RUN yarn build

ENTRYPOINT ["node", "./build/index.js"]
