#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
VOLUMES=$(aws ec2 describe-volumes --region $REGION)
echo "volume count ${#VOLUMES}"
if[[ ${#VOLUMES} -gt 0 ]]; then
echo "EBS volumes from region $REGION is $VOLUMES"
else
echo "EBS volumes from region $REGION is not available"
fi
done