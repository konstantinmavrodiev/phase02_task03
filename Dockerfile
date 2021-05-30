# don't change this line
FROM korney4eg/nginx-php:latest

LABEL maintainer="Konstantin"

# Update the VM
RUN apt-get update -y

# Install NGINX
RUN apt-get install -y nginx

# Adds our specific configuration for NGINX
ADD app.conf /etc/nginx/sites-enabled/app.conf

# Copy sample PHP application
ADD index.php /var/www/app/wordpress/index.php

# Change privileges
RUN chown -R 777 /var/www/app

# Expose port 80
EXPOSE 80

# Add Supervisor conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Download and copy the required theme
RUN curl "https://github.com/korney4eg/thank-after-post-plugin/releases/download/v0.8.0/thank-after-post.zip" -o /var/www/app/wordpress/wp && chmod +x /var/www/app/wordpress/wp


# your code goes here
# Make nginx use app.conf configuration to properly render php files
# Make sure that index.php file is available in browser
# expose needed ports


# don't change this line
CMD ["/usr/bin/supervisord"]
