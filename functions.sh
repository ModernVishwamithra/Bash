
# Syntax1:
# function function_name
# {
# ###set of commands
# }

# Syntax2:
# function_name()
# {
# ####set of commands
# }

get_sum(){
    a=$1
    b=$2
SUM=$(expr $a + $b)
    echo "Sum of two numbers is = $SUM"
}

get_sum $1 $2