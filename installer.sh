#!/bin/bash

apt install msmtp
cp msmtprc /etc/msmtprc
cp systemd-email.sh /usr/local/bin/systemd-email.sh
cp status-email-user@.service /etc/systemd/system/status-email-user@.service
chmod +x /usr/local/bin/systemd-email.sh