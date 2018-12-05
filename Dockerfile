FROM node:alpine as test
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm test

FROM node:alpine
WORKDIR /usr/src/app
RUN npm install --only=production
COPY . .
EXPOSE 8080 
CMD ["npm", "start"]
