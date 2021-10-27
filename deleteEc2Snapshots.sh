for region in  us-east-1 us-west-1 us-east-2 us-west-2
do
  echo "List EC2 Snapshots in region $region..."
   for snapshot in `aws ec2 describe-snapshots --owner-ids self --output text --region $region | cut -f6`
   do
	aws ec2 delete-snapshot --snapshot-id $snapshot
   done 
done
