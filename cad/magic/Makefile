# New ports collection makefile for:    magic
# Date created:         18 Dec 1994
# Whom:                 swallace
#
# $FreeBSD$
#

PORTNAME=	magic
PORTVERSION=	7.5.213
CATEGORIES=	cad
MASTER_SITES=	http://opencircuitdesign.com/magic/archive/ \
		http://fossies.org/linux/misc/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@FreeBSD.org
COMMENT=	An interactive editor for VLSI layouts

LIB_DEPENDS+=	BLT24.3:${PORTSDIR}/x11-toolkits/blt

CONFIGURE_WRKSRC=	${WRKSRC}/scripts

USE_XORG=	ice xext xi xmu
USE_GL=		gl
USE_TCL_BUILD=	yes
USE_TK_BUILD=	yes
USE_TCL=	yes
USE_TK=		yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-tcl=${TCL_LIBDIR} --with-tk=${TK_LIBDIR}
ALL_TARGET=	tcllibrary
MAKE_JOBS_UNSAFE=yes

MAN1=		ext2sim.1 ext2spice.1 extcheck.1 magic.1
MAN5=		cmap.5 displays.5 dlys.5 dstyle.5 ext.5 glyphs.5 mag.5 \
		net.5 sim.5

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e \
		's|^#!.*|#!${AWK} -f|' ${WRKSRC}/ext2spice/spice2sim
	@${REINPLACE_CMD} -e \
		's|TCL_LIB_NAME=.*|TCL_LIB_NAME="tcl${TCL_VER:S/.//}"|g ; \
		 s|TK_LIB_NAME=.*|TK_LIB_NAME="tk${TK_VER:S/.//}"|g ; \
		 s|wish$${TK_VERSION}|${WISH:T}|g ; \
		 s|tclsh$${TK_VERSION}|${TCLSH:T}|g ; \
		 s|-l/usr/X11R6/include|-I${LOCALBASE}/include|g' ${CONFIGURE_WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/CFLAGS/s| -pg | |' ${WRKSRC}/tcltk/Makefile
	@${REINPLACE_CMD} -e \
		's|^#!.*|#!${TCLSH}|' ${WRKSRC}/tcltk/strip_reflibs.tcl
	@${REINPLACE_CMD} -e \
		's|^#!.*|#!${WISH}|' ${WRKSRC}/tcltk/tkshell.tcl

.include <bsd.port.post.mk>
