#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
set -x
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
VOLUME_IDS=$(aws ec2 describe-volumes --region $REGION | jq ".Volumes[])
VOLUME_ARRAY=($VOLUME_IDS)
echo "volume Array is $VOLUME_ARRAY"

# for VOLUME in $(jq "VOLUMES); do
# echo "EBS volumes from region $REGION is $VOLUME"
# if [[ ${#VOLUMES} -gt 0 ]]; then
# echo "EBS volumes from region $REGION is $VOLUME"
# else
# echo "EBS volumes from region $REGION is not available"
# fi
#done
done