#!/bin/bash

token_file="token.txt"
filename=$1
timestamp=$(date +"%Y%m%d%H%M%S")
output_file="available_usernames_${timestamp}_${filename%.*}.txt"
line_count=$(wc -l < "$filename")

if [[ $line_count -gt 5000 ]]; then
    echo "Warning: The input file contains more than 5000 lines. Github API only allows for 5000 requests per hour."
    echo "Checking only up to line 5000."
fi

# Read the token from the token file
if [[ -r $token_file ]]; then
    token=$(cat "$token_file")
else
    echo "Error: Failed to read the token file '$token_file'. Make sure it exists and is readable."
    exit 1
fi

# Initialize the output file
> "$output_file"

head -n 5000 "$filename" | while read -r line; do
    response=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $token" "https://api.github.com/users/$line")
    if [[ $response -eq 404 ]]; then
        echo "$line is available"
        echo "$line" >> "$output_file"
    fi
done

echo "Available usernames saved in $output_file"
