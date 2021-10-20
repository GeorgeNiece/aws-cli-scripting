for distribution in `aws cloudfront list-distributions --output text |  grep arn:aws:cloudfront | cut -f7`
do 
   echo "Processing CloudFront distribution $distribution"
  if [[ "$stack" != *"cloud9"* ]];
	then
		echo " Disabling: cloudfront --id $distribution"
		tmpfile=$(mktemp /tmp/ms-infra-destroy.XXXXXX)
		tmpfile2=$(mktemp /tmp/ms-infra-destroy.XXXXXX)
		# Update JSON output by setting Enabled=False
		aws cloudfront get-distribution-config --id $distribution | jq .DistributionConfig.Enabled=false > $tmpfile
		# We only need "DistributionConfig"
		jq -r .DistributionConfig $tmpfile > $tmpfile2
		echo "aws cloudfront update-distribution --id $distribution --if-match $(jq .ETag $tmpfile -r) --distribution-config file://$tmpfile2"
		aws cloudfront update-distribution --id $distribution \
			  --if-match $(jq .ETag $tmpfile -r) \
			    --distribution-config file://$tmpfile2
		rm $tmpfile $tmpfile2
   else
	echo "Not removing cloud9 $stack"
  fi
done
