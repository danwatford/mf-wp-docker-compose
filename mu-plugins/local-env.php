<?php

add_filter('pre_option_admin_email', 'override_admin_email');
function override_admin_email() {
    return getenv('WORDPRESS_ADMIN_EMAIL');
}

add_filter("option_woocommerce_stripe_settings", "forceStripTestModeFilter");
function forceStripTestModeFilter($options) {
    $options['testmode'] = 'yes';
    return $options;
}

add_filter("option_woocommerce_new_order_settings", "clearNewOrderRecipient");
function clearNewOrderRecipient($options) {
    $options['recipient'] = '';
    return $options;
}
