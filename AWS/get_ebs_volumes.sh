#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
VOLUMES=$(aws ec2 describe-volumes --region $REGION)
echo "EBS volumes from region $REGION is $VOLUMES"
done