#!/bin/sh
#
# $FreeBSD: ports/security/clamav-devel/files/clamav-clamd.sh,v 1.6 2005/01/12 18:22:56 yar Exp $
#

# PROVIDE: clamd
# REQUIRE: LOGIN
# BEFORE: mail
# KEYWORD: shutdown

#
# Add the following lines to /etc/rc.conf to enable clamd:
#
#clamav_clamd_enable="YES"
#
# See clamd(8) for flags
#

. %%RC_SUBR%%

name=clamav_clamd
rcvar=`set_rcvar`

command=%%PREFIX%%/sbin/clamd
pidfile=%%RUNDIR%%/clamd.pid
required_dirs=%%DBDIR%%
required_files=%%PREFIX%%/etc/clamd.conf

# read settings, set default values
load_rc_config "$name"
: ${clamav_clamd_enable="NO"}
: ${clamav_clamd_flags=""}
: ${clamav_clamd_socket="%%CLAMAV_CLAMD_SOCKET%%"}

run_rc_command "$1"
