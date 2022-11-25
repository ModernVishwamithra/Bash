#!/bin/bash

# if condition then
#     statement 1
#     statement 2
# fi
#----------------------
# if condition then
#     statement 1
#     statement 2
# else
#     statement 3
# fi    
# #----------------------
# if condition then
#     statement 1
#     statement 2
# elif condition then
#     statement 3
# else
#     statement 4
# fi
#---------------------------------------------------
# echo -n "Enter a number"
# read var
# if [[ $var -gt 10 ]]
# then
#   echo "The variable is greater than 10."
# else
#   echo "The variable is equal or less than 10."
# fi

#---------------------------------------------------
#Covid Vaccine age check
echo "Welcome to covid vaccine age check"
read -p "Enter the year of birth" YOB
if [[ $# -gt 0 ]]; then
YEAR=$(date +%Y)
AGE=$[ "$YEAR" - "$YOB" ]
echo "Your curent age is $AGE"
else
echo "Please enter year of Birth"
fi
