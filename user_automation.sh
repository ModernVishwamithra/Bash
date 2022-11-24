# script that can take username(s) as input and validate the username(should not start with number) if already exists or NOT
# if exists, show error message that username already exists other wise create a user with random password
# Once login, make password expire and promt user to create a new password.

echo "Enter the user name"
user=$1 
if [[${#user} -gt 0]]; then
echo "User will be created"
else
echo "You have given ${#user}" 
fi