# Pull base image
FROM debian:latest

# Dockerfile Maintainer
LABEL maintainer="Osama Elshazly"

# Install nginx and adjust nginx config to stay in foreground
RUN apt-get update && apt-get install --no-install-recommends -y nginx && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

# Create index.html using echo command
RUN echo '<!DOCTYPE html> \
<html lang="en"> \
<head> \
    <meta charset="UTF-8"> \
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> \
    <title>My Echo Web Server</title> \
</head> \
<body> \
    <h1>Hamada is the leader</h1> \
    <h2>Hamada is the second leader</h2> \
    <h3>Hamada is the third leader</h3> \
    <h1>Welcome to my Echo web server!</h1> \
    <p>This is a simple HTML page served by Echo.</p> \
</body> \
</html>' > /var/www/html/index.html

# Expose HTTP
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
