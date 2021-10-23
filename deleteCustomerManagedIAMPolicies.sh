for policies in `aws iam list-policies --scope Local --output text | cut -f2`
do 
   echo "Removing policy $policies"
   aws iam delete-policy --policy-arn $policies
done
