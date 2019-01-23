#!/bin/bash -x
#Purpose of this program is check for a prime integer

isPrime=true
echo -n "Beginning Prime value search..."
#read p
p=$(shuf -i 101-103 -n 1)
x=$(echo "sqrt($p)" | bc)


i=2
while [ $i -le $x ]
        do
        if [ "$(( p % i ))" == "0" ]
        then
                isPrime=false
        fi
        (( i++ ))
        done
if [  "$isPrime" = true ]
then 
echo "$p : is a prime #"
isPrime=true
fi 

if [  "$isPrime" = false ] 
then 
echo "$p: is not a prime #"
isPrime=false
fi 