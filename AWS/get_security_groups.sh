function sg {
    for REGION in $@; do
    echo "********************************************************************"
    echo "**Getting Security Group Info in region $REGION**"
    echo "********************************************************************"
    aws ec2 describe-security-groups  --region $REGION | jq ".SecurityGroups[].GroupName"
    echo "---------------------------------------------"
    done
}

#sg $@

#----------------------------------------------
#Getting security groups with filters vpc-id


function get_security_groups_with_filters
{
    echo "********************************************************************"
    echo "**Getting Security Group Info in region $REGION**"
    echo "********************************************************************"
    aws ec2 describe-security-groups  --region $REGION | jq ".SecurityGroups[].GroupName"
    echo "---------------------------------------------"
}

function get_subnets_with_filters
{
    echo "Getting SUBNETS Info VPC $VPC..."
    echo "********************************************************************"
    echo $(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC" --region $REGION | jq ".Subnets[].SubnetId")
    echo  "********************************************************************"
    
}

get_vpc() {
#REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"');
for REGION in $(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"'); do
    # for REGION in ${REGIONS[@]}; do
    echo "Running The Functon To List VPCs in $REGION"
    vpc_list=$(aws ec2 describe-vpcs --region $REGION | jq .Vpcs[].VpcId | tr -d '"')
    for VPC in $(echo $vpc_list); do
        echo "The VPC ID for region $REGION IS:$VPC"
        get_subnets_with_filters $VPC
        echo "======================================="
        get_security_groups_with_filters $VPC
    done
    done
}

get_vpc