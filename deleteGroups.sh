for groups in `aws iam list-groups --output text | cut -f5`
do 
    echo "Detaching managed policies from group $groups"
   for policies in `aws iam list-attached-group-policies --group-name $groups --output text | cut -f2`
      do
        echo "Detaching policy $policies from  $groups"
        aws iam detach-group-policy --group-name $groups --policy-arn $policies
      done
    echo "Detaching inline policies from group $groups"
   for policies in `aws iam list-group-policies --group-name $groups --output text | cut -f2`
      do
        echo "Detaching policy $policies from  $groups"
        aws iam delete-group-policy --group-name $groups --policy-name $policies
      done
   echo "Removing $groups from groups"
   aws iam delete-group --group-name $groups 
done
