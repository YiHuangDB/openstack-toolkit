#!/bin/bash

# FILEPATH: /opt/stack/openstack-toolkit/restore-mysql.sh

# Read user input parameter
read -p "Enter the restore source folder name: " foldername
echo "Restore from: /var/lib/$foldername"
echo "Stopping MySQL service..."
sudo systemctl stop mysql
echo "Deleting MySQL data..."
sudo rm -rf /var/lib/mysql/*
# Call the script using the user input parameter as an argument
echo "Copying backup MySQL data to mysql folder /var/lib/mysql..."
sudo cp -r  "/var/lib/$foldername" /var/lib/mysql
echo "Changing ownership of restored folder..."
sudo chown -R stack:stack "/var/lib/mysql"
echo "Starting MySQL service..."
sudo systemctl start mysql
echo "Backup complete!"
