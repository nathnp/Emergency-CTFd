#!/bin/bash
#GitHub: https://github.com/nathnp/Emergency-CTFd

sudo apt update

sudo apt install -y git docker.io docker-compose

git clone https://github.com/CTFd/CTFd.git

cd CTFd

sudo docker-compose up -d

cd ~

echo "#!/bin/bash" >> CTFdStop.sh
echo "sudo docker container stop ctfd_db_1 ctfd_cache_1 ctfd_ctfd_1 ctfd_nginx_1" >> CTFdStop.sh

echo "#!/bin/bash" >> CTFdStart.sh
echo "sudo docker container start ctfd_db_1 ctfd_cache_1 ctfd_ctfd_1 ctfd_nginx_1" >> CTFdStart.sh

chmod +x CTFdStop.sh
chmod +x CTFdStart.sh

public_ip=$(curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g')

echo ""
echo "---------------------------------------"
echo "Your Emergency CFTd is available at"
echo "http://$public_ip"
echo ""
echo "To stop your CTFd run ./CFTdStop.sh"
echo "To restart your CTFd run ./CTFdStart.sh"
echo "---------------------------------------"