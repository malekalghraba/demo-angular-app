# stage 1
FROM node:14 as node 
WORKDIR /app 
RUN npm install -g @angular/cli 
COPY . . 
RUN npm install 
RUN ng build --configuration=staging --base-href=/RISQUE/

# stage 2

FROM php:7.4-apache
COPY --from=node /app/dist/ /var/www/html/
COPY --from=node /app/.htaccess.txt /var/www/

EXPOSE 80