#!/bin/sh

# PROVIDE asterisk
# REQUIRE: NETWORKING SERVERS
# BEFORE: DAEMON
# KEYWORD: FreeBSD shutdown

#
# Add the following lines to /etc/rc.conf to enable asterisk:
#
# asterisk_enable="YES"
#

. /etc/rc.subr

name=asterisk
rcvar=`set_rcvar`

command=/usr/local/sbin/asterisk
pidfile=/var/run/asterisk.pid

asterisk_enable=${asterisk_enable:-"NO"}

load_rc_config $name
run_rc_command "$1"
