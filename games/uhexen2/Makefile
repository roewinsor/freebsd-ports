# New ports collection makefile for:	uhexen2
# Date created:				2006-12-30
# Whom:					alepulver
#
# $FreeBSD$
#

PORTNAME=	uhexen2
PORTVERSION=	1.5.1
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/Hammer%20of%20Thyrion/${PORTVERSION}/Source
DISTNAME=	hexen2source-${PORTVERSION}
EXTRACT_SUFX=	.tgz
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Hexen II source port supporting Linux/FreeBSD/Unix/Windows

LIB_DEPENDS=	mad.2:${PORTSDIR}/audio/libmad

LICENSE_=	GPLv2 GPLv3
LICENSE_COMB=	dual

USE_GMAKE=	yes
USE_GL=		yes
USE_SDL=	sdl mixer
WANT_GNOME=	yes
MAKE_JOBS_UNSAFE=	yes

OPTIONS=	DEMO "Install demo version of the game data" off \
		HEXEN2 "Build Hexen II clients and servers" on \
		HW "Build HexenWorld clients and servers" on \
		LAUNCHER_GTK1 "Build graphical (GTK1) game launcher" on \
		LAUNCHER_GTK2 "Build graphical (GTK2) game launcher" off \
		X86_ASM "Enable use of optimized x86 assembly code" on

PORTSCOUT=	skipb:yes

.include <bsd.port.pre.mk>

.if defined(WITHOUT_HEXEN2) && defined(WITHOUT_HW)
IGNORE=		needs at least one group of binaries (HEXEN2 and HW)
.endif

.if defined(WITH_DEMO)
MASTER_SITES+=	SF/${PORTNAME}/Hammer%20of%20Thyrion/${PORTVERSION}/Linux-demo-version:demo
DISTFILES+=	hexen2demo-${PORTVERSION}-linux-i586${EXTRACT_SUFX}:demo
MAKE_ENV+=	DEMO=yes
PLIST_SUB+=	DEMO="" \
		FULL="@comment "
UH2_DATA=	default.cfg hexen.rc pak0.pak progs.dat
UH2_DATADIR=	${WRKDIR}/hexen2demo-${PORTVERSION}
.else
MASTER_SITES+=	SF/${PORTNAME}/Hexen2%20GameData/gamedata-1.20:data
DISTFILES+=	gamedata-all-1.20${EXTRACT_SUFX}:data
PLIST_SUB+=	DEMO="@comment " \
		FULL=""
SUB_FILES+=	pkg-message
UH2_DATA=	default.cfg hexen.rc progs.dat progs2.dat strings.txt
UH2_DATADIR=	${WRKDIR}
.endif

.if defined(WITH_HEXEN2)
MAKE_ENV+=	BUILD_HEXEN2=yes
PLIST_SUB+=	HEXEN2=""
UH2_BIN+=	engine/hexen2/glhexen2 \
		engine/hexen2/hexen2
.else
PLIST_SUB+=	HEXEN2="@comment "
.endif

.if defined(WITH_HW)
. if !defined(WITH_DEMO)
MASTER_SITES+=	SF/${PORTNAME}/Hexen2%20GameData/hexenworld-pakfiles:hw
DISTFILES+=	hexenworld-pakfiles-0.15${EXTRACT_SUFX}:hw
. endif
MAKE_ENV+=	BUILD_HW=yes
PLIST_SUB+=	HW=""
UH2_BIN+=	engine/hexenworld/client/glhwcl \
		engine/hexenworld/server/hwsv \
		engine/hexenworld/client/hwcl
.else
PLIST_SUB+=	HW="@comment "
.endif

.if defined(WITH_LAUNCHER_GTK1)
USE_GNOME+=	gtk12
MAKE_ENV+=	BUILD_LAUNCHER_GTK1=yes
PLIST_SUB+=	LAUNCHER_GTK1=""
.else
PLIST_SUB+=	LAUNCHER_GTK1="@comment "
.endif

.if defined(WITH_LAUNCHER_GTK2)
USE_GNOME+=	gtk20
MAKE_ENV+=	BUILD_LAUNCHER_GTK2=yes
PLIST_SUB+=	LAUNCHER_GTK2=""
.else
PLIST_SUB+=	LAUNCHER_GTK2="@comment "
.endif

.if defined(WITH_X86_ASM) && ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
MAKE_ENV+=	USE_X86_ASM=yes
.endif

post-extract:
	@${CP} ${FILESDIR}/${MAKEFILE} ${WRKSRC}

do-install:
.for f in ${UH2_BIN}
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${PREFIX}/bin
.endfor
	${MKDIR} ${DATADIR}/data1
.for f in ${UH2_DATA}
	${INSTALL_DATA} ${UH2_DATADIR}/data1/${f} ${DATADIR}/data1
.endfor
.if !defined(WITH_DEMO)
	${INSTALL_DATA} ${WRKDIR}/patchdat/data1/* ${DATADIR}/data1
	${CP} -R ${WRKDIR}/portals ${DATADIR}
.endif
.if defined(WITH_HW)
	${MKDIR} ${DATADIR}/hw
	${INSTALL_DATA} ${UH2_DATADIR}/hw/* ${DATADIR}/hw
.endif
.if defined(WITH_LAUNCHER_GTK1)
	${INSTALL_PROGRAM} ${WRKSRC}/launcher/h2launcher.gtk1 ${PREFIX}/bin
.endif
.if defined(WITH_LAUNCHER_GTK2)
	${INSTALL_PROGRAM} ${WRKSRC}/launcher/h2launcher.gtk2 ${PREFIX}/bin
.endif
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/* ${DOCSDIR}
.endif

.if !defined(WITH_DEMO)
post-install:
	@${ECHO_CMD}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD}
.endif

.include <bsd.port.post.mk>
