for stack in `aws cloudformation list-stacks --output text | cut -f5`
do 
   echo "Removing CloudFormation stack $stack"
   aws cloudformation delete-stack --stack-name "${stack}"
done
