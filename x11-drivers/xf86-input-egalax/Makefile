# New ports collection makefile for:	xf86-input-egalax
# Date Created:				2 June 2010
# Whom:					Gleb Smirnoff <glebius@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	xf86-input-egalax
PORTVERSION=	0.2
CATEGORIES=	x11-drivers
MASTER_SITES=	LOCAL/glebius

MAINTAINER=	glebius@FreeBSD.org
COMMENT=	eGalax touch screen input driver for X.Org

LICENSE=	BSD

XORG_CAT=	driver
MAN4=		egalax.4x

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 800505
IGNORE=         is useless without uep(4) kernel driver
.endif

.include <bsd.port.post.mk>
