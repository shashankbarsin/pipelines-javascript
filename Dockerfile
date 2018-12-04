# Create a container image for the NodeJS sample app
# # First stage of multi-stage build
FROM node:alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied 
# where available
COPY package*.json ./

# Build and test
RUN npm install
COPY . .
RUN npm test

# Second stage
FROM node:alpine
WORKDIR /usr/src/app
RUN npm install --only=production
# Bundle app source
COPY . .
EXPOSE 8080 
CMD ["npm", "start"]
