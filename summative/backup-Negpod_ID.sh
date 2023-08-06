#!/bin/bash

# Remote server details
remote_host="a0dfc11ba139.a982e858.alu-cod.online"
remote_user="a0dfc11ba139"
remote_password="899c79fc532cd0591af1"
remote_location="/home/sftp-student/03033/summative"

# Directory to be backed up
directory_to_backup="negpod_id-q1"

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

