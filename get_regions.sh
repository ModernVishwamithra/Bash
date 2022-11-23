#WORKING WITH LISTS/ARRAYS
#1.TAKE LIST OF AWS REGIONS
#2.CHECK THE REGION IS VALID
#3.IF VALID,GET ITS VPC ID
#4.IF NOT , SHOW ERROR MESSAGE AS INVALID REGION
#() - this is array as it has indexes starts with 0

#ALL_REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
ALL_REGIONS=('us-east-1' 'us-east-2' 'us-west-1' 'us-west-2' 'ap-south-2')
REGIONS=($ALL_REGIONS)
for REGION in ${REGIONS[@]}
do 
ALL_VPC_IDS=$(aws ec2 describe-vpcs --region $REGION --output json | jq ".Vpcs[].VpcId" | tr -d '"')
VPC_ID_ARRAY=($ALL_VPC_IDS)
echo "$VVPC_ID_ARRAY[@]"
if [[ ${#VPC_ID_ARRAY[@]} -gt 0 ]]; then
for VPCID in ${VPC_ID_ARRAY}
do
echo "VPC id for this the region $REGION is $VPCID"
done
else
echo " $REGION is Invalid"
fi
done
