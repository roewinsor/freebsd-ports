# New ports collection makefile for:	icon-naming-utils
# Date created:		2005-11-05
# Whom:			Phillip Neumann <pneumann@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	icon-naming-utils
PORTVERSION=	0.8.90
CATEGORIES=	x11-themes
MASTER_SITES=	GENTOO
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	yuri.pankov@gmail.com
COMMENT=	Utilities of the Tango project

BUILD_DEPENDS=	${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple
RUN_DEPENDS=	${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple

USE_GZIP=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig

pre-configure:
	@ ${REINPLACE_CMD} -e "s|[(]datadir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g" ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
