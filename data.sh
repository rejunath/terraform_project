#!/bin/sh
sudo apt update -y
sudo apt install apache2 -y
sleep 1s
git clone https://github.com/amolshete/card-website.git
sudo cp -r /card-website/* /var/www/html/
sudo service apache2 restart