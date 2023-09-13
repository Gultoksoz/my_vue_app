FROM node

COPY . .



RUN npm install vite-plugin-vue2 --save-dev

RUN npm install -y

CMD [ "npm","run","dev" ]