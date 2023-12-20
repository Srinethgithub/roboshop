echo -e "\e[36m downloding nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m installing nodejs service \e[0m"
yum install nodejs -y
echo -e "\e[36m adding user and path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m downloading the new content and their dependencies \e[0m"
curl -L -O https://roboshop-artifacts.s3.amazonaws.com/user.zip
unzip  user.zip
rm -rf user.zip
npm install
echo -e "\e[36m creating the user service file \e[0m"
cp root/roboshop/user.service  /etc/systemd/system/user.service
echo -e "\e[36m downloading and loading the mongodb schema \e[0m"
cp /root/roboshop/mongo.repo  /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/user.js
echo -e "\e[36m enabling and restarting the user service \e[0m"
systemctl daemon reload
systemctl enable user
systemctl start user


