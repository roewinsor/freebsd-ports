# New ports collection makefile for:	lua-rds-parser
# Date created:		12 Jan 2012
# Whom:			osa
#
# $FreeBSD$
#

PORTNAME=	redis-parser
DISTVERSION=	0.09rc5
CATEGORIES=	devel
MASTER_SITES=	https://github.com/agentzh/lua-redis-parser/tarball/master/
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}
DISTNAME=	lua-${PORTNAME}-${DISTVERSION}-${GITVERSION}

MAINTAINER=	osa@FreeBSD.org
COMMENT=	Redis reply parser and request constructor library for Lua

FETCH_ARGS=	-pRr
USE_LUA?=	5.1
GITVERSION=	0-g2040bae
WRKSRC=		${WRKDIR}/agentzh-lua-redis-parser-${GITVERSION:S/^0-g//}

PLIST_FILES=	%%LUA_MODLIBDIR%%/redis/parser.so
PLIST_DIRS=	%%LUA_MODLIBDIR%%/redis

do-install:
	${MKDIR} ${LUA_MODLIBDIR}/redis
	${INSTALL_PROGRAM} ${WRKSRC}/parser.so ${LUA_MODLIBDIR}/redis

.include <bsd.port.mk>
