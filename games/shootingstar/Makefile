# New ports collection makefile for:	shootingstar
# Date created:				20 Nov 2005
# Whom:					Dmitry Marakasov <amdmi3@amdmi3.ru>
#
# $FreeBSD$
#

PORTNAME=	shootingstar
PORTVERSION=	1.2.0
PORTREVISION=	7
CATEGORIES=	games
MASTER_SITES=	http://www.2ndpoint.fi/projektit.xml/shootingstar/files/ \
		http://mirror.amdmi3.ru/distfiles/

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	SDL/OpenGL top-down shooter

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GL=		gl
USE_SDL=	sdl mixer image

CONFIGURE_ENV=	SDL_CONFIG="${SDL_CONFIG}"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
