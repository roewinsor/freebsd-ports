# New ports collection makefile for:    tileworld
# Date created:         08. Oct 02
# Whom:                 sec@42.org
#
# $FreeBSD$
#

PORTNAME=	tileworld
PORTVERSION=	1.3.0
PORTREVISION=	3
CATEGORIES=	games
MASTER_SITES=	http://www.muppetlabs.com/~breadbox/pub/software/tworld/
DISTNAME=	tworld-${PORTVERSION}

MAINTAINER=	sec@42.org
COMMENT=	An emulation of the game "Chip's Challenge"

USE_SDL=	sdl
GNU_CONFIGURE=	YES
USE_GMAKE=	YES
ALL_TARGET=	tworld
DATADIR=	share/tworld

MAN6=		tworld.6

post-patch:
	@${REINPLACE_CMD} -e 's|make|$${MAKE}|g; s|cp -i|cp|' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
