for roles in `aws iam list-roles --output text  | grep ROLES | cut -f8`
do 
   echo "Removing role $roles"

   if [[ "$roles" != "AWS"* ]];
   then
		       	 aws iam delete-role --role-name $roles
    else 
		       	 echo "not removing AWS default policy" 
  fi
done
