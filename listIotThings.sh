for region in  us-east-1 us-west-1 us-east-2 us-west-2
do
  echo "List IoT Things in region $region..."
   aws iot list-things --region $region  
done
