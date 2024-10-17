#!/bin/bash
/usr/local/bin/taler-exchange-dbinit &
/usr/local/bin/taler-exchange-secmod-rsa -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-secmod-cs -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-secmod-eddsa -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-httpd -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-aggregator -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-closer -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-wirewatch -c /etc/taler/taler.conf -L INFO &
/usr/local/bin/taler-exchange-transfer -c /etc/taler/taler.conf -L INFO &
tail -f /dev/null
