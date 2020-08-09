#!/bin/bash

# Desc: This script has two main functions, depending on which
#       flag is used
# -g: Grabs all files of the specified file type from the
#     remote directory and copies it into the local directory
# -p: Pushes all files of the specified file type from the local
#     directory into remote directory

# May be modified (trailing slash on paths are recommended)
file_type='*.c'
remote_directory='example@example.com:~/path/to/remote/dir/'
local_directory='/path/to/local/dir'

# Code
while getopts ":gp" opt; do
	case $opt in
		g)
			echo 'Fetching from remote directory'
			rsync -av -e ssh --include '*/' --include=$file_type --exclude='*' $remote_directory $local_directory
			;;
		p)
			echo 'Pushing to remote directory'
			rsync -av -e ssh --include '*/' --include=$file_type --exclude='*' $local_directory $remote_directory
			;;
		\?)
			echo 'Invalid flag. Use -g to copy from remote to local. Use -p to copy from local to remote'
			;;
	esac
done
