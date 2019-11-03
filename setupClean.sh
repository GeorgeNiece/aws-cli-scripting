mkdir $HOME/bin
cd $HOME/bin
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 
mv jq-linux64 jq
chmod 755 jq
cd ~/environment/aws-cli-scripting 
chmod 755 *.sh
echo "add the following lines to the .bashrc with the access key generated for the root account for the specific account"
echo "export AWS_ACCESS_KEY_ID=AAKIAX5XFBYO5HMU6H2M4"
echo "export AWS_SECRET_ACCESS_KEY=VVteIuppUqsbaCJu3Q/p4Hj50VBjvgBVqKsYM0YmH"
vi ~/.bashrc
source ~/environmnent/aws-cli-scripting/listUsers.sh
source ~/environmnent/aws-cli-scripting/listInstances.sh

