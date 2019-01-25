#!/bin/bash
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
x="$( ps ax | grep -v grep | grep puma | head -n 1 | awk '{print $5}' )"
if [ "$x" == "puma" ]; then
        echo "Puma запущен!"
else
        echo "Ошибка инсталляции puma!"
fi
