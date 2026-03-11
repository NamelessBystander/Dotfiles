#!/usr/bin/fish

# Make Backup
rm -rf ~/Storage/ProtonDriveBackup/
cp ~/ProtonDrive/ ~/Storage/ProtonDriveBackup 
echo "Backup created"

# Sync local to cloud
proton-drive-sync reconcile
echo "Uploading to cloud..."
sleep 60
echo "Done"

# Sync cloud to local
echo "Downloading from cloud..."
rclone sync "ProtonDrive": ~/ProtonDrive
echo "Done"

