# New ports collection makefile for:   	mod_authn_sasl
# Date created:        			February 16, 2009
# Whom:                			Joerg Pulz <Joerg.Pulz@frm2.tum.de>
#
# $FreeBSD$
#

PORTNAME=	mod_authn_sasl
PORTVERSION=	1.2
CATEGORIES=	www
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=mod-authn-sasl/mod-authn-sasl/${PORTVERSION}

MAINTAINER=	apache@FreeBSD.org
COMMENT=	Allows user authentication based on libsasl2 mechanisms on apache 2.2

LIB_DEPENDS=	sasl2.2:${PORTSDIR}/security/cyrus-sasl2

MAKE_JOBS_SAFE=	yes

OPTIONS=	SASLAUTHD	"Register dependency for cyrus-sasl2-saslauthd"	off

LICENSE=	AL2

USE_BZIP2=	yes
USE_APACHE=	22
AP_FAST_BUILD=	YES
AP_GENPLIST=	YES
AP_LIB=		${LOCALBASE}/lib -lsasl2

PORTDOCS1=	AUTHORS LICENSE
PORTDOCS=	*

.include <bsd.port.options.mk>

.if defined(WITH_SASLAUTHD)
RUN_DEPENDS+=	saslauthd:${PORTSDIR}/security/cyrus-sasl2-saslauthd
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/
	@${FIND} ${WRKSRC}/doc \( -name "*.in" -o -name "*.am" \) -delete
.   for f in ${PORTDOCS1}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.   endfor
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} doc ${DOCSDIR})
.endif

.include <bsd.port.mk>
