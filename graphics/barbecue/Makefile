# New ports collection makefile for:	barbecue
# Date created:		21 May 2005
# Whom:			Thierry Thomas <thierry@pompo.net>
#
# $FreeBSD$
#

PORTNAME=	barbecue
PORTVERSION=	1.0.6d
PORTREVISION=	4
CATEGORIES=	graphics print java
MASTER_SITES=	SF

MAINTAINER=	thierry@FreeBSD.org
COMMENT=	A Java barcode generator

RUN_DEPENDS=	${JAVALIBDIR}/jdom.jar:${PORTSDIR}/java/jdom

USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	yes

JARFILES=	${PORTNAME}-${PORTVERSION}.jar
PLIST_FILES+=	%%JAVAJARDIR%%/${JARFILES:S|-${PORTVERSION}||}	\
		%%JAVAJARDIR%%/LICENSE.barbecue.txt

.if defined(WITH_TOMCAT55)
RUN_DEPENDS+=	${LOCALBASE}/tomcat5.5/bin/bootstrap.jar:${PORTSDIR}/www/tomcat55
JAKARTA_HOME=	${LOCALBASE}/tomcat5.5
PLIST_FILES+=	${JAKARTA_HOME:S|^${LOCALBASE}/||}/webapps/${PORTNAME}.war
.endif

PORTDOCS=	*

pre-everything::
.if !defined(WITH_TOMCAT55)
	@${ECHO_MSG} '*********************************************************'
	@${ECHO_MSG} '* To use Barbecue as a servlet, define WITH_TOMCAT55.   *'
	@${ECHO_MSG} '*********************************************************'
.endif

post-extract:
	${MV} ${WRKSRC}/${JARFILES} ${WRKSRC}/${JARFILES:S|-${PORTVERSION}||}

do-install:
	${INSTALL_DATA} ${JARFILES:S|-${PORTVERSION}||:S|^|${WRKSRC}/|} ${JAVAJARDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENSE.txt ${JAVAJARDIR}/LICENSE.barbecue.txt
.if defined(WITH_TOMCAT55)
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.war ${JAKARTA_HOME}/webapps
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
	@${CP} -R ${WRKSRC}/docs/* ${DOCSDIR}
	@${CP} -R ${WRKSRC}/examples ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
