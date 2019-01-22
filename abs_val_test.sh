#!/bin/bash
#A and B to illustrate examples
A=-$RANDOM
B=${A#-}
echo " value of A (negative), B (absolute value) are $A and $B "
