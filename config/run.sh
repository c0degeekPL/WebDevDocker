#!/bin/bash

echo "/bin/bash /run.sh" > /first_run.sh

chown root:root /etc/apache2/vhosts/*.conf
/usr/bin/supervisord -c /etc/webdev/supervisord.conf
