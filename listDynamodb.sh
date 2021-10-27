for region in `aws ec2 describe-regions --output text | cut -f4`
do
  echo "List DynamodDB tables in region $region..."
   aws dynamodb list-tables --region $region  --output text | cut -f2
done
