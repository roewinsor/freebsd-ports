# Ports collection makefile for:  pear-mongo
# Date created:			  23 Nov, 2009
# Whom:				  wen
#
# $FreeBSD$
#

PORTNAME=	mongo
PORTVERSION=	1.2.7
CATEGORIES=	databases pear
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz

MAINTAINER=	miwi@FreeBSD.org
COMMENT=	PECL classes for Mongo Database Driver

LICENSE=	AL2

IGNORE_WITH_PHP=4

USE_PHP=	yes
USE_PHP_BUILD=	spl
USE_PHPIZE=	yes
USE_PHPEXT=	yes

SUB_FILES=	pkg-message

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
