FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

FROM builder as prod

RUN npm run build

CMD npm run start

FROM builder as test

RUN npm run test

FROM builder as dev

CMD npm run dev
