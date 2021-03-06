# New ports collection makefile for:	Apache-XML-Security-J
# Date created:			14 Dec 2010
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	xml-security
PORTVERSION=	1.4.6
CATEGORIES=	security java
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	santuario/java-library
DISTNAME=	${PORTNAME}-src-${PORTVERSION:S/./_/g}

MAINTAINER=	ale@FreeBSD.org
COMMENT=	A Java library for XML Signature and Encryption

BUILD_DEPENDS=	${JAVALIBDIR}/commons-logging.jar:${PORTSDIR}/java/jakarta-commons-logging \
		${JAVALIBDIR}/xalan.jar:${PORTSDIR}/textproc/xalan-j
RUN_DEPENDS=	${JAVALIBDIR}/commons-logging.jar:${PORTSDIR}/java/jakarta-commons-logging \
		${JAVALIBDIR}/xalan.jar:${PORTSDIR}/textproc/xalan-j

LICENSE=	AL2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_ZIP=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.5+
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:S/./_/g}
USE_ANT=	yes
MAKE_ENV=	ANT_INCLUDE_SHARED_JARS=YES
ALL_TARGET=	jar
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
.endif

PORTDOCS=	*
PORTEXAMPLES=	*

PLIST_FILES=	%%JAVAJARDIR%%/xmlsec.jar

do-install:
	@${ECHO} -n ">> Installing JAR as ${JAVAJARDIR}/xmlsec.jar..."
	@${INSTALL_DATA} ${WRKSRC}/build/xmlsec-${PORTVERSION}.jar ${JAVAJARDIR}/xmlsec.jar
	@${ECHO} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC}/build/docs/html && ${COPYTREE_SHARE} javadoc ${DOCSDIR})
	@${ECHO} " [ DONE ]"
.endif
.if !defined(NOPORTEXAMPLES)
	@${ECHO} -n ">> Installing examples in ${EXAMPLESDIR}..."
	@${MKDIR} ${EXAMPLESDIR}
	@(cd ${WRKSRC}/src_samples && ${COPYTREE_SHARE} \* ${EXAMPLESDIR})
	@${ECHO} " [ DONE ]"
.endif

.include <bsd.port.mk>
