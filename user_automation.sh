# script that can take username(s) as input and validate the username(should not start with number) if already exists or NOT
# if exists, show error message that username already exists other wise create a user with random password
# Once login, make password expire and promt user to create a new password.


user=$@ 
echo "the user name(s) entered is ${user} and number of users is $#"
if [[ $# -gt 0 ]]; then
echo "User will be created"
else
echo "You have given $# parameters" 
fi