for region in us-east-1 us-east-2 us-west-1 us-west-2
do
for stack in `aws --region $region cloudformation list-stacks --stack-status-filter CREATE_COMPLETE --output text | grep STACKSUMMARIES | cut -f4`
do 
   echo "Processing CloudFormation stack $stack"
  if [[ "$stack" != *"cloud9"* ]];
	then
		echo " Removing: aws cloudformation delete-stack --stack-name $stack"
		aws cloudformation delete-stack --region $region --stack-name $stack
   else
	echo "Not removing cloud9 $stack"
  fi
done
done
for region in us-east-1 us-east-2 us-west-1 us-west-2
do
for stack in `aws --region $region cloudformation list-stacks --stack-status-filter CREATE_COMPLETE --output text | grep STACKSUMMARIES | cut -f6`
do 
   echo "Processing CloudFormation stack $stack"
  if [[ "$stack" != *"cloud9"* ]];
	then
		echo " Removing: aws cloudformation delete-stack --stack-name $stack"
		aws cloudformation delete-stack --region $region --stack-name $stack
   else
	echo "Not removing cloud9 $stack"
  fi
done
done
