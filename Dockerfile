## Descargamos la version correcta de Ubuntu, a traves del tag
FROM ubuntu:12.04
##MAINTANER William Angarita "mcpangara@gmail.com"
##LABEL maintaner="mcpangara@gmail.com"

## Acualizamos el sistema
RUN apt-get update

## Instalamos Nginx
RUN apt-get install nginx -y nginx

## Creamos un Volumen
VOLUME /usr/share/nginx/www/

## Creamos un parametro, con el fin de acuerdo a este cargar una pagina diferente, para este caso.
ARG webpage

## Creamos el fichero index.html en e directorio por defecto de nginx
## RUN echo 'Mi primer Dockerfile' > /usr/share/nginx/www/index.html
## ADD web /usr/share/nginx/www
ADD $webpage /usr/share/nginx/www

## Arrancamos NGINX a traves de ENTRYPOINT para que no pueda ser
## modificar en la creacion del contenedor
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]

## Exponemos el puerto 80
EXPOSE 80
