FROM node:12.20
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node
WORKDIR /home/node/app
COPY package*.json ./
USER node
ENV DATABASE_URI=mongodb://jese:25448132@MongoDemo:27017/ApipagoInit?ssl=false&authSource=admin
ENV PORT=5000
ENV NODE_ENV=production
RUN npm install
COPY --chown=node:node . .
RUN npm run build
EXPOSE 5000
CMD [ "npm", "start" ]
