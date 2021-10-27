./disableCloudFront.sh
sleep 120 
./deleteBuckets.sh
./deleteCloudFormationStacks.sh
./deleteUsers.sh
./deleteGroups.sh
./deleteCloudFront.sh
./deleteDynamodbTables.sh
./deleteInstances.sh
