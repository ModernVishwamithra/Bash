# Checks the given input is palindrome or not
#!/bin/bash
read -p "Please enter input" PALINDROME_INPUT
#PALINDROME_INPUT=pavan
if [[ ${#PALINDROME_INPUT} -gt 0 ]]; then
LENGTH=${#PALINDROME_INPUT}
for(( I=$LENGTH-1;I>=0;I--))
do
REVERSE=$REVERSE${PALINDROME_INPUT[@]:$I:1}
done
echo "Reverse of the given input is '$REVERSE'"
if [[ $REVERSE = $PALINDROME_INPUT ]]; then
echo "Hence given input '$PALINDROME_INPUT' is a Palindrome"
else
echo "Hence given input '$PALINDROME_INPUT' is a not Palindrome"
fi
else
echo "Seems Input is Empty..Please give valid input"
fi