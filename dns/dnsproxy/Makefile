# New ports collection makefile for:	dnsproxy
# Date created:				14 January 2004
# Whom:					Clement Laforet <clement@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	dnsproxy
PORTVERSION=	1.16
CATEGORIES=	dns
MASTER_SITES=	http://www.wolfermann.org/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A proxy for DNS queries

BUILD_DEPENDS=	${LOCALBASE}/lib/libevent.so:${PORTSDIR}/devel/libevent

GNU_CONFIGURE=	yes

USE_RC_SUBR=	dnsproxy

MAN1=		dnsproxy.1
PLIST_FILES=	sbin/dnsproxy etc/${PORTNAME}/dnsproxy.conf.sample

SUB_FILES=	pkg-message
PLIST_DIRS=	%%ETCDIR%%

.include <bsd.port.pre.mk>

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/dnsproxy ${PREFIX}/sbin
	@${INSTALL_MAN} ${WRKSRC}/dnsproxy.1 ${MAN1PREFIX}/man/man1
	@${MKDIR} ${ETCDIR}
	@${INSTALL_DATA} -v ${WRKSRC}/dnsproxy.conf ${ETCDIR}/dnsproxy.conf.sample

post-install:
	${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
