for region in us-east-1 us-east-2 us-west-1 us-west-2
do
for stack in `aws --region $region cloudformation list-stacks --output text | cut -f4`
do 
   echo "Processing CloudFormation stack $stack"
  if [[ "$stack" != *"cloud9"* ]];
	then
		echo " Removing $stack"
		aws cloudformation delete-stack --stack-name "${stack}"
   else
	echo "Not removing cloud9 $stack"
  fi
done
done
