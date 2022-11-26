#!/bin/bash
# get_subnets(){
# for REGION in $@
# do
# SUBNET_IDS=$(aws ec2 describe-subnets --region $REGION | jq ".Subnets[].SubnetId" | tr -d '"')
# echo "Subnets for the region $REGION are"
# for SUBNET_ID in $(echo "$(aws ec2 describe-subnets --region $REGION --filters "Name=vpc-id,Values=$vpc" | jq ".Subnets[].SubnetId" | tr -d '"')"); do
# echo "$SUBNET_ID"
# done
# done
# }

#get_subnets $@

echo "---------------------------------------------------------"
#getting subnets using vpc-id filers
function get_subnets_with_filters
{
    echo "Getting SUBNETS Info VPC $VPC..."
    echo $(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC" --region $REGION | jq ".Subnets[].SubnetId")
    echo "---------------------------------------------"
}

get_vpc() {
    for REGION in $@; do
    echo "Running The Functon To List VPCs in $REGION"
    vpc_list=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId | tr -d '"')
    for VPC in $(echo $vpc_list); do
        echo "The VPC ID for region $REGION IS:$VPC"
        get_subnets_with_filters $VPC
        echo "======================================="
    done
    done
}

get_vpc $@