# New ports collection makefile for:	pam_google_authenticator
# Date created:				19 May 2011
# Whom:					Jui-Nan Lin <jnlin@csie.nctu.edu.tw>
#
# $FreeBSD$
#

PORTNAME=	pam_google_authenticator
PORTVERSION=	20110519
CATEGORIES=	security
MASTER_SITES=	http://www.cs.nctu.edu.tw/~jnlin/distfiles/
DISTNAME=	google-authenticator-${PORTVERSION}

MAINTAINER=	jnlin@csie.nctu.edu.tw
COMMENT=	PAM module for two-step authentication from Google

LICENSE=	AL2

WRKSRC=		${WRKDIR}/${DISTNAME}/libpam

USE_GMAKE=	yes

PLIST_FILES=	bin/google-authenticator lib/pam_google_authenticator.so

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/google-authenticator ${PREFIX}/bin/google-authenticator
	${INSTALL_LIB} ${WRKSRC}/pam_google_authenticator.so ${PREFIX}/lib/pam_google_authenticator.so

.include <bsd.port.mk>
