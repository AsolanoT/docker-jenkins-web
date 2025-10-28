FROM ubuntu
MAINTAINER Luis Vargas "agsolano-2023a@corhuila.edu.co"

# Cambia repositorios a HTTPS y luego actualiza
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|https://archive.ubuntu.com/ubuntu/|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu|https://security.ubuntu.com/ubuntu|g' /etc/apt/sources.list && \
    apt-get update
# Instala Nginx
RUN apt-get install -y nginx

# Copia tus archivos web
ADD web /var/www/html/

# Define punto de entrada y expone el puerto
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
