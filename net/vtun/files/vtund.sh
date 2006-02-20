#!/bin/sh
#
# $FreeBSD: ports/net/vtun/files/vtund.sh,v 1.1 2004/08/26 09:18:58 kuriyama Exp $
#
# PROVIDE: vtund
# REQUIRE: DAEMON
#
# Add the following line to /etc/rc.conf to enable vtund:
#
# vtund_enable="YES"
#

vtund_enable=${vtund_enable:-"NO"}
vtund_flags=${vtund_flags:-"-s"}

. %%RC_SUBR%%

name=vtund
rcvar=`set_rcvar`
required_files="%%PREFIX%%/etc/vtund.conf"

command=%%PREFIX%%/sbin/vtund

load_rc_config $name
run_rc_command "$1"
