ALL_REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
REGIONS=($ALL_REGIONS)
for REGION in $(REGIONS[@])
do 
echo $REGION
done