#!/bin/bash
# This is an installation script for the raspberry pi cron jobs, 
# it checks to see if the files are already linked, and if not,
#  adds linking for them

echo "Pi cron installation script (ironic, no?)..."
echo "This script will 'install' crons for the raspberry pi (3)..."
if [ -d "/root/scripts-pi/cron.d" ]; then
   echo "* Cron installation/clone directory is correct! Setting permissions..."
   chmod -R +x /root/scripts-pi/
else
   echo "* Cron installation/clone directory is WRONG!"
   echo "NOTE: These scripts MUST BE INSTALLED in /root/scripts-pi/cron.d"
   echo "      You should have cloned this repository into /root/"
   exit 1
fi

printf "* Checking to see if autoreconnect.cron is already linked..."
if [ -L  /etc/cron.d/autoreconnect.cron ]; then
   printf "... Already linked!\n"
else
   if [ -e /etc/cron.d/autoreconnect.cron ]; then
      printf "... The file exists as a regular file, Deleting!\n"
   else
      printf "... Not linked!\n"
   fi
   printf "* Linking autoreconnect script..."
   ln -s /root/scripts-pi/cron.d/autoreconnect.cron /etc/cron.d/autoreconnect.cron
   printf "...Done!\n"
fi
echo "Restarting Cron..."
service cron restart
echo "Installation Complete!"
