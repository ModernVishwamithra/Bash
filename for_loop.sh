#!/bin/bash

for i in {1..50} #https://www.hackerrank.com/challenges/bash-tutorials---looping-with-numbers/problem
do
echo "This is for loop and its looping ${i} times"
done
echo "####################"
for i in {0..-5}
do
echo "This is for loop and its looping ${i} times"
done
echo "####################"
for i in {-7..2}
do
echo "This is for loop and its looping ${i} times"
done
echo "####################"
for i in 1 2 3 4 5
do 
echo "This loop is iterating ${i} times"
done
echo "-------------------------------------------------"
#Bash v4.0+ has inbuilt support for setting up a step value using {START..END..INCREMENT} syntax
echo "Bash version = ${BASH_VERSION}"
for i in {1..100..2} # increment by 2 -https://www.hackerrank.com/challenges/bash-tutorials---looping-and-skipping?isFullScreen=true
do
echo "This loop is running ${i} times"
done

# Three expression for-loop like c program
for ((i=0;i<5;i++))
do 
echo "C-style loop is running ${i} times"
done
# Check this output
for ((i=0;i<5;i--))
do 
echo "C-style loop is running ${i} times"
done
# A pure infinite loop
for ((;;))
do 
echo "I am infinite loop"
done

