#!/bin/bash -x
# The following program should take random inputs for both 'g' and 'p' 
# + it should then provide both a primitive root and prime integer which will be generated 

echo -n "Initiating primitive root ..."


prime_checker()
{
local isPrime=true
a=$1
x=$(echo "sqrt($a)" | bc)


i=2
while [ $i -le $x ]
        do
        if [ "$(( a % i ))" == 0 ]
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

random_prime()
{

local validPrime=false 
while [ "$validPrime" = false ]
do

        p=$(shuf -i 2-100 -n 1)
        if prime_checker $p
        then
                validPrime=true
        fi

done

if [ "$validPrime" = true ]
then 
        return 0
fi
}

random_prime 
echo "Prime p: $p...has been identified"


primitive_root_checker()
{
m=$((p-1))
local isPrimitive=true
local g=$(shuf -i 1-$m -n 1)

limit=$(( (p-1)/2 ))

for (( i=1; i<=$limit; i++ ))
do
        if [ "$((g**i % p ))" == 1 ]
        then
                isPrimitive=false
        fi

done

if [ "$isPrimitive" = true ] 
then 
        #echo "$g :(g),is a primitive root of $p!"
        return 0
fi

if [ "$isPrimitive" = false ]
then 
        #echo "$g :(g), is NOT a primitive root of $p!"
        return 1
fi
}


primitive_root_checker $g 

random_primitive()
{

m=$((p-1))
local validPrimitive=false
while [ "$validPrimitive" = false ]
do

        g=$(shuf -i 1-$m -n 1)
        if primitive_root_checker $g
        then
                validPrimitive=true
        fi

done

if [ "$validPrimitive" = true ]
then
        return 0
fi
}


random_primitive
echo "$g : (g) is a primitive root of $p : (p)" 