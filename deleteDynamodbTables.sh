for region in us-east-1 us-east-2 us-west-1 us-west-2
do
  echo "Delete tables in region $region..."
  for table in `aws dynamodb list-tables --output text --region $region | cut -f2`
      do
	  echo "aws dynamodb delete-table --table-name $table --region $region"
	  aws dynamodb delete-table --table-name $table --region $region
      done
done
