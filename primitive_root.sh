#!/bin/bash -x
# Temp file for testing the primitive root function 
# + need to make an edit to the 'while' loop that checks to see if 'p' is prime 

prime_checker()
{
local isPrime=true
local p=$1
local x=$(echo "sqrt($p)" | bc)


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
        return 0
fi

if [  "$isPrime" = false ]
then
        return 1
fi
}

prime_checker 739


primitive_root_checker()
{
local isPrimitive=true

#the variables beneath me were local...
local g=$1 
local p=$2



        if prime_checker $p 
        then
                echo "Need a new number."
                #exit 0
        fi



limit=$(( (p-1)/2 ))

for (( i=1; i<=$limit; i++ ))
do
        if [ "$((g**i % p ))" == "1" ]
        then
                isPrimitive=false
        fi

done

if [ "$isPrimitive" = true ] 
then 
        echo "$1 is a primitive root of $2"
        return 0
fi

if [ "$isPrimitive" = false ]
then 
        echo "$1 is not a primitive root of $2"
        return 1
fi
}

primitive_root_checker 183 739