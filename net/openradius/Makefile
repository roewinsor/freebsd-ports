# New ports collection makefile for:   openradius
# Date created:        23 May 2003
# Whom:                Adam Jette <jettea46@yahoo.com>
#
# $FreeBSD$
#

PORTNAME=	openradius
PORTVERSION=	0.9.12c
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://evbergen.home.xs4all.nl/openradius/download/ \
		http://www.mirrors.wiretapped.net/security/authentication/radius/openradius/

MAINTAINER=	crees@FreeBSD.org
COMMENT=	A RADIUS server with some actual documentation

LOGFILE?=	/var/log/openradius.log

CONFLICTS=	freeradius-0.* gnu-radius-1.* radiusd-cistron-1.*

CC?=		gcc
CXX?=		g++

USE_GMAKE=	yes
USE_RC_SUBR=	openradius
SUB_LIST=	LOGFILE="${LOGFILE}"

OPTIONS=	LDAP	"With LDAP user database" off

.include <bsd.port.pre.mk>

.if defined(WITH_LDAP)
USE_OPENLDAP=	YES
PLIST_SUB+=	LDAP=""
SCRIPTS_ENV+=	USE_LDAP=yes
.else
PLIST_SUB+=	LDAP="@comment "
.endif

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/async-iface-notes ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/language.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/module-interface.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/note-behaviourfile ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/note-struct-ownership ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/using-openradius.html ${DOCSDIR}
.endif

.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}/accounts
	${INSTALL_MAN} ${WRKSRC}/examples/behaviour.sample-ldap ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/behaviour.sample-ldap-authbind ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/behaviour.sample-mysql ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/behaviour.sample-postgres ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/behaviour.sample-unixpass ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/behaviour.sample-usersfile ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/configuration.sample-ldap ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/configuration.sample-ldap-authbind ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/configuration.sample-mysql ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/configuration.sample-postgres ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/configuration.sample-unixpass ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/configuration.sample-usersfile ${EXAMPLESDIR}
	${INSTALL_MAN} ${WRKSRC}/examples/accounts/README ${EXAMPLESDIR}/accounts
	${INSTALL_MAN} ${WRKSRC}/examples/accounts/accounts.mysql ${EXAMPLESDIR}/accounts
	${INSTALL_MAN} ${WRKSRC}/examples/accounts/behaviour ${EXAMPLESDIR}/accounts
	${INSTALL_MAN} ${WRKSRC}/examples/accounts/configuration ${EXAMPLESDIR}/accounts
.endif
# Configuration, copy over to sample files
	${MKDIR} ${ETCDIR}
.for FILE in dictionary
	${INSTALL_DATA} ${WRKSRC}/etc/${FILE} ${ETCDIR}/${FILE}.sample
.endfor
# Copy over legacy config files to sample
	${MKDIR} ${ETCDIR}/legacy
.for FILE in clients nases realms users
	${INSTALL} -m 0600 ${WRKSRC}/etc/legacy/${FILE} ${ETCDIR}/legacy/${FILE}.sample
.endfor

	${MKDIR} ${ETCDIR}/modules
.for FILE in radldap.attrmap
	${INSTALL} -m 0600 ${WRKSRC}/etc/modules/${FILE} ${ETCDIR}/modules/${FILE}.sample
.endfor

	${MKDIR} ${ETCDIR}/subdicts
.for FILE in dict.*
	${INSTALL} -m 0600 ${WRKSRC}/etc/subdicts/${FILE} ${ETCDIR}/subdicts/
.endfor

	@${ECHO_CMD}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD}

.include <bsd.port.post.mk>
