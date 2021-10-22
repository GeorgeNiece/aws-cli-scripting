mkdir $HOME/bin
cd $HOME/bin
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 
mv jq-linux64 jq
chmod 755 jq
cd ~/environment/aws-cli-scripting 
chmod 755 *.sh
echo "add the following lines to the .bashrc with the access key generated for the root account for the specific account"
echo "#export AWS_ACCESS_KEY_ID=" >> ~/.bashrc
echo "#export AWS_SECRET_ACCESS_KEY=" >> ~/.bashrc
echo "git config --global user.name 'George Niece' " >>  ~/.bashrc
echo "git config --global user.email george.niece@gmail.com" >>  ~/.bashrc
echo "set -o vi" >>  ~/.bashrc
vi ~/.bashrc
.  ~/.bashrc
~/environment/aws-cli-scripting/listUsers.sh
~/environment/aws-cli-scripting/listInstances.sh

