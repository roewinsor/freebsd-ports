# New ports collection makefile for:	sysbench
# Date created:		2005-12-11
# Whom:			Gea-Suan Lin <gslin@ccca.nctu.edu.tw>
#
# $FreeBSD$
#

PORTNAME=	sysbench
PORTVERSION=	0.4.12
PORTREVISION=	1
CATEGORIES=	benchmarks databases
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A modular, cross-platform and multi-threaded benchmark tool

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_AUTOTOOLS=	libtool

OPTIONS=	LARGEFILE "Enable Largefile support" on \
		MYSQL "Enable MySQL support" on \
		POSTGRESQL "Enable PostgreSQL support" off

.include <bsd.port.pre.mk>

.if defined(WITHOUT_LARGEFILE)
CONFIGURE_ARGS+=	--disable-largefile
.else
CONFIGURE_ARGS+=	--enable-largefile
.endif

.if defined(WITHOUT_MYSQL)
CONFIGURE_ARGS+=	--with-mysql=no
.else
USE_MYSQL=	yes
CONFIGURE_ARGS+=	--with-mysql
.endif

.if defined(WITH_POSTGRESQL)
USE_PGSQL=	yes
CONFIGURE_ARGS+=	--with-pgsql
.else
CONFIGURE_ARGS+=	--with-pgsql=no
.endif

post-configure:
	@${REINPLACE_CMD} -e 's/^program_transform_name/#/' \
		${WRKSRC}/Makefile ${WRKSRC}/sysbench/Makefile

.if defined(NOPORTDOCS)
post-install:
	${RM} ${DOCSDIR}/manual.html
	${RMDIR} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
