# Email Notifications for systemd

Systemd-service to be called when another service throws an error.

## Install

1. Clone the project: `git clone https://github.com/almliden/systemd-email-service-installer.git`
2. `cd ./systemd-email-service-installer && chmod +x installer.sh`
3. Configure the `msmtprpc`, `status-email-user@.service` and `systemd-email.sh` as neccessary
4. `sudo ./installer.sh`
5. Add `OnFailure` to the services you want notifications from

## Pre-install Configuration (step 3)

Perform the steps below to prepare for installation.

### msmtprpc

Take a look at the `msmtprcp.example` file and fill in values in the `msmtprpc`-file as neccessary as this will be copied.

(To make git stop tracking that file: `git update-index --skip-worktree msmtprpc`, if you want to make changes and commit, `git update-index --no-skip-worktree msmtprpc` to start tracking the file again and `git ls-files -v|grep '^S'` to list all the files that are skipped.)

### status-email-user@.service

Modify the line `ExecStart` and change the arguments to the script to email-recipient and subject, for example:

`ExecStart=/usr/local/bin/systemd-email example@example.com ERROR %i`

Where `example@example.com` can be changed to the address this should send an email to, and `ERROR` will be the first word in the subject.

### systemd-email.sh

Change to the correct name of the email account that was specified in the `msmtprpc`-file in the call to `/usr/bin/msmtp`, for example:

`/usr/bin/msmtp -a nameoftheaccount $1`

This would use the account `nameoftheaccount` to send an email.

## Configure Services (step 5)

To enable emails from another service, add the following to the service-unit `OnFailure=status-email-user@%n.service`. That one is typically located in `/etc/systemd/system/<service-name>.service`.
