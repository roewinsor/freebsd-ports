#!/bin/sh
#
# $FreeBSD: ports/japanese/esecanna/files/esecanna.sh,v 1.4 2003/03/09 07:34:04 knu Exp $

esecannaserver="!!PREFIX!!/sbin/esecannaserver"
piddir="/var/run/esecanna"

case "$1" in
start)
	if [ -f !!PREFIX!!/vje30/.version ] \
	 && grep -qw 'FREE TRIAL VERSION' !!PREFIX!!/vje30/.version; then
	    echo ''
	    echo 'esecanna:'
	    echo '  Using VJE-Delta 3.0 trial, it is unable to connect to vjed on startup.'
	    echo '  Please execute $esecannaserver manually after once you run vje.'
	    exit 1
	fi

	if [ -x $esecannaserver ]; then
	    rm -f /tmp/.iroha_unix/IROHA
	    echo -n ' esecanna: '
	    cd $piddir
	    nohup $esecannaserver
	fi
	;;
stop)
	pidfile=$piddir/esecanna.pid
	if [ -f $pidfile ]; then
	    kill `cat $pidfile` && echo -n ' esecanna'
	    rm $pidfile
	else
	    echo ' esecanna: not running'
	fi
	;;
*)
	echo "Usage: `basename $0` {start|stop}" >&2
	exit 64
	;;
esac

exit 0
