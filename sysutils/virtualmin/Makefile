# New ports collection makefile for:	virtualmin
# Date created:		Fri Oct 24 20:51:00 CEST 2003
# Whom:			olgeni@FreeBSD.org
#
# $FreeBSD$
#

PORTNAME=	virtualmin
PORTVERSION=	3.89
CATEGORIES=	sysutils
MASTER_SITES=	http://download.webmin.com/download/virtualmin/
DISTNAME=	virtual-server-${PORTVERSION}.gpl
EXTRACT_SUFX=	.wbm.gz

MAINTAINER=	olgeni@FreeBSD.org
COMMENT=	A virtual hosting management system based on webmin

RUN_DEPENDS=	${LOCALBASE}/lib/webmin/webmin-init:${PORTSDIR}/sysutils/webmin

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/virtual-server

post-extract:
	@${FIND} ${WRKSRC} -name .xvpics | ${XARGS} ${RM} -r
	@${FIND} ${WRKSRC} -name "*.swp" | ${XARGS} ${RM}
	@${FIND} ${WRKSRC} -name "*.cgi" | ${XARGS} ${REINPLACE_CMD} -e "s@/usr/local/bin/perl@${PERL}@"
	@${FIND} ${WRKSRC} -name "*.cgi" | ${XARGS} ${CHMOD} 755
	@${FIND} ${WRKSRC} -name "*.bak" | ${XARGS} ${RM}
	@${FIND} ${WRKSRC} -type d -empty | ${XARGS} ${RMDIR}

do-install:
	@${MKDIR} ${PREFIX}/lib/webmin
	@${MKDIR} ${PREFIX}/etc/webmin/virtual-server
	@${CP} -r ${WRKSRC} ${PREFIX}/lib/webmin

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
