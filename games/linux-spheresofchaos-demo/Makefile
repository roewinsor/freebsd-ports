# New ports collection makefile for:   spheresofchaos-demo
# Date created:        31 January 2005
# Whom:                Peter Pentchev <roam@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	spheresofchaos
PORTVERSION=	2.06
PORTREVISION=	1
CATEGORIES=	games linux
MASTER_SITES=	http://people.FreeBSD.org/~roam/games/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	roam
PKGNAMEPREFIX=	linux-
PKGNAMESUFFIX=	-demo
DISTNAME=	chaosl-${PORTVERSION}

MAINTAINER=	roam@FreeBSD.org
COMMENT=	An unusual and spectacular shoot-em-up for the PC

USE_ZIP=	yes
USE_LINUX=	yes
USE_LINUX_APPS=	sdl12

NO_BUILD=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/Chaosl ${PREFIX}/bin
	${BRANDELF} -t Linux ${PREFIX}/bin/Chaosl

.include <bsd.port.mk>
