#!/bin/sh
sudo -u taler-exchange-httpd taler-exchange-dbinit
/usr/bin/taler-exchange-secmod-rsa -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-secmod-cs -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-secmod-eddsa -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-httpd -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-aggregator -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-closer -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-wirewatch -c /etc/taler/taler.conf -L INFO &
/usr/bin/taler-exchange-transfer -c /etc/taler/taler.conf -L INFO &
/bin/tail -f /dev/null
