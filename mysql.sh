echo -e "\e[36m disabling the mysql service \e[om"
yum module disable mysql -y
cp /root/roboshop/mysql.repo  cp /etc/yum.repos.d/mysql.repo
echo -e "\e[36m installing the mysql service \e[om"
yum install mysql-comunity-server -y
echo -e "\e[36m change the default root password \e[om"
mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[36m check the new password \e[om"
mysql -uroot -pRoboShop@1
echo -e "\e[36m enabling and restarting the mysql servivce \e[om"
systemctl enable mysql
ststemctl start mysql