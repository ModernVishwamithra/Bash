#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
echo "Region is $REGION"
done