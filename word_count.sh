#!/bin/bash

count=0 
for i in $(cat ~/.bashrc); do
        count=$((count+1))
        echo "Word $count ($i) contains $(echo -n $i | wc -c) characters" 
done