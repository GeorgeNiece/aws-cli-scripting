for sg in `aws ec2 describe-security-groups --output text | grep SECURITYGROUPS | cut -f4`
do 
 if [[ "$sg" != "default" ]];
	then
		for sg2 in `aws ec2 describe-security-groups --group-names $sg --output text | grep SECURITYGROUPS | cut -f3`
		do 
       		  echo "aws ec2 delete-security-group --group-id $sg2"
       		  aws ec2 delete-security-group --group-id $sg2
		done
 fi
done
