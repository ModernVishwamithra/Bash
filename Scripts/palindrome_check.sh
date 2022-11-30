# Checks the given input is palindrome or not
#!/bin/bash
while true; do
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
REVERSE=""
else
echo "Seems Input is Empty..Please give valid input"
fi

#------------------------------------------------------
# Checks the given inputs is palindrome or not
#!/bin/bash
# PALINDROME_INPUTS=(TEST INPUTS 5678 pavan linux tenet)
read -p "Please enter input(s)" PALINDROME_INPUTS
for PALINDROME_INPUT in ${PALINDROME_INPUTS[@]}
do
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
REVERSE=""
else
echo "Seems Input is Empty..Please give valid input"
fi
done
