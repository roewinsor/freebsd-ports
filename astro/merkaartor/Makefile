# New ports collection makefile for:   merkaartor
# Date created:        9 January 2009
# Whom:                slaven@rezic.de
#
# $FreeBSD$
#

PORTNAME=	merkaartor
PORTVERSION=	0.17.2
PORTREVISION=	2
CATEGORIES=	astro
MASTER_SITES=	http://www.merkaartor.be/attachments/download/253/

MAINTAINER=	dev2@heesakkers.info
COMMENT=	An openstreetmap mapping program

LICENSE=	GPLv2

BUILD_DEPENDS=	${LOCALBASE}/include/boost/concept_check.hpp:${PORTSDIR}/devel/boost-libs

USE_BZIP2=	yes
USE_LDCONFIG=	yes

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build uic_build moc_build rcc_build \
		gui network svg webkit xml imageformats script scripttools
MAKE_JOBS_SAFE=	yes

.if exists(${LOCALBASE}/bin/gnome-session)
INSTALLS_ICONS=	yes
.endif

QMAKEFLAGS=	PREFIX=${PREFIX}

OPTIONS=	GEOIMAGE "Enable geotagged images (needs exiv2)" on\
		GDAL     "Use the Geospatial Data Abstraction Library" on\
		PROJ     "Use the Cartographic Projections Library" on\
		ZBAR     "Read barcodes from walking papers" off\
		DEBUG    "Enable debugging and verbose logging" off

.include <bsd.port.options.mk>

.if !defined(WITHOUT_GEOIMAGE)
QMAKEFLAGS+=	GEOIMAGE=1
LIB_DEPENDS+=	exiv2.10:${PORTSDIR}/graphics/exiv2
.endif

.if defined(WITH_GDAL)
QMAKEFLAGS+=	GDAL=1
LIB_DEPENDS+=	gdal:${PORTSDIR}/graphics/gdal
PLIST_SUB+=	GDAL=""
.else
PLIST_SUB+=	GDAL="@comment "
.endif

.if defined(WITH_PROJ)
QMAKEFLAGS+=	PROJ=1
LIB_DEPENDS+=	proj:${PORTSDIR}/graphics/proj
.endif

.if defined(WITH_ZBAR)
QMAKEFLAGS+=	ZBAR=1
LIB_DEPENDS+=	zbar:${PORTSDIR}/graphics/zbar
.endif

.if !defined(WITH_DEBUG)
QMAKEFLAGS+=	RELEASE=1 NODEBUG=1
.endif

.if defined(WITHOUT_NLS)
PLIST_SUB+=	NLS="@comment "
.else
PLIST_SUB+=	NLS=""
QT_COMPONENTS+=	linguist_build

pre-build:
	@cd ${WRKSRC}/translations && lrelease-qt4 ../src/src.pro
.endif

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} ${QMAKEFLAGS}

.include <bsd.port.mk>
