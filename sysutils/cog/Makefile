# New ports collection makefile for:	COnfigurator for Gnome
# Date created:				01 May 2004
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	cog
PORTVERSION=	0.8.0
PORTREVISION=	11
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://www.krakoa.dk/progs/cog/

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	A program for editing advanced GNOME settings in an easy way

USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeui
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
