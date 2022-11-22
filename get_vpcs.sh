#!/bin/bash
REGION=$1
FORMAT=$2

aws ec2 describe-vpcs --region $REGION --output $FORMAT | jq ".Vpcs[].VpcId"