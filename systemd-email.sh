#!/bin/sh

/usr/bin/msmtp -a exampleaccount $1  <<ERRMAIL
To: $1
From: systemd <$USER@$HOSTNAME>
Subject: $2 service $3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

$(systemctl status --full "$3")
ERRMAIL
