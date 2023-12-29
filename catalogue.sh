echo -e "\e[36m downloding nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_19.x|sudo -E bash
echo -e "\e[31m installing nodejs \e[0m"
yum install nodejs -y
echo -e "\e[36m adding user and path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m downloading new app content and there dependencies \e[0m"
curl -O  https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip catalogue.zip
rm -rf catalogue.zip
npm install
echo -e "\e[36m creating catalogue service file \e[0m"
cp /root/roboshop/catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[36m downloading and loading the mongodb schema \e[0m"
cp /root/roboshop/mongodb.repos  /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.srineeth.tech </app/schema/catalogue.js
echo -e "\e[36m enabling and restaring the catalogue service \e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

