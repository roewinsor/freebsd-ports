#!/bin/sh
#
# $FreeBSD: ports/japanese/multiskkserv/files/multiskkserv.sh,v 1.2 2004/08/13 15:01:40 arved Exp $
#

# PROVIDE: multiskkserv
# REQUIRE: LOGIN

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
