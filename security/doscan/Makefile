# New ports collection makefile for:	doscan
# Date created:		24 Sept 2003
# Whom:			Janos.Mohacsi@bsd.hu
#
# $FreeBSD$
#

PORTNAME=	doscan
PORTVERSION=	0.3.1
PORTREVISION=	1
CATEGORIES=	security net
MASTER_SITES=	http://static.enyo.de/fw/releases/doscan/

MAINTAINER=	janos.mohacsi@bsd.hu
COMMENT=	Tool to quickly scan your network for machines listening on a TCP port

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
PORTDOCS=	README
MAN1=		doscan.1

PLIST_FILES=	bin/doscan

post-patch:
	${REINPLACE_CMD} -e 's|ony o|on yo|' \
	    ${WRKSRC}/doc/doscan.1

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
