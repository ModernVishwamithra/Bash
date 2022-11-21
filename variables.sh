#!/bin/bash

x=5
echo "${x} is my lucky number" #varible enclosed in {}

y=7
z='$y' #variable enclosed in single quotes will be considered as string
echo "the value of z is ${z}"

b=15
c="$b" #variable enclosed in double quotes will be considered as value
echo "the value of c is ${c}"

#personalized echo -hackerrank
read name
echo "Welcome ${name}"

