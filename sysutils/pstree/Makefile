# Ports collection makefile for:  pstree
# Date created:			  22 Aug 2001
# Whom:				  Kris Kennaway <kris@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	pstree
PORTVERSION=	2.33
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.thp.uni-duisburg.de/pub/source/ \
		LOCAL/avl

MAINTAINER=	avl@FreeBSD.org
COMMENT=	List processes as a tree

NO_WRKSUBDIR=	yes

CONFLICTS=	psmisc-[0-9]*

PLIST_FILES=	bin/pstree

do-build:
	cd ${WRKDIR} && ${CC} ${CFLAGS} -o pstree pstree.c

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/pstree ${PREFIX}/bin

.include <bsd.port.mk>
