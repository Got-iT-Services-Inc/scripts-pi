#!/bin/bash
# This is an installation script for the raspberry pi, it checks to see
# if the files are already linked, and if not, adds linking for them

echo "Pi scripts installation scripts (ironic, no?)..."
echo "This script will 'install' scripts for the raspberry pi (3)..."
echo "scripts scripts scripts scripts...(I didn't think I said scripts enough)"
if [ -d "/root/scripts-pi" ]; then
   echo "* Scripts installation/clone directory is correct! Setting permissions..."
   chmod -R +x /root/scripts-pi/
else
   echo "* Scripts installation/clone directory is WRONG!"
   echo "NOTE: These scripts MUST BE INSTALLED in /root/scripts-pi"
   echo "      You should have cloned this repository into /root/"
   exit 1
fi

printf "* Checking to see if autoreconnect is already linked..."
if [ -L  /sbin/autoreconnect ]; then
   printf "... Already linked!\n"
else
   if [ -e /sbin/autoreconnect ]; then
      printf "... The file exists as a regular file, Deleting!\n"
   else
      printf "... Not linked!\n"
   fi
   printf "* Linking autoreconnect script..."
   ln -s /root/scripts-pi/autoreconnect /sbin/autoreconnect
   printf "...Done!\n"
fi
echo "Installation Complete!"
