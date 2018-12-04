# Create a container image for the NodeJS sample app
# See http://docs.microsoft.com/azure/devops/pipelines/languages/docker for more information
FROM node:alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied 
# where available
COPY package*.json ./

RUN npm install
# If you are building your code for production 
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 8080 
CMD ["npm", "start"]
