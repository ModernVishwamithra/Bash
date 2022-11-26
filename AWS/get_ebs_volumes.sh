#Script to get the ebs volumes based on the region and delete UNATTACHED volumes
#!/bin/bash
# set -x
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
for REGION in ${REGIONS[@]}; do 
if [[ $(aws ec2 describe-volumes --region $REGION | jq ".Volumes[].VolumeId") = "" ]]; then
echo "No EBS volumes are present in this Region $REGION "
else
VOLUME_IDS=$(aws ec2 describe-volumes --region $REGION | jq ".Volumes[].VolumeId" | tr -d '"')
#echo "There are ${VOLUME_IDS[@]} volumes are present in this region  $REGION "
for VOLUME_ID in ${VOLUME_IDS[@]}; do 
#echo "They are $VOLUME_ID"
if [[ $(aws ec2 describe-volumes \
    --region $REGION \
    --filters Name=status,Values=available Name=volume-id,Values=$VOLUME_ID | jq ".Volumes[].State" | tr -d '"') = "available" ]]; then
    echo "Deleting unattached volume $VOLUME_ID"
    echo "$(aws ec2 delete-volume --volume-id $VOLUME_ID)" #2>/dev/null
    echo "$VOLUME_ID Deleted Successfully"
    else
    echo "Cannot able to delete $VOLUME_ID"
    fi
done
VOLUME_ID_STATE=$(aws ec2 describe-volumes --region $REGION | jq ".Volumes[].State" | tr -d '"')
fi
done