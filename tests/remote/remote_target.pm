# SUSE's openQA tests
#
# Copyright © 2016-2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: Controller/master for remote installations
# Tags: poo#9576
# Maintainer: Martin Loviska <mloviska@suse.com>

use base "opensusebasetest";
use strict;
use testapi;
use lockapi;
use mmapi;
use mm_network;

# poo#9576
sub run {
    assert_screen("remote_slave_ready", 350);
    mutex_create("ssh_server_is_available");
    # wait while whole installation process finishes
    assert_screen("grub2", 1200);
}

sub test_flags {
    return {fatal => 1};
}
1;

# vim: set sw=4 et:
