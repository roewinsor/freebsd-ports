# New ports collection makefile for:	gprename
# Date created:				2004-03-15
# Whom:					trevor
#
#
# $FreeBSD$
#

PORTNAME=	gprename
PORTVERSION=	2.6.6
PORTEPOCH=	1
CATEGORIES=	x11-fm
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Perl script for renaming multiple files

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Gtk2.pm:${PORTSDIR}/x11-toolkits/p5-Gtk2 \
		${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_BZIP2=	yes
USE_PERL5_RUN=	yes
USE_GETTEXT=	yes
NO_BUILD=	yes

MAN1=		gprename.1

post-patch:
	@${REINPLACE_CMD} 's|/usr/|${PREFIX}/|' \
		${WRKSRC}/bin/gprename
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|; \
		s|$$(CURDIR)|$$(.CURDIR)|; \
		s|share/man|man|;' \
		${WRKSRC}/Makefile

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
