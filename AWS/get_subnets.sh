#!/bin/bash
get_subnets(){
for REGION in $@
do
echo "$(aws ec2 describe-subnets --region $REGION)"
done
}

get_subnets $@