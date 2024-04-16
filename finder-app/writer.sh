#!/bin/bash

# Accepts the following arguments: the first argument is a 
# full path to a file (including filename) on the filesystem, 
# referred to below as writefile; the second argument is a 
# text string which will be written within this file, referred to below as writestr

# Exits with value 1 error and print statements if 
# any of the arguments above were not specified

# Creates a new file with name and path writefile with content writestr, 
# overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.

# Example invocation:
#    writer.sh /tmp/aesd/assignment1/sample.txt ios

if [ $# -ne 2 ]; then
    echo "Error: Please provide two arguments"
    exit 1
fi

writefile=$1
writestr=$2

# extract filename
filename=$(basename $writefile)
# extract directory
directory=$(dirname $writefile)




if [ ! -d $directory ]; then
    mkdir -p $directory
fi

# if [ -f $writefile ]; then
#     rm $writefile
# fi

# if file not created then exit with error code 1
touch "$writefile"
echo "$writestr" > "$writefile"
if [ ! -f "$writefile" ]; then
    echo "Error: $writefile could not be created"
    exit 1
fi
