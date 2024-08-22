#!/bin/bash
#GitHub: https://github.com/nathnp/Emergency-CTFd

# Function to install packages for Debian-based systems
install_debian() {
    sudo apt-get update
    sudo apt-get install -y docker.io docker-compose git
}

# Function to install packages for Fedora-based systems
install_fedora() {
    sudo dnf install -y docker docker-compose git
    sudo systemctl start docker
    sudo systemctl enable docker
}

# Function to install packages for openSUSE-based systems
install_opensuse() {
    sudo zypper refresh
    sudo zypper install -y docker docker-compose git
    sudo systemctl start docker
    sudo systemctl enable docker
}

# Determine the distribution and call the appropriate function
if [ -f /etc/debian_version ]; then
    install_debian
elif [ -f /etc/fedora-release ]; then
    install_fedora
elif [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" == "opensuse-leap" ] || [ "$ID" == "opensuse-tumbleweed" ]; then
        install_opensuse
    else
        echo "Unsupported openSUSE version."
        exit 1
    fi
else
    echo "Unsupported distribution."
    exit 1
fi

git clone https://github.com/CTFd/CTFd.git

cd CTFd

sudo docker-compose up -d

cd ~

echo "#!/bin/bash" >> CTFdStop.sh
echo "sudo docker container stop ctfd_db_1 ctfd_cache_1 ctfd_ctfd_1 ctfd_nginx_1" >> CTFdStop.sh

public_ip=$(curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g')

echo "#!/bin/bash" >> CTFdStart.sh
echo "sudo docker container start ctfd_db_1 ctfd_cache_1 ctfd_ctfd_1 ctfd_nginx_1" >> CTFdStart.sh
echo "echo 'http://$public_ip'" >> CTFdStart.sh

chmod +x CTFdStop.sh
chmod +x CTFdStart.sh

echo ""
echo "---------------------------------------"
echo "Your Emergency CFTd is available at"
echo "http://$public_ip"
echo ""
echo "To stop your CTFd run ./CFTdStop.sh"
echo "To restart your CTFd run ./CTFdStart.sh"
echo "---------------------------------------"