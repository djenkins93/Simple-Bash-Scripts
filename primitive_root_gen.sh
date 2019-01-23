#!/bin/bash
# The following program is a test env. for primitive root generation 
# + using code from 'prime_generator'.bash and 'primitive_root.bas'

prime_check()
{
isPrime=true
p=$1
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
        isPrime=false
fi
}

prim_root_check()
{
local isPrimitive=false
local validPrime=false

g=0
p=0


while [ "$validPrime" = false ]
do

        p=$(shuf -i 1-1000 -n 1)
        if prime_check $p && [ "$isPrime" = true ]
        then
                validPrime=true

        fi

done

echo "Random prime for 'p': $p"

limit=$(( (p-1)/2 ))

while [ "$isPrimitive" = false ]
do
        g=$(shuf -i 1-100 -n 1)
        for (( i=1; i<=$limit; i++ ))
                do
                if [ "$((g**i % p ))" != "1" ]
                then
                        isPrimitive=true
                fi

        done
done

echo "Random primitive root for 'p': $g "

if [ "$isPrimitive" = true ]
then
        isPrimitive=true
        echo "$g: is Primitive!"
fi

if [ "$isPrimitive" = false ]
then
        isPrimitive=false
fi
}

prim_root_check