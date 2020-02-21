for stack in `aws cloudformation list-stacks --output text | cut -f5`
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
