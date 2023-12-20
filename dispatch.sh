echo -e "\e[36m installing the golang service \e[om"
yum install golang -y
echo -e "\e[36m adding user and path \e[om"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[36m downloading custom service content \e[om"
curl -L -O https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
unzip dispatch.zip
rm -rf dispatch.zip
echo -e "\e[36m downloading their dependencies \e[om"
go mod init dispatch
go get
go build
echo -e "\e[36m creating dispatch service file \e[0m"
cp /root/roboshop/dispatch.service /etc/systemd/systemctl/dispatch.service
systemctl daemon reload
echo -e "\e[36m enabling and restarting the dispatch server \e[om"
systemtl enable dispatch
systemctl start dispatch
