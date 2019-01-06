#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
if  ruby -v; then
	echo "Ruby запущен!"
else 
	ehco "Ошибка инсталляции ruby!"
fi
