get_sum(){
    a=$1
    b=$2
SUM=$(expr $a + $b)
    echo "Sum of two numbers is = $SUM"
}

get_sum