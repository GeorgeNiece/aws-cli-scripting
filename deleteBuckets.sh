for bucket in `aws s3 ls | awk '{print $3}' `
do 
   echo "Removing bucket $bucket"
   aws s3 rb "s3://${bucket}" --force
done
