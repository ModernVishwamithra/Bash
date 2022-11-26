
get_sum(){
    a=$1
    b=$2
SUM=$(expr $a + $b)
    echo "Sum of two numbers is = $SUM"
}

function get_sum
{
    a=$1
    b=$2
SUM=$(expr $a + $b)
    echo "Addition of two numbers is = $SUM"
}

get_sum $1 $2