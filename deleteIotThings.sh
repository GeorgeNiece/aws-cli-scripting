for region in us-east-1 us-east-2 us-west-1 us-west-2
do
  echo "Delete IoT things in region $region..."
  for thing in `aws iot list-things --output text --region $region | grep THINGS | cut -f3`
      do
	  echo "aws iot delete-thing --thing-name $thing --region $region"
	  aws iot delete-thing --thing-name $thing --region $region
      done
done
