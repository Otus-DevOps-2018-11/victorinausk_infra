#!/bin/bash

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Установка ruby..."
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
if  ruby -v; then
	echo "Ruby запущен!"
else 
	ehco "Ошибка инсталляции ruby!"
fi

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Установка mongodb..."
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable --now mongod
RES=$?
if [ $? -eq 0 ]; then
	echo "Mongo запущен!"
else
	echo "Ошибка инсталляции mongodb!"
fi

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Установка..."
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
x="$( ps ax | grep -v grep | grep puma | head -n 1 | awk '{print $5}' )"
if [ "$x" == "puma" ]; then
        echo "Puma запущен!"
else
        echo "Ошибка инсталляции puma!"
fi
