# New ports collection makefile for:	labplot
# Date created:				07 August 2004
# Whom:					Kay Lehmann <kay_lehmann@web.de>
#
# $FreeBSD$
#

PORTNAME=	LabPlot
PORTVERSION=	1.6.0.2
PORTREVISION=	15
CATEGORIES=	math kde
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	LabPlot : Data analysis and visualisation

LIB_DEPENDS=	tiff.4:${PORTSDIR}/graphics/tiff \
		jasper.4:${PORTSDIR}/graphics/jasper \
		MagickWand.5:${PORTSDIR}/graphics/ImageMagick \
		gsl.16:${PORTSDIR}/math/gsl \
		fftw3:${PORTSDIR}/math/fftw3 \
		qwtplot3d.0:${PORTSDIR}/math/qwtplot3d \
		origin.0:${PORTSDIR}/math/liborigin

USE_BZIP2=	yes
USE_QT_VER=	3
USE_KDELIBS_VER=3
USE_GL=		glu
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}
CONFIGURE_ARGS+=--enable-system-qwtplot3d=yes --enable-system-liborigin=yes \
		--enable-ocaml=no --enable-fftw=no --enable-KexiDB=no

MAN1=		LabPlot.1 labplot.1

OPTIONS+=	R "Statistic analysis using R language" off
OPTIONS+=	QHULL "Qhull support" off
OPTIONS+=	PSTOEDIT "Export to vector graphics using pstoedit" off
OPTIONS+=	NETCDF "netCDF data support" off
OPTIONS+=	CDF "CDF data support" off
OPTIONS+=	HDF5 "HDF5 data support" off
OPTIONS+=	AUDIOFILE "Audio data support" off
OPTIONS+=	KEXIDB "KexiDB support" off
OPTIONS+=	QSA "Qt Scripting support" off
OPTIONS+=	TEXVC "Latex formula editor" off

.include <bsd.port.pre.mk>

.if defined(WITH_R)
LIB_DEPENDS+=	R.0:${PORTSDIR}/math/R
CONFIGURE_ENV+=	R_HOME=${LOCALBASE}/lib/R
CONFIGURE_ARGS+=--enable-R=yes
.else
CONFIGURE_ARGS+=--enable-R=no
.endif

.if defined(WITH_QHULL)
LIB_DEPENDS+=	qhull.5:${PORTSDIR}/math/qhull5
CONFIGURE_ARGS+=--enable-qhull=yes
.else
CONFIGURE_ARGS+=--enable-qhull=no
.endif

.if defined(WITH_PSTOEDIT)
RUN_DEPENDS+=	pstoedit:${PORTSDIR}/graphics/pstoedit
.endif

.if defined(WITH_NETCDF)
LIB_DEPENDS+=	netcdf.4:${PORTSDIR}/science/netcdf
CONFIGURE_ARGS+=--enable-netcdf=yes
.else
CONFIGURE_ARGS+=--enable-netcdf=no
.endif

.if defined(WITH_CDF)
LIB_DEPENDS+=	cdf.0:${PORTSDIR}/science/cdf
CONFIGURE_ARGS+=--enable-cdf=yes
.else
CONFIGURE_ARGS+=--enable-cdf=no
.endif

.if defined(WITH_HDF5)
LIB_DEPENDS+=	hdf5.0:${PORTSDIR}/science/hdf5
CONFIGURE_ARGS+=--enable-hdf5=yes
.else
CONFIGURE_ARGS+=--enable-hdf5=no
.endif

.if defined(WITH_AUDIOFILE)
LIB_DEPENDS+=	audiofile.0:${PORTSDIR}/audio/libaudiofile
CONFIGURE_ARGS+=--enable-audiofile=yes
.else
CONFIGURE_ARGS+=--enable-audiofile=no
.endif

.if defined(WITH_QSA)
LIB_DEPENDS+=	 qsa.1:${PORTSDIR}/devel/qsa
CONFIGURE_ARGS+=--enable-qsa=yes
.else
CONFIGURE_ARGS+=--enable-qsa=no
.endif

.if defined(WITH_TEXVC)
RUN_DEPENDS+=	texvc:${PORTSDIR}/print/texvc
.endif

.include <bsd.port.post.mk>
