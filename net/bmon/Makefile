# New ports collection makefile for:	bmon
# Date created:			21 Feb 2003
# Whom:				Jon Nistor <nistor@snickers.org>
#
# $FreeBSD$
#

PORTNAME=	bmon
PORTVERSION=	2.1.0
PORTREVISION=	3
CATEGORIES=	net
MASTER_SITES=	http://people.suug.ch/~tgr/bmon/files/

MAINTAINER=	nistor@snickers.org
COMMENT=	Portable bandwidth monitor and rate estimator

OPTIONS=	RRDTOOL "Enable RRD support" Off \
		DBI	"Enable DBI support" On

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	YES
CONFIGURE_ARGS=	--disable-asound
USE_GMAKE=	YES
MAKEFILE=	GNUmakefile

MAN1=		bmon.1
PLIST_FILES=	sbin/bmon

.include <bsd.port.pre.mk>

.if defined(WITH_RRDTOOL)
BUILD_DEPENDS=	rrdtool:${PORTSDIR}/databases/rrdtool
.else
CONFIGURE_ARGS+=--disable-rrd
.endif

.if defined(WITH_DBI)
LIB_DEPENDS=	dbi.1:${PORTSDIR}/databases/libdbi
.else
CONFIGURE_ARGS+=--disable-dbi
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/bmon ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/man/bmon.1 ${PREFIX}/man/man1/bmon.1

.include <bsd.port.post.mk>
