# New ports collection makefile for:	xshttpd
# Date created:				29 June 2005
# Whom:					Ed Schouten <ed@fxq.nl>
#
# $FreeBSD$
#

PORTNAME=	xshttpd
DISTVERSION=	3.6g01
PORTREVISION=	3
CATEGORIES=	www ipv6
MASTER_SITES=	ftp://ftp.stack.nl/pub/xs-httpd/release/ \
		ftp://mud.stack.nl/pub/xs-httpd/release/
DISTNAME=	${PORTNAME}-${DISTVERSION:S/.//}

MAINTAINER=	johans@FreeBSD.org
COMMENT=	A webserver with CGI as own user and SSL suport

RUN_DEPENDS=	run-mailcap:${PORTSDIR}/misc/mime-support \
		ppmtogif:${PORTSDIR}/graphics/netpbm

CONFLICTS+=	xshttpd-devel-[0-9]*

MAN1=		clearxs.1 gfxcount.1 httpd.1 httpdc.1 imagemap.1 \
		readxs.1 xschpass.1 xsindex.1 xspasswd.1
MAN5=		httpd.conf.5 xsauth.5 xsconf.5 xsscripts.5 xsredir.5
MAN7=		httpd_cgi.7 httpd_ssi.7
USE_BZIP2=	yes
USE_RC_SUBR=	xshttpd.sh

GNU_CONFIGURE=	yes

OPTIONS=	SSL "Enable https support" On \
		PCRE "Enable pcre rewriting support" On \
		LDAP "Enable ldap support" Off \
		CURL "Enable curl (proxy) support" Off \
		M4_CONFIG "Enable m4 configuration preprocessor" Off \
		PERSISTENT_PERL "Enable persistent perl interpreter" Off

PORTDOCS=	README COPYING ChangeLog

.include <bsd.port.pre.mk>
# By default XS-HTTPD stores its data in ${PREFIX}/lib/httpd
WWWDIR?=	${PREFIX}/www/${PORTNAME}
CONFIGURE_ARGS+=--with-rootdir=${WWWDIR}

.if !defined(WITHOUT_SSL)
.include <${PORTSDIR}/Mk/bsd.openssl.mk>
#USE_OPENSSL=	yes
CONFIGURE_ARGS+=--with-ssl
.else
CONFIGURE_ARGS+=--without-ssl
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--with-ldap=${LOCALBASE}
.else
CONFIGURE_ARGS+=--without-ldap
.endif

.if defined(WITH_M4_CONFIG)
CONFIGURE_ARGS+=--with-preprocessor
.else
CONFIGURE_ARGS+=--without-preprocessor
.endif

.if defined(WITH_PERSISTENT_PERL)
USE_PERL5=	yes
CONFIGURE_ARGS+=--with-perl
.else
CONFIGURE_ARGS+=--without-perl
.endif

.if defined(WITH_PCRE)
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
CONFIGURE_ARGS+=--with-pcre=yes
.else
CONFIGURE_ARGS+=--with-pcre=no
.endif

.if defined(WITH_CURL)
LIB_DEPENDS+=	curl:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=--with-curl=yes
.else
CONFIGURE_ARGS+=--with-curl=no
.endif

post-patch:
.for i in man/httpd.1.in man/httpd.conf.5 config/httpd.conf.sample \
	contrib/SSL-Makefile contrib/logrotate.sh
	@${REINPLACE_CMD} \
		-e 's|/wwwsys|${WWWDIR}|g' \
		-e 's|/usr/local/lib/httpd|${WWWDIR}|g' \
		-e 's|nobody|${WWWOWN}|g' \
		-e 's|nogroup|${WWWGRP}|g' \
		${WRKSRC}/$i
.endfor
	@${REINPLACE_CMD} \
		-e 's|\(MIME_TYPES\).*|\1 "${LOCALBASE}/etc/mime.types"|' \
		${WRKSRC}/src/constants.h
	@${REINPLACE_CMD} -e 's|mime.types ||g' \
		${WRKSRC}/config/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
. for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
. endfor
.endif

.include <bsd.port.post.mk>
