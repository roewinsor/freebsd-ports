# New ports collection makefile for:	eclipse-propedit
# Date created:				3 October 2007
# Whom:					Sutra Zhou <zhoushuqun@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	PropertiesEditor
PORTVERSION=	4.8.2
PORTREVISION=	3
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_JP}
MASTER_SITE_SUBDIR=	propedit/17247
PKGNAMEPREFIX=	eclipse-
DISTNAME=	jp.gr.java_conf.ussiy.app.propedit_${PORTVERSION}_for_eclipse3.0
DIST_SUBDIR=	eclipse

MAINTAINER=	zhoushuqun@gmail.com
COMMENT=	Properties editor for eclipse

RUN_DEPENDS=	eclipse:${PORTSDIR}/java/eclipse

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
USE_ZIP=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.5+
JAVA_OS=	native

do-install:
	@${MKDIR} ${PREFIX}/lib/eclipse
	@${CP} -r ${WRKSRC}/eclipse/plugins ${PREFIX}/lib/eclipse
	@${CP} -r ${WRKSRC}/eclipse/features ${PREFIX}/lib/eclipse
	@(cd ${WRKSRC}; ${FIND} -s eclipse/features eclipse/plugins -not -type d) | ${SED} -e 's,^eclipse,lib/eclipse,' >> ${TMPPLIST}
	@(cd ${WRKSRC}; ${FIND} -s -d eclipse/features eclipse/plugins -type d) \
	| ${GREP} -vE 'eclipse/plugins$$|eclipse/features$$' \
	| ${SED} -ne 's,^,@dirrm lib/,p' >> ${TMPPLIST}

.include <bsd.port.mk>
