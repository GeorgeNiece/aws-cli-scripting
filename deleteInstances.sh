for region in `aws ec2 describe-regions --output text | cut -f4`
do
  echo "Terminating region $region..."
  aws ec2 describe-instances --region $region | \
    jq -r .Reservations[].Instances[].InstanceId | \
      xargs -L 1 -I {} aws ec2 modify-instance-attribute \
        --region $region \
        --no-disable-api-termination \
        --instance-id {}
  aws ec2 describe-instances --region $region | \
    jq -r .Reservations[].Instances[].InstanceId | \
      xargs -L 1 -I {} aws ec2 terminate-instances \
        --region $region \
        --instance-id {}
done
## don't know how to run this alongside the instance deletion" 
for cloud9envs in `aws cloud9 list-environments --output text | cut -f2`
do
    echo "Delete cloud9 environment $cloud9envs"
   aws cloud9 delete-environment --environment-id $cloud9envs
done
