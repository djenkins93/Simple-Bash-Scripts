#!/bin/bash 
# The following is an eponential mod scrtipt  later to be used in diffe_hellman.sh script 
expmod()
{

g=$1 #this will make use of '$g' variable in the code
p=$2
n=$(( (p-1)/2 )) #limit for the incrementing value 'i'

local prod=1

for (( i=1; i<=$n; i++ ))
        do
                prod=$(( ((g*prod % p ) + p) % p ))
done
echo "$prod"
}

expmod 5 47
echo "result is equal to: $(expmod 5 47)"