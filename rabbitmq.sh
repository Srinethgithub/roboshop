echo -e "\e[36m configure yum repos from the vendor \e[om"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
yum install rabbitmq-server -y
echo -e "\e[36m adding user and path \e[0m"
rabbitmqctladd_userroboshop roboshop123
rabbitmqctlset_permissions -p / roboshop".*"".*"".*"
echo -e "\e[36m enabling and restarting the rabbitmq server \e[om"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server