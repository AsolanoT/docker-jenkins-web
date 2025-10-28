FROM ubuntu
MAINTAINER Luis Vargas "lanvargas@corhuila.edu.co"

# Cambia repositorios a HTTPS y luego actualiza
RUN sed -i 's|http://|https://|g' /etc/apt/sources.list && apt-get update

# Instala Nginx
RUN apt-get install -y nginx

# Copia tus archivos web
ADD web /var/www/html/

# Define punto de entrada y expone el puerto
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
