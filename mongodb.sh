echo -e "\e[36m downloding mongodb repos \e[0m"
cp /root/roboshop/mongodb.repos  /etc/yum.repos.d/mongo.repo
echo -e "\e[36m instaling mongodb server \e[0m"
yum install mongodb-org -y
echo -e "\e[36m changing the listin addres \e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo -e "\e[36m enabling and restarting the mongodb server \e[0m"
systemctl enable mongod
systemctl restart mongod