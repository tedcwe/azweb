# Pull base image
FROM debian:latest

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

# Install nginx and adjust nginx config to stay in foreground
RUN apt-get update && apt-get install --no-install-recommends -y nginx; \
 echo "daemon off;" >> /etc/nginx/nginx.conf \ 
 echo "<!DOCTYPE html>
<head>
    <title>My Echo Web Server</title>
</head>
<body>
    <h1>Welcome to my Echo web server!</h1>
    <p>This is a simple HTML page served by Echo.</p>
</body>
</html>
"> /var/www/html/index.html

# Expose HTTP
EXPOSE 80

# Start nginx
CMD ["/usr/sbin/nginx"]
