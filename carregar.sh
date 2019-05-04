#!/bin/bash
filename='doc1.json'
n=1
while read line; do
    # reading each line
    echo "Line No. $n"
    echo "$line" > file.json
    aws dynamodb batch-write-item --request-items file://file.json
    n=$((n+1))
    #para não estourar o WCU e RCU
    sleep 3
done < $filename