#!/usr/bin/env bash

# as you can see I combined the SSL stuff from @AlexanderOMara 
# with enabling my own custom vhosts.conf 
# so I can edit that outside the container
apt-get update
apt-get install -y  --no-install-recommends ssl-cert
rm -r /var/lib/apt/lists/*

a2enmod ssl
a2dissite 000-default.conf
#a2ensite apache2-vhosts.conf
a2ensite default-ssl.conf

# Setup local config for wordpress
cat > /var/www/html/local-config.php <<EOF
<?php

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
EOF

# finally execute default command
docker-entrypoint.sh apache2-foreground
