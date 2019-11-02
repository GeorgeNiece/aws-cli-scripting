for users in `aws iam list-users  --output text | cut -f7`
do 
   echo "Removing user $users"
done
