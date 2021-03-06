# New ports collection makefile for:	gnome-mount
# Date created:			04 June 2006
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD$
#   $MCom: ports/sysutils/gnome-mount/Makefile,v 1.28 2011/03/08 19:25:20 kwm Exp $
#

PORTNAME=	gnome-mount
PORTVERSION=	0.8
PORTREVISION=	9
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	A front-end to mount, umount, and eject using HAL

LIB_DEPENDS=	hal.1:${PORTSDIR}/sysutils/hal \
		notify.4:${PORTSDIR}/devel/libnotify \
		gnome-keyring:${PORTSDIR}/security/libgnome-keyring
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/polkit-gnome.pc:${PORTSDIR}/sysutils/policykit-gnome

USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gtk20
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-nautilus-extension
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gnome-mount.schemas
MAN1=		gnome-mount.1
MLINKS=		gnome-mount.1 gnome-eject.1 \
		gnome-mount.1 gnome-umount.1

.include <bsd.port.mk>
