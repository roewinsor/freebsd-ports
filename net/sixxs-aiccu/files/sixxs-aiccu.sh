#!/bin/sh
#
# $FreeBSD: ports/net/sixxs-aiccu/files/sixxs-aiccu.sh,v 1.2 2005/04/17 14:59:47 novel Exp $
#

# PROVIDE: sixxs-aiccu
# REQUIRE: NETWORKING

#
# Add the following lines to /etc/rc.conf to enable sixxs-aiccu:
#
#sixxs_aiccu_enable="YES"
#

. %%RC_SUBR%%

name=sixxs_aiccu
rcvar=`set_rcvar`

command="%%PREFIX%%/sbin/sixxs-aiccu"
command_args=%%PREFIX%%/etc/aiccu.conf
start_cmd="%%PREFIX%%/sbin/sixxs-aiccu start $command_args"
stop_cmd="%%PREFIX%%/sbin/sixxs-aiccu stop $command_args"
required_files=%%PREFIX%%/etc/aiccu.conf

# set default
sixxs_aiccu_enable=${sixxs_aiccu_enable:-"NO"}

load_rc_config ${name}
run_rc_command "$1"
