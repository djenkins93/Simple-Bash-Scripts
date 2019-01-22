#!/bin/bash
# The following code is made to generate an lcd and gcd

echo "Enter the first number :"
read a
echo "Enter the second number : "
read b

if [ $a -gt $b ]
then
        num=$a
        den=$b
else
        num=$b
        den=$a
fi
r=$((num % den))

while [ $r -ne 0 ]
do
num=$den
den=$r
r=$(( num % den))
done

gcd=$den
lcm=$(( (a * b)/ gcd))

echo " The LCM of $a and $b is : $lcm"
echo " The GCD of $a and $b is : $gcd"