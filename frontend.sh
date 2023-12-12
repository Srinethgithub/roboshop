yum install nginx
rm -rf *
cd /usr/share/nginx/html
curl -O https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
unzip frontend.zip
systemctl enable nginx
systemctl restart nginx

