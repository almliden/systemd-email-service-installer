#!/bin/bash

apt install msmtp
cp msmtprpc /etc/msmtprpc
cp systemd-email.sh /usr/local/bin/systemd-email.sh
cp status-email-user@.service /etc/systemd/system/status-email-user@.service
chmod +x /usr/local/bin/systemd-email.sh
