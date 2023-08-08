#!/bin/bash

# Remote server details
remote_host="5627d1252da8.500845f2.alu-cod.online"
remote_user="5627d1252da8"
remote_password="31dbe00036c963f7ca58"
remote_location="/home/sftp-student/03033/summative"

# Directory to be backed up
directory_to_backup="negpod_1-q1"

# Archive the directory to a tar.gz file
tar_filename="${directory_to_backup}.tar.gz"
tar -czf "$tar_filename" "$directory_to_backup"

# Transfer the tar.gz file to the remote server using sftp
echo "put $tar_filename" | sftp "$remote_user@$remote_host:$remote_location" <<EOF
$remote_password
EOF

# Remove the local tar.gz file after backup
rm "$tar_filename"

echo "Backup completed to the remote server."

