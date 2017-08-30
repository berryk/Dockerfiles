FROM node:latest

WORKDIR /usr/src/app

COPY package.json . 
COPY index.js . 
COPY views/ ./views/. 

RUN npm install

CMD [ "npm","start"]
