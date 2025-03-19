# Build stage
FROM node:20 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# build stage 2

FROM node:20-alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 5173

CMD ["npm","run","dev"]

