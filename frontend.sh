echo -e "\e[36m installing nginx service \eom"
yum install nginx -y
echo -e "\e[36m removing default server content \eom"
/usr/share/nginx/html/
rm -rf *
echo -e "\e[36m downloding custom server content \eom"
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
rm -rf fontend.zip
echo -e "\e[36m enabling and restarting the nginx service \eom"
systemctl enable nginx
systemctl restart nginx