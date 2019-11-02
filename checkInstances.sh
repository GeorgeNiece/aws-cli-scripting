
for region in `aws ec2 describe-regions --output text | cut -f3`
do
   echo "Listing region $region..."
   aws ec2 describe-instances --region $region --output text
done
