# New ports collection makefile for:	brainparty
# Date created:		04 Apr 2010
# Whom:			Dmitry Marakasov <amdmi3@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	brainparty
PORTVERSION=	0.5
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://www.tuxradar.com/files/brainparty/ \
		http://mirror.amdmi3.ru/distfiles/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	Family-friendly set of 36 puzzle games

USE_GMAKE=	yes
USE_SDL=	sdl mixer ttf gfx image
USE_GL=		gl glu
MAKE_JOBS_SAFE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

PORTDOCS=	CREDITS README

post-patch:
	@${REINPLACE_CMD} -e 's|Content/|${DATADIR}/|' ${WRKSRC}/*.cpp

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/Content/* ${DATADIR}/
.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
