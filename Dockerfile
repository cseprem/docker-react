FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# build folder will have all details to run in prod


FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
