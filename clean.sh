./disableCloudFront.sh
./deleteBuckets.sh
sleep 120 
./deleteCloudFormationStacks.sh
./deleteUsers.sh
./deleteGroups.sh
./deleteCloudFront.sh
./deleteDynamodbTables.sh
./deleteInstances.sh
./deleteEc2SecurityGroups.sh
./deleteEc2Snapshots.sh 
