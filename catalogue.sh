echo -e "\e[36m downloding nodejs repo \e[om"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m installing nodejs \e[om"
yum install nodejs -y
echo -e "\e[36m adding user and path \e[om"
mkdir roboshop/
mkdir /app
cd /app
echo -e "\e[36m downloading new app content and there dependencies \e[om"
curl -O https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip catalogue.zip
rm -rf catalogue.zip
npm install
echo -e "\e[36m creating catalogue service file \e[om"
cp /root/roboshop/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
echo -e "\e[36m downloading and loading the mongodb schema \e[om"
cp root/roboshop/mongodb.repos  /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.srineeth.tech </app/schema/catalogue.js
echo -e "\e[36m enabling and restaring the catalogue service \e[om"
systemctl enable catalogue
systemctl restart catalogue
