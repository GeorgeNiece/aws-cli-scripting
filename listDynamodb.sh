for region in `aws ec2 describe-regions --output text | cut -f4`
do
  echo "Delete tables in region $region..."
   aws dynamodb list-tables --region $region  | cut -f2
done
