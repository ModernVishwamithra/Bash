# script that can take username(s) as input and validate the username(should not start with number) if already exists or NOT
# if exists, show error message that username already exists other wise create a user with random password
# Once login, make password expire and promt user to create a new password.
#!/bin/bash
if [[ $# -gt 0 ]]; then
    USERS=$@
    echo "the user name(s) entered is ${USERS} and number of users is $#"
    for USER in ${USERS[@]}; do
    #if [[ $USER =~ ^[a-zA-Z]+$ ]];then # does not allow numbers in the text
    if [[ $USER =~ ^[a-zA-Z] ]];then #Allows starts with aplhabets and include numbers in between or last
        EXIST_USER=$(cat /etc/passwd | grep -i $USER | cut -d ":" -f 1)
        if [[ "$EXIST_USER" == "$USER" ]]; then
            echo "User $USER Already Exists! Try another username"
        else
            SPECIAL_CHAR=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
            PASSWORD=India@${RANDOM}${SPECIAL_CHAR}
            useradd -m $USER --shell /bin/bash
            echo "${USER}:${PASSWORD}" | sudo chpasswd
            passwd -e $USER
            echo "User $USER has been created successfully! and Your password is $PASSWORD"
            echo "${USER} ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
        fi
    else
    echo "Username should start with Alphabets Only"
    fi
    done
else
    echo "You have given $# parameters"
fi
