FROM node:18-alpine AS base
WORKDIR /src
COPY package*.json ./
 
FROM base
ENV NODE_ENV=production
RUN npm ci
COPY ./ ./
CMD ["node", "index.js"]