# New ports collection makefile for:    tclmidi
# Date created:         14 May 1999
# Whom:                 shanee@augusta.de
#
# $FreeBSD$
#

PORTNAME=	tclmidi
PORTVERSION=	3.1
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.cs.ruu.nl/pub/MIDI/PROGRAMS/ \
		http://ringtail.its.monash.edu.au/pub/midi/PROGRAMS/
# despite references on the homepage to ftp.xor.com, that server
# doesn't work - edwin 20021227

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A language designed for creating and editing standard MIDI files

LIB_DEPENDS=	tcl82.1:${PORTSDIR}/lang/tcl82

MAKE_ENV=	TCL_GENERIC_DIR=${LOCALBASE}/include/tcl8.2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-tclsh=${LOCALBASE}/bin/tclsh8.2
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_FILES=	pkg-message

MAN1=		mplay.1 mrec.1 tclmidi.1 minfo.1 midtotcl.1
MANN=		midiconf.n midievnt.n midifree.n midiget.n midigrep.n \
		midimake.n midimerg.n midiplay.n midiput.n midiread.n  \
		midirec.n midirew.n midisplt.n midistop.n midiwait.n \
		midiwrit.n midivers.n midimove.n midicopy.n mididel.n \
		miditrck.n mididev.n miditime.n midifeat.n

.include <bsd.port.pre.mk>

.if ${ARCH} == "ia64" || ${ARCH} == "sparc64"
IGNORE=		ignored due to cast from pointer to integer of different size
.elif ${OSVERSION} >= 900000
BROKEN=		does not build
.endif

post-patch:
	@${CP} -f ${FILESDIR}/strstream.h ${WRKSRC}

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
