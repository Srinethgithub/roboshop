echo -e "\e[36m installing nginx service \e[om"
yum install nginx -y
echo -e "\e[36m removing default server content \e[om"
cd /usr/share/nginx/html/
rm -rf *
echo -e "\e[36m downloding custom server content \e[om"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
rm -rf fontend.zip
cp /root/roboshop/roboshop.conf  /etc/nginx/default.d/roboshop.conf
echo -e "\e[36m enabling and restarting the nginx service \e[om"
systemctl enable nginx
systemctl restart nginx