# Ports collection makefile for:	hrktorrent
# Date created:				Jun 29, 2008
# Whom:					hrkfrd@gmail.com
#
# $FreeBSD$
#

PORTNAME=	hrktorrent
PORTVERSION=	0.3.5
PORTREVISION=	1
CATEGORIES=	net-p2p
MASTER_SITES=	http://50hz.ws/hrktorrent/

MAINTAINER=	hrkfdn@gmail.com
COMMENT=	A light console torrent client using rasterbar's libtorrent

LIB_DEPENDS=	torrent-rasterbar.5:${PORTSDIR}/net-p2p/libtorrent-rasterbar-14

USE_GNOME=	pkgconfig
USE_BZIP2=	yes

PLIST_FILES=	bin/hrktorrent \
		share/examples/hrktorrent/hrktorrent.rc
PLIST_DIRS=	share/examples/hrktorrent

MAN1=		hrktorrent.1
MANCOMPRESSED=	no

SUB_FILES=	pkg-message

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/hrktorrent
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
