# New ports collection makefile for:	v4l_compat
# Date created:				Aug 1 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	v4l_compat
PORTVERSION=	1.0.${DUMMYDATE}
CATEGORIES=	multimedia
MASTER_SITES=	LOCAL/kwm

MAINTAINER=	multimedia@FreeBSD.org
COMMENT=	Video4Linux IOCTL header files

DUMMYDATE=	20110720

NO_BUILD=	yes
BASE_HEADERS=	input.h uinput.h videodev.h videodev2.h
DVB_HEADERS=	audio.h ca.h dmx.h frontend.h net.h osd.h version.h video.h

do-install:
	${MKDIR} ${PREFIX}/include/linux/dvb
.for file in ${BASE_HEADERS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/include/linux/
.endfor
.for file in ${DVB_HEADERS}
	${INSTALL_DATA} ${WRKSRC}/dvb/${file} ${PREFIX}/include/linux/dvb/
.endfor
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}

.include <bsd.port.mk>
