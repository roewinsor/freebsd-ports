# New ports collection makefile for:	py-asn1-modules
# Date created:				20 March 2011
# Whom:					Ruslan Mahmatkhanov <cvs-src@yandex.ru>
#
# $FreeBSD$
#

PORTNAME=	asn1-modules
PORTVERSION=	0.0.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP \
		SF/pyasn1/py${PORTNAME}/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	rm@FreeBSD.org
COMMENT=	Collection of ASN.1 data structures for py-asn1

LICENSE=	BSD
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asn1>=0.1.1:${PORTSDIR}/devel/py-asn1

# Python3 ready
USE_PYTHON=		yes
USE_PYDISTUTILS=	easy_install
PYDISTUTILS_PKGNAME=	pyasn1-modules

DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}

BASEDOCS=	CHANGES \
		README

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for f in ${BASEDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
