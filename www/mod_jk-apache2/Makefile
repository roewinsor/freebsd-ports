# New ports collection makefile for:	mod_jk
# Date created:				Thu Apr 10 15:14:37 EDT 2003
# Whom:					Larry Lansing <lansil@fuzzynerd.com>
#
# $FreeBSD$
#

MASTERDIR=	${.CURDIR}/../mod_jk
USE_APACHE=	20+
PORTREVISION=	2
PORTEPOCH=	0
LATEST_LINK=	mod_jk-ap2

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Apache2 JK module for connecting to Tomcat using AJP1X

MAKE_JOBS_SAFE=  yes

CFLAGS+=	-I${LOCALBASE}/include

.include "${MASTERDIR}/Makefile"
