# New ports collection makefile for:	tlswrap
# Date created:		25 July 2005
# Whom:			Daniel O'Connor <darius@dons.net.au>
#
# $FreeBSD$
#

PORTNAME=	tlswrap
PORTVERSION=	1.0.4
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://www.tlswrap.com/
DISTNAME=	${PORTNAME}-1.04

MAINTAINER=	johans@FreeBSD.org
COMMENT=	An FTP proxy that wraps data and control with TLS/SSL

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes

PLIST_FILES=	bin/tlswrap
PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} -E 's,^(CC|CFLAGS|LDFLAGS).*=,\1?=,g' \
		${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}/
.endif

.include <bsd.port.mk>
