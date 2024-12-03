From node:lts
WORKDIR /apps
COPY . .
RUN npm insatll
CMD ["npm","start"]
