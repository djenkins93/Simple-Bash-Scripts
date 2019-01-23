#!/bin/bash 
# The following script is used to generate a prime number for diffie-helman exchange
# + this will be combination of "large_random_number"&"prime_checker" 


echo -n "Beginning  prime search..."

function prime_checker()
{
a=$1
x=$(echo "sqrt($a)" | bc)
isPrime=true

i=2
while [ $i -le $x ]
do
        if [ "$((a % i ))" == "0" ]
        then
                isPrime=false
        fi
        (( i++ ))
done

if [  "$isPrime" = true ]
then 

        isPrime=true
        return 0
fi 

if [ "$isPrime" = false ] 
then 
        isPrime=false
        return 1
fi

}


random_prime()
{

local validPrime=false 
while [ "$validPrime" = false ]
do

        y=$(shuf -i 10-100 -n 1)
        if prime_checker $y
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
echo "Prime-key: $y, has been found"