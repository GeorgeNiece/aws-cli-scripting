for users in `aws iam list-groups --output text | cut -f2`
do 
   echo "Removing $users from groups"
   for groups in `aws iam list-groups-for-user --user-name $users --output text | cut -f5`
      do
        echo "Removing $users from group $groups"
	aws iam remove-user-from-group --group-name $groups --user-name $users
      done
   echo "Detaching all policies from user $users"
   for policies in `aws iam list-attached-user-policies --user-name $users --output text | cut -f2`
      do
        echo "Detaching policy $policies from  $users "
        aws iam detach-user-policy --user-name $users --policy-arn $policies
      done
   echo "Deleting all access keys from user $users "
   for access_keys in `aws iam list-access-keys --user-name $users --output text | cut -f2`
      do
        echo "Deleting access key $access_keys for  $users "
        aws iam delete-access-key --user-name $users --access-key-id $access_keys
      done
   echo "Removing login profile for $users"
   aws iam delete-login-profile --user-name $users 
   echo "Removing user $users"
   aws iam delete-user --user-name $users
done
