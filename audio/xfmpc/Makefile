# New ports collection makefile for:	xfmpc
# Date created:				21 Jan 2008
# Whom:					Martin Wilke (miwi@FreeBSD.org)
#
# $FreeBSD$
#

PORTNAME=	xfmpc
PORTVERSION=	0.2.2
PORTREVISION=	1
CATEGORIES=	audio xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=/src/apps/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	xfce@FreeBSD.org
COMMENT=	A graphical MPD client focusing on low footprint

LIB_DEPENDS=	mpd.4:${PORTSDIR}/audio/libmpd

MAKE_JOBS_SAFE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gtk20 intltool intlhack pkgconfig desktopfileutils
USE_XFCE=	configenv libmenu libutil

MAN1=	xfmpc.1

post-install:
	@-update-desktop-database

.include <bsd.port.mk>
