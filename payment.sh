echo -e "\e[36m installing the python6 server \e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e[36m adding user and path \e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m downloding custom service content \e[0m"
curl -L -O https://roboshop-artifacts.s3.amazonaws.com/payment.zip
unzip payment.zip
rm -rf payment.zip
echo -e "\e[36m downloding their dependencies \e[0m"
pip3.6 install -r requirements.txt
systemcl daemon reload
echo -e "\e[36m enabling and restarting the payment server \e[om"
systemctl enable payment
ststemctl start payment


