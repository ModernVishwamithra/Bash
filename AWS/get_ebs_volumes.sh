#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
# set -x
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
if [[ $(aws ec2 describe-volumes --region $REGION | jq ".Volumes[].VolumeId") = "" ]]; then
echo "No EBS volumes are present in this Region $REGION "
else
VOLUME_IDS=$(aws ec2 describe-volumes --region $REGION | jq ".Volumes[].VolumeId" | tr -d '"')
for VOLUME_ID in ${VOLUME_IDS[@]}; do 
echo "volume(s) present in this region $REGION is(are) $VOLUME_ID"
done
fi
done