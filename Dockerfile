FROM node:16-alpine

WORKDIR /app

COPY package.json .

RUN npm install
RUN npm install vite-plugin-vue2 --save-dev
RUN npm install vite @vitejs/plugin-vue --save-dev
COPY . .


CMD [ "npm", "run", "dev" ]