#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <directory_or_file_to_archive"
	exit 1
fi

input=$1
timestamp=$(date +%G%m%e_%s)
archive_name="logs_archive_${timestamp}"

echo "Creating tar archive: ${archive_name}.tar"
tar -cvf "${archive_name}.tar" "$input"

if [ $? -eq 0 ]; then
	echo "Compressing the tar file with gzip"
	gzip "${archive_name}.tar"

	if [ $? -eq 0 ]; then
		echo "Compression successful: ${archive_name}.tar.gz"
	else
		echo "Failed to compress the file"
		exit 1
	fi
else
	echo "Failed to create tar archive"
	exit 1
fi

