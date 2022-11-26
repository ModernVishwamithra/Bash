#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
set -x
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
VOLUME_IDS=$(aws ec2 describe-volumes --region $REGION | jq ".Volumes[]")
VOLUME_ARRAY=($VOLUME_IDS)
echo "volume Array is $VOLUME_ARRAY"
done