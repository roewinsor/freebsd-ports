# New ports collection makefile for:	nosefart
# Date created:		11 October 2000
# Whom:			sethk
#
# $FreeBSD$
#

PORTNAME=	nosefart
PORTVERSION=	1.92f
PORTREVISION=	1
CATEGORIES=	audio emulators
MASTER_SITES=	SF/${PORTNAME}/OldFiles
DISTNAME=	${PORTNAME}-${PORTVERSION}-mls

MAINTAINER=	sethk@meowfishies.com
COMMENT=	A player for NES Sound Format (NSF)

USE_GMAKE=	yes

MAKE_ENV=	INSTALL="${INSTALL}" COPY="${COPY}" STRIP="${STRIP}"\
		BINGRP="${BINGRP}" BINMODE="${BINMODE}" BINOWN="${BINOWN}"
PLIST_FILES=	bin/nosefart

pre-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} clean)

.include    <bsd.port.mk>
