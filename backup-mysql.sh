#!/bin/bash

# FILEPATH: /opt/stack/openstack-toolkit/backup-mysql.sh

# Read user input parameter
read -p "Enter the backup target folder name: " foldername
echo "Backup target: /var/lib/$foldername"
echo "Deleting backup folder..."
sudo rm -rf "/var/lib/$foldername"
echo "Stopping MySQL service..."
sudo systemctl stop mysql
# Call the script using the user input parameter as an argument
echo "Copying MySQL data to backup folder..."
sudo cp -r /var/lib/mysql "/var/lib/$foldername"
echo "Changing ownership of backup folder..."
sudo chown -R stack:stack "/var/lib/$foldername"
echo "Starting MySQL service..."
sudo systemctl start mysql
echo "Backup complete!"
