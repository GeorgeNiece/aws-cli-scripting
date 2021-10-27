./disableCloudFront.sh
./deleteBuckets.sh
sleep 120 
./deleteCloudFormationStacks.sh
./deleteUsers.sh
./deleteGroups.sh
./deleteCloudFront.sh
./deleteDynamodbTables.sh
./deleteInstances.sh
