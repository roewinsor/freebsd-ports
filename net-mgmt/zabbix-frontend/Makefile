# New ports collection makefile for:	zabbix-frontend
# Date created:		2009-12-09
# Whom:			Jim Riggs <ports@christianserving.org>
#
# $FreeBSD$
#

PORTNAME=	zabbix
PKGNAMESUFFIX=	-frontend

MASTERDIR=	${.CURDIR}/../zabbix-server

NO_BUILD=	yes
PATCHDIR=
PLIST=		${PKGDIR}/pkg-plist.frontend

USE_PHP=	bcmath ctype gd pcre snmp sockets mbstring session dom xml \
		xmlreader xmlwriter
IGNORE_WITH_PHP=	4
WANT_PHP_WEB=	yes

OPTIONSFILE=	${PORT_DBDIR}/${PORTNAME}${PKGNAMESUFFIX}/options
OPTIONS=	MYSQL "Use MySQL backend" on \
		PGSQL "Use PostgreSQL backend" off \
		SQLITE "Use SQLite backend" off

.include <bsd.port.options.mk>

.ifndef WITHOUT_MYSQL
USE_PHP+=	mysql
.endif

.ifdef WITH_MYSQLI
USE_PHP+=	mysqli
.endif

.ifdef WITH_PGSQL
USE_PHP+=	pgsql
.endif

.ifdef WITH_SQLITE
RUN_DEPENDS=	${PHPBASE}/lib/php/${PHP_EXT_DIR}/sqlite3.so:${PORTSDIR}/databases/php-sqlite3
.endif

do-install:
	@${INSTALL} -d ${WWWDIR}
	@cd ${WRKSRC}/frontends/php/ && ${COPYTREE_SHARE} . ${WWWDIR}

.include "${MASTERDIR}/Makefile"
