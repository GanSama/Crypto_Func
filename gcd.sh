#!/bin/bash

# take input from user
read -p "Enter two integers:" a b

# set value
dividend=$a
divisor=$b
remainder=1

# begin Euclidean Algorithm 
until [ $remainder -eq 0 ]
do
	let "remainder=$dividend%$divisor"
	dividend=$divisor
	divisor=$remainder
done
 
echo "GCD of $a and $b = $dividend" 
	

