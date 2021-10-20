for distribution in `aws cloudfront list-distributions --output text |  grep arn:aws:cloudfront | cut -f7`
do 
   echo "Processing CloudFront distribution $distribution"
  if [[ "$stack" != *"cloud9"* ]];
	then
		echo " Removing: aws cloudfront delete-distribution --id $distribution --if-match $(aws cloudfront get-distribution-config --id $distribution | jq .ETag -r)"
		aws cloudfront delete-distribution  --id $distribution --if-match $(aws cloudfront get-distribution-config --id $distribution | jq .ETag -r)
   else
	echo "Not removing cloud9 $stack"
  fi
done
