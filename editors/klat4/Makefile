# Ports collection makefile for:	klat4
# Date created:			14 September 2008
# Whom:				laddassm
#
# $FreeBSD$
#

PORTNAME=	klat4
PORTVERSION=	0.6.1
PORTREVISION=	7
CATEGORIES=	editors
MASTER_SITES=	http://klat.algebraic.ru/

MAINTAINER=	laddassm@gmail.com
COMMENT=	A LaTeX source editor for KDE4

RUN_DEPENDS=	${KDE4_PREFIX}/lib/kde4/katepart.so:${PORTSDIR}/editors/kate

USE_BZIP2=	yes
USE_CMAKE=	yes
USE_KDE4=	kdeprefix kdelibs automoc4
USE_QT_VER=	4
QT_COMPONENTS=	corelib qmake_build moc_build rcc_build uic_build

.include <bsd.port.mk>
