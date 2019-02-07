#!/bin/bash
set -e
export LC_ALL=C
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/" /etc/mongod.conf
sudo service mongod restart