#!/bin/bash
set -e

mv /tmp/puma.service /etc/systemd/system/
systemctl enable puma.service
