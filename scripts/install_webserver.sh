#!/bin/bash

# Exit on error
set -e

# Update packages
sudo apt-get update -y

# Install Nginx
sudo apt-get install nginx -y

# Create Hello World HTML
cat <<EOF | sudo tee /var/www/html/index.html
<html>
  <head><title>Hello World</title></head>
  <body>
    <h1>Hello World from Azure VM!</h1>
  </body>
</html>
EOF

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl restart nginx
