## don't know how to run this alongside the instance deletion" 
for cloud9envs in `aws cloud9 list-environments --output text | cut -f2`
do 
    echo "Delete cloud9 environment $cloud9envs"
   for policies in `aws iam list-attached-group-policies --group-name $groups --output text | cut -f2`
      do
        echo "Detaching policy $policies from  $groups"
        aws iam detach-group-policy --group-name $groups --policy-arn $policies
      done
   echo "Removing $users from groups"
   aws iam delete-group --group-name $groups 
done
