# New ports collection makefile for:  madplay
# Date created:        26 November 2003
# Whom:                Sergey Akifyev <asa@gascom.ru>
#
# $FreeBSD$
#

PORTNAME=	madplay
PORTVERSION=	0.15.2b
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	SF/mad/${PORTNAME}/${PORTVERSION} \
		ftp://ftp.mars.org/pub/mpeg/


MAINTAINER=	dinoex@FreeBSD.org
COMMENT=	Madplay MP3 player (part of MAD project)

LIB_DEPENDS=	mad.2:${PORTSDIR}/audio/libmad \
		id3tag.0:${PORTSDIR}/audio/libid3tag

LICENSE=	GPLv2

WANT_GNOME=	yes

GNU_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
ALL_TARGET=	all madtime

MAN1=		abxtest.1 madplay.1

OPTIONS=	NLS "NLS support" on \
		ESOUND "with esound" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

.if !defined(WITHOUT_ESOUND)
CONFIGURE_ARGS+=	--without-esd
.else
USE_GNOME+=	esound
.endif

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/madtime ${PREFIX}/bin

.include <bsd.port.post.mk>
