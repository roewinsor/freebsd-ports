# ex:ts=8
# New ports collection makefile for:	tuxpuck
# Date created:		25 April 2002
# Whom:			Jan Stocker <Jan.Stocker@t-online.de>
#
# $FreeBSD$
#

PORTNAME=	tuxpuck
PORTVERSION=	0.8.2
PORTREVISION=	14
CATEGORIES=	games
MASTER_SITES=	http://www.sourcefiles.org/Games/Sports/Miscellaneous/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Shufflepuck Cafe Clone

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png.6:${PORTSDIR}/graphics/png \
		vorbis.4:${PORTSDIR}/audio/libvorbis \
		freetype.9:${PORTSDIR}/print/freetype2

USE_SDL=	sdl
USE_GMAKE=	yes
ALL_TARGET=	tuxpuck
MAKE_JOBS_UNSAFE=	yes

MANCOMPRESSED=	yes
MAN6=		tuxpuck.6
PLIST_FILES=	bin/tuxpuck

.include <bsd.port.pre.mk>

post-patch:
	cd ${WRKSRC}; \
	${REINPLACE_CMD} "s,timer_create,_timer_create,g" \
	tuxpuck.c video.c timer.c intro.c tuxpuck.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tuxpuck ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/tuxpuck.6.gz ${MANPREFIX}/man/man6

.include <bsd.port.post.mk>
