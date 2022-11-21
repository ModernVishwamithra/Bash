#!/bin/bash
#https://www.hackerrank.com/challenges/bash-tutorials---the-world-of-numbers/problem?isFullScreen=true
read a
read b

echo "$[a+b]"
echo "$[a-b]"
echo "$[a*b]"
if (("${b}" != 0)) 
then
echo "$[a/b]"
echo "$((a%b))"
fi
echo "$((++a))" #Incerment before assign
echo "$((++b))" #Incerment before assign
echo "$a"
echo "$b"

echo "$((a++))" #assign before increment
echo "$((b++))" #assign before increment
echo "$a"
echo "$b"