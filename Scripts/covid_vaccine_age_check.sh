#Covid Vaccine age check
echo "Welcome to covid vaccine age check"
read -p "Enter your name : " USERNAME
if [[ $USERNAME =~ ^[a-zA-Z] ]]; then
read -p "Enter the year of birth : " YOB
if [[ "${#YOB}" -eq 4 ]]; then
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
else
echo "Please enter valid Username starts with alphabets only"
fi
