# New ports collection makefile for:	kix-kmod
# Date created:				4 January 2003
# Whom:					Jonathan Belson <jon@witchspace.com>
#
# $FreeBSD$
#

PORTNAME=       kix
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=     graphics kld
MASTER_SITES=   http://homepage.ntlworld.com/jon.belson/files/kix-1.0.tar.gz \
	LOCAL/pgollucci
PKGNAMESUFFIX=	-kmod

MAINTAINER=	jon@witchspace.com
COMMENT=	A graphical screensaver kernel module

SYSDIR?=	${SRC_BASE}/sys
.if !exists(${SYSDIR}/dev/syscons/syscons.h)
IGNORE=		requires kernel source (in ${SYSDIR}) to build
.endif
MAKE_ENV+=	WERROR=
PLIST_FILES=	lib/kix_saver.ko
SUB_FILES=	pkg-message

do-install:
	${INSTALL_KLD} ${WRKSRC}/kix_saver.ko ${PREFIX}/lib

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
