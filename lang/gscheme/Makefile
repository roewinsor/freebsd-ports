# New ports collection makefile for:    gscheme
# Date created:         17 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD$
#

PORTNAME=	gscheme
PORTVERSION=	0.6
PORTREVISION=	1
CATEGORIES=	lang gnustep
MASTER_SITES=	http://www.gnustep.it/marko/GScheme/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	GScheme
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	repacked

MAINTAINER=	dinoex@FreeBSD.org
COMMENT=	GNUstep-aware scheme interpreter

LICENSE=	GPLv2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|setMark:|setMarkScheme:|' \
		${WRKSRC}/SchemeTypes.h ${WRKSRC}/SchemeTypes.m

post-install:
	${RM} -f ${GNUSTEP_PREFIX}/Local/Applications/GScheme.app/Resources/library.scm~

.include <bsd.port.mk>
