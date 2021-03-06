# New ports collection makefile for:	torcs
# Date created:		Fri 25 avr 2003
# Whom:			thierry@pompo.net
#
# $FreeBSD$
#

PORTNAME=	torcs
DISTVERSION=	1.3.2
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/all-in-one/${PORTVERSION}

MAINTAINER=	rene@FreeBSD.org
COMMENT=	The Open Racing Car Simulator

LICENSE=	GPLv2

BUILD_DEPENDS=	${LOCALBASE}/lib/libplibsl.a:${PORTSDIR}/x11-toolkits/plib
LIB_DEPENDS=	png.6:${PORTSDIR}/graphics/png \
		vorbis.4:${PORTSDIR}/audio/libvorbis
RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash

USE_XORG=	xrender xmu ice xext x11 xxf86vm xrandr
USE_OPENAL=	al alut
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
REINPLACE_ARGS=	-i ""
CONFIGURE_ARGS=	--x-includes=${LOCALBASE}/include --x-libraries=${LOCALBASE}/lib
CONFIGURE_ENV=	LIBS="${PTHREAD_LIBS}"
CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include -DHAVE_DECL_GETOPT

ALL_TARGET=	default
INSTALL_TARGET=	install datainstall

LDFLAGS+=	-L${LOCALBASE}/lib

INSTDIR=	${PREFIX}/share/games/${PORTNAME}

PORTDOCS=	faq.html

BASH2FIX=	src/linux/torcs.in src/tools/accc/accc.in \
		src/tools/nfsperf/nfsperf.in \
		src/tools/texmapper/texmapper.in src/tools/nfs2ac/nfs2ac.in \
		src/tools/trackgen/trackgen.in \
		src/modules/telemetry/telemetry.sh robotgen Make-default.mk \
		data/tracks/road/ole-road-1/generate.sh

DESKTOP_ENTRIES=	"TORCS" \
			"The Open Racing Car Simulator" \
			"${INSTDIR}/Ticon.png" \
			"torcs" \
			"Game;Simulation;" \
			false

.include <bsd.port.pre.mk>

.if defined(WITH_FREEGLUT)
LIB_DEPENDS+=	glut.12:${PORTSDIR}/graphics/freeglut
.else
USE_GL=		glut
.endif

EMPTYDIR=	champ dtmrace endrace ncrace practice quickrace

post-patch:
.for FILE in ${BASH2FIX}
	@${REINPLACE_CMD} -E -e "s|/bin/bash|${LOCALBASE}/bin/bash|"	\
		${WRKSRC}/${FILE}
.endfor

pre-install:
	@${MKDIR} ${PREFIX}/share/games

post-install:
.if !defined (NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/faq/|} ${DOCSDIR}
.endif
.for ed in ${EMPTYDIR}
	${TOUCH} ${INSTDIR}/results/${ed}/.keep_me
.endfor

.include <bsd.port.post.mk>
