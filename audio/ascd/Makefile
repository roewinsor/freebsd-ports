# New ports collection makefile for:	ascd
# Date created:			29 November 1998
# Whom:				Jim Mock <jim@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	ascd
PORTVERSION=	0.13.2
PORTREVISION=	1
CATEGORIES=	audio afterstep windowmaker
MASTER_SITES=	http://www.sourcefiles.org/Multimedia/Audio_CD/Other_X11/ \
		AFTERSTEP/stable/rpms/misc-tarballs/:theme
DISTFILES=	${DISTNAME}-src.tgz ${DATAFILES}:theme

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A dockable cd player for AfterStep or WindowMaker

LICENSE=	BSD

LIB_DEPENDS=	workman.1:${PORTSDIR}/audio/libworkman

USE_IMAKE=	yes
USE_XORG=	xpm

DATAFILES=	ascd-0.13pr6-themes.tgz
THEMESDIR=	ascd-0.13pr6-themes

MAN1=		ascd.1

post-patch:
	@${SED} -e "s:%%PREFIX%%:${PREFIX}:g" \
		${WRKSRC}/misc/config.h.default > ${WRKSRC}/config.h
	@${SED} -e "s:%%PREFIX%%:${PREFIX}:g" \
		${WRKSRC}/misc/dirs.h.default > ${WRKSRC}/dirs.h
	@${CAT} ${WRKSRC}/version.h >> ${WRKSRC}/config.h

post-install:
	@${ECHO_CMD} "AScd additional themes installation"
	@${ECHO_CMD} ""
	@${ECHO_CMD} "Untarring"
	@${TAR} xf ${WRKDIR}/${THEMESDIR}/themes.tar -C ${PREFIX}/share/ascd/Themes
	@${ECHO_CMD} "Done."

.include <bsd.port.mk>
