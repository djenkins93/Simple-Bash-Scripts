#!/bin/bash 
# This program will be modified to use in RSA, specificly the Eucledian Algorithim + Back Sub.
# + (^) a.k.a "Extended Eucledian Algorithm" 

echo "Enter two numbers with space in between..."

read a b
m=$a

if [ $b -lt $m ]
then 
        m=$b
fi

while [ $m -ne 0 ]
do 
        x=$(( $a % $m ))
        y=$(( $b % $m ))

        if [ $x -eq 0 -a $y -eq 0 ] 
        then 
                echo "GCD of $a and $b is $m"
        break
        fi

        m=$(( m - 1 ))
done