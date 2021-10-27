for region in  us-east-1 us-west-1 us-east-2 us-west-2
do
  echo "List EC2 Snapshots in region $region..."
   aws ec2 describe-snapshots --owner-ids self --region $region --output text
done
