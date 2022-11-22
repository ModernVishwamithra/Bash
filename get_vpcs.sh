#!/bin/bash
REGION=$1
FORMAT=$2

aws ec2 decribe-vpcs --region $REGION --output $FORMAT