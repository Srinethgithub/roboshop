echo -e "\e[36m enable cart from package files \e[om"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m installing the nodejs service \e[om"
yum install nodejs -y
echo -e "\e[36m adding user and path \e[om"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m downloading their deficiencies \e[om"
curl -L -O https://roboshop-artifacts.s3.amazonaws.com/cart.zip
unzip cart.zip
fm -rf cart.zip
npm install
cp /root/roboshop/cart.service  /etc/systemd/system/cart.service
systemctl daemon reload
echo -e "\e[36m enabling and restarting the cart server \e[om"
systemctl enable cart
systemctl start cart