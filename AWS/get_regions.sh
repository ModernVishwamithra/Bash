#WORKING WITH LISTS/ARRAYS
#1.TAKE LIST OF AWS REGIONS
#2.CHECK THE REGION IS VALID
#3.IF VALID,GET ITS VPC ID
#4.IF NOT , SHOW ERROR MESSAGE AS INVALID REGION
#() - this is array as it has indexes starts with 0

# Redirectinal operators
# STDIN -0 - when we give inputs to the script or to a command it is caaled STDIN or using pipe | one command output goes to another command
# STDOUT-1 - when we give command and it gives us output this is STDOUT
# STDERR-2 - when wrong command entered it gives error this is STDERR
# #< - input 
# << - overwrite input
# > - Overwrites the output echo "Overwriting text" > sample.log -> it will overwrite the text to sample.log
# >> - append the output -append the output echo "Appending text" > sample.log -> it will append the text to sample.log
# 2> - write error message
# 2>&1 - write output and error message
#/dev/null -its like black hole, whatever we can write to this it vanishes
# tr - translate command used to change the characters like upper case,lower case, trim, repeat, replace etc.. tr --help to find out more
# tee - how T section for water pipes, similarly it used to print output in screen and as well as write to file
# echo "Appending text" | "tee -a sample.log -> it will append the text to sample.log
REGIONS=$(aws ec2 describe-regions | jq ".Regions[].RegionName" | tr -d '"')
#REGIONS=('us-east-1' 'us-east-2' 'us-west-1' 'us-west-2' 'ap-south-2')
#REGIONS=($REGIONS)
for REGION in ${REGIONS[@]}
do 
ALL_VPC_IDS=$(aws ec2 describe-vpcs --region $REGION --output json 2>/dev/null | jq ".Vpcs[].VpcId" | tr -d '"')
VPC_ID_ARRAY=($ALL_VPC_IDS)
echo "${VPC_ID_ARRAY[@]}"
if [[ ${#VPC_ID_ARRAY[@]} -gt 0 ]]; then
for VPCID in ${VPC_ID_ARRAY[@]}
do
echo "VPC id for this the region $REGION is $VPCID"
done
else
echo "REGION $REGION is Invalid"
fi
done
