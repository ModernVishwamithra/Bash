# script that can take username(s) as input and validate the username(should not start with number) if already exists or NOT
# if exists, show error message that username already exists other wise create a user with random password
# Once login, make password expire and promt user to create a new password.


USERS=$@ 
echo "the user name(s) entered is ${USERS} and number of users is $#"
if [[ $# -gt 0 ]]; then
for USER in ${USERS[@]}
do
EXIST_USER=$(cat /etc/passwd | grep -i $USER | cut -d ":" -f 1)
if [[ "$EXIST_USER" == "$USER" ]]; then
echo "User $USER Already Exists! Try another username"
else
SPECIAL_CHAR=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
PASSWORD=INDIA@${RANDOM}${SPECIAL_CHAR}
useradd -m $USER | sudo chpasswd 
passwd -e $USER
echo "User $USER has been created successfully! and Your password is $PASSWORD"
fi
done
else
echo "You have given $# parameters" 
fi