#!/bin/bash
apt update
apt install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1>Deployed Machine via Terraform</h1>" | sudo tee /var/www/html/index.html