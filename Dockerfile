From node:23-alpine3.19
WORKDIR /apps
COPY . .
RUN npm insatll
CMD ["npm","start"]
