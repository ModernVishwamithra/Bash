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
USERNAME=$uname
read -p "Enter the year of birth" YOB
if [[ "${#YOB}" -gt 0 ]]; then
YEAR=$(date +%Y)
AGE=$[ "$YEAR" - "$YOB" ]
#AGE=$(expr $YEAR - $YOB)
echo "Your curent age is $AGE"
if [[ "$AGE" -ge 5 && "$AGE" -le 14 ]]; then
echo "Hi $USERNAME, You are eligible to take covaxin "
elif [[ "$AGE" -ge 15 && "$AGE" -le 60 ]]; then
echo "Hi $USERNAME, You are eligible to take covaxin and Covid sheild"
else
echo " Hi $USERNAME, Sorry that you are not eligible to take vaccine. please take care yourself!"
fi
else
echo "Please enter valid year of Birth"
fi