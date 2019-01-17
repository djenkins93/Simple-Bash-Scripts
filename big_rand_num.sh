#!/bin/bash 
# The following piece of code used for creating a large random number in bash 
# + this will be later used for random "prime_generator" 
# + which "prime_generator" should be a combo of "large_rand_numb" & "prime_checker"

x=$(shuf -i 1000000-10000000 -n 1)
p="$((2*($x) + 1))"

echo " This is your large #: $p " 