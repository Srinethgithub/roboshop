echo -e "\e[36m installing maven service \e[om"
yum install maven -y
echo -e "\e[36m adding the user and path \e[om"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m downloading the new app content and their dependencies \e[om"
curl -L -O https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
unzip shipping.zip
fm -rf shipping .zip
echo -e "\e[36m downloading the dependencies \e[om"
mvn clean package
mv target/shipping-1.0.jar shipping.jar
cp /root/roboshop/shipping.service  /etc/systemd/system/shipping.service
echo -e "\e[36m installing mysql service \e[om"
yum install mysql -y
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql
echo -e "\e[36m enable start and restarting the shipping service \e[om"
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
systemctl restart shipping