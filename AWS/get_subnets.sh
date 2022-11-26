#!/bin/bash
get_subnets(){
for REGION in $@
do
SUBNET_IDS=$(aws ec2 describe-subnets --region $REGION | jq ".Subnets[].SubnetId" | tr -d '"')
echo "Subnets for the region $REGION are"
for SUBNET_ID in {echo "$(aws ec2 describe-subnets --region $REGION | jq ".Subnets[].SubnetId" | tr -d '"')"}; do
echo "$SUBNET_ID"
done
done
}

get_subnets $@