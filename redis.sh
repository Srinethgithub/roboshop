echo -e "\e[36m enable redis from package files \e[om"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
yum module list
yum module enable redis:remi-6.2 -y
echo -e "\e[36m .installing redis service \e[om"
yum install redis -y
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
echo -e "\e[36m .enable and restart redis server  \e[om"
systemctl enable redis
systemctl start redis
