#!/bin/sh
#
# $FreeBSD: ports/japanese/multiskkserv/files/multiskkserv.sh,v 1.1 2004/01/08 02:17:34 edwin Exp $
#

# PROVIDE: multiskkserv
# REQUIRE: LOGIN
# KEYWORD: FreeBSD

#
# Add the following lines to /etc/rc.conf to enable multiskkserv:
#
#multiskkserv_enable="YES"
#
# See `%%PREFIX%%/sbin/multiskkserv -h` for flags
#

. %%RC_SUBR%%

name=multiskkserv
rcvar=`set_rcvar`

command=%%PREFIX%%/sbin/multiskkserv

# set defaults

multiskkserv_enable=${multiskkserv_enable:-"NO"}
multiskkserv_flags=${multiskkserv_flags:-"%%PREFIX%%/%%SKKDIR%%/SKK-JISYO.%%SKKJISYO_TYPE%%.cdb &"}

load_rc_config ${name}
run_rc_command "$1"
