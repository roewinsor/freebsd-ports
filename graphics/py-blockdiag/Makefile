# New ports collection makefile for:	py-blockdiag
# Date created:		2011-08-02
# Whom:			TAKATSU Tomonari <tota@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	blockdiag
PORTVERSION=	0.8.7
CATEGORIES=	graphics python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	tota@FreeBSD.org
COMMENT=	A simple block-diagram image generator

LICENSE=	ASL
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PKGNAMEPREFIX}imaging>=1.1.5:${PORTSDIR}/graphics/py-imaging \
		${PKGNAMEPREFIX}funcparserlib>=0.3.4:${PORTSDIR}/devel/py-funcparserlib \
		${PKGNAMEPREFIX}webcolors>=0:${PORTSDIR}/graphics/py-webcolors

USE_PYTHON=	yes
USE_PYDISTUTILS=	easy_install

DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}
EXAMPLESDIR=	${PREFIX}/share/examples/${UNIQUENAME}

PORTDOCS=	README.txt
PORTEXAMPLES=	*

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${INSTALL_WRKSRC}/src/${PORTDOCS} ${DOCSDIR}
.endif
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${INSTALL_WRKSRC}/examples/${PORTEXAMPLES} ${EXAMPLESDIR}
.endif

x-generate-plist:
	${ECHO} bin/blockdiag > pkg-plist.new
	${FIND} ${PYTHON_SITELIBDIR}/${PYEASYINSTALL_EGG} -type f | ${SORT} | \
	${SED} -e 's,${PYTHON_SITELIBDIR},%%PYTHON_SITELIBDIR%%,' \
	-e 's,${PYEASYINSTALL_EGG},%%PYEASYINSTALL_EGG%%,' >> pkg-plist.new
	${FIND} ${PYTHON_SITELIBDIR}/${PYEASYINSTALL_EGG} -type d -depth | ${SORT} -r | \
	${SED} -e 's,${PYTHON_SITELIBDIR},@dirrm %%PYTHON_SITELIBDIR%%,' \
	-e 's,${PYEASYINSTALL_EGG},%%PYEASYINSTALL_EGG%%,' >> pkg-plist.new

.include <bsd.port.mk>