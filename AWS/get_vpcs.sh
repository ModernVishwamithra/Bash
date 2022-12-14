#!/bin/bash
# REGION1="us-east-1"
FORMAT="json"
# echo "Getting the VPCs from region ${REGION1} in the output format in ${FORMAT}"
# aws ec2 describe-vpcs --region $REGION1 --output $FORMAT | jq ".Vpcs[].VpcId"
# echo "------------------------------------------"
# REGION2="us-east-2"
# echo "Getting the VPCs from region ${REGION2} in the output format in ${FORMAT}"
# aws ec2 describe-vpcs --region $REGION2 --output $FORMAT | jq ".Vpcs[].VpcId"
# echo "------------------------------------------"
# REGION3="us-west-1"
# echo "Getting the VPCs from region ${REGION3} in the output format in ${FORMAT}"
# aws ec2 describe-vpcs --region $REGION3 --output $FORMAT | jq ".Vpcs[].VpcId"
# echo "------------------------------------------"
# REGION4="us-west-2"
# echo "Getting the VPCs from region ${REGION4} in the output format in ${FORMAT}"
# aws ec2 describe-vpcs --region $REGION4 --output $FORMAT | jq ".Vpcs[].VpcId"

# "#@ operator- receives multiple inputs"
# COUNT=$#
# REGIONS=$@
# #set -x -e
# set -x #enable debugging
# if [[ "${COUNT}" -gt 0 ]]; then
#     for REGION in $REGIONS; do
#         echo "Getting the VPCs from region ${REGION} in the output format in ${FORMAT}"
#         aws ec2 describe-vpcs --region $REGION --output $FORMAT | jq ".Vpcs[].VpcId"
#     done
# else
#     echo "You have given ${COUNT} parameters in the input"
# fi

#uisng functions

get_vpc() {
    for REGION in $@; do
    echo "Running The Functon To List VPCs in $REGION"
    vpc_list=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId | tr -d '"')
    for vpc in $(echo $vpc_list); do
        echo "The VPC ID for region $REGION IS:$vpc"
        echo "======================================="
    done
    done
}

get_vpc $@
