# New ports collection makefile for:	foswiki
# Date created:		2009-04-13
# Whom:			Greg Larkin <glarkin@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	foswiki
PORTVERSION=	1.1.3
CATEGORIES=	www
MASTER_SITES=	SF
DISTNAME=	Foswiki-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	skv@FreeBSD.org
COMMENT=	A free and open source enterprise wiki

RUN_DEPENDS=	p5-Error>=0.15:${PORTSDIR}/lang/p5-Error \
		p5-Algorithm-Diff>=1.1901:${PORTSDIR}/devel/p5-Algorithm-Diff \
		p5-Text-Diff>=0.35:${PORTSDIR}/textproc/p5-Text-Diff \
		p5-Sort-Maker>=0.06:${PORTSDIR}/devel/p5-Sort-Maker

LICENSE=	GPLv2

USE_PERL5=	5.8.4+
NO_BUILD=	yes

OPTIONS=	OPTINT "Install Perl modules for intl character support" On \
		OPTOTH "Install other optional Perl modules" On \
		APACHE "Install Apache web server and sample config file" Off

.include <bsd.port.options.mk>

.if defined(WITH_OPTINT)
RUN_DEPENDS+=	p5-Locale-Maketext-Lexicon>=0:${PORTSDIR}/devel/p5-Locale-Maketext-Lexicon
.endif

.if defined(WITH_OPTOTH)
RUN_DEPENDS+=	p5-Apache-Htpasswd>=0:${PORTSDIR}/security/p5-Apache-Htpasswd \
		p5-Archive-Tar>=0:${PORTSDIR}/archivers/p5-Archive-Tar \
		p5-Cache-Cache>=0:${PORTSDIR}/devel/p5-Cache-Cache \
		p5-CGI-Session>=4.40:${PORTSDIR}/www/p5-CGI-Session \
		p5-CSS-Minifier-XS>=0:${PORTSDIR}/textproc/p5-CSS-Minifier-XS \
		p5-JavaScript-Minifier-XS>=0:${PORTSDIR}/textproc/p5-JavaScript-Minifier-XS \
		p5-Digest-SHA1>=0:${PORTSDIR}/security/p5-Digest-SHA1 \
		p5-Lingua-EN-Sentence>=0:${PORTSDIR}/textproc/p5-Lingua-EN-Sentence \
		p5-libwww>=0:${PORTSDIR}/www/p5-libwww \
		p5-HTML-Tree>=3.23:${PORTSDIR}/www/p5-HTML-Tree \
		p5-Net>=1.19:${PORTSDIR}/net/p5-Net
.endif

.if defined(WITH_APACHE)
USE_APACHE?=	20+
PLIST_SUB+=	NOAPACHE=""
PKGMESSAGE=	pkg-message-apache
SUB_FILES+=	pkg-message-apache

.include <bsd.port.pre.mk>

CONFDIR_REL=	${APACHEETCDIR}/Includes
CONFDIR=	${PREFIX}/${CONFDIR_REL}

PLIST_SUB+=	CONFDIR=${CONFDIR_REL}
.else
# Weirdness - need to include in this branch of the .if because
# it was included in the other one.  The other branch needs
# the include performed after the USE_APACHE variable is set so
# APACHE_VERSION can be tested above.

.include <bsd.port.pre.mk>

PLIST_SUB+=	NOAPACHE="@comment "
PKGMESSAGE=	pkg-message-noapache
SUB_FILES+=	pkg-message-noapache
.endif

SUB_FILES+=	LocalSite.cfg

post-patch:
	@${RM} -rf ${WRKSRC}/lib/CPAN
	@cd ${WRKSRC} && \
		${REINPLACE_CMD} -i "" \
		-e "s|^#[[:space:]]*\(.*\)/home/httpd/foswiki|\1${WWWDIR}|g" \
		-e "s|^#[[:space:]]*\(.*\)\(\= \'/foswiki/\)|\1\2|g" \
		-e "s|/bin/grep|/usr/bin/grep|g" \
		lib/Foswiki.spec
	@cd ${WRKSRC} && \
		${REINPLACE_CMD} -i "" \
		-e "s|/var/www/foswiki|${WWWDIR}|g" \
		-e "s|192.168.1.10||g" \
		foswiki_httpd_conf.txt
	@cd ${WRKSRC}/bin && \
		${INSTALL_DATA} LocalLib.cfg.txt LocalLib.cfg && \
		${REINPLACE_CMD} -i "" -e "s|/absolute/path/to/your/lib|${WWWDIR}/lib|g" \
		LocalLib.cfg
	@${FIND} ${WRKSRC} -name \*.orig -delete

post-install:
.if defined(WITH_APACHE)
	@if [ -d "${CONFDIR}" ]; then \
	  ${INSTALL_DATA} ${WRKSRC}/foswiki_httpd_conf.txt \
		${CONFDIR}/foswiki.conf.sample; \
	else \
	  ${ECHO_MSG} "" ; \
	  ${ECHO_MSG} "Please check your Apache installation -" ; \
	  ${ECHO_MSG} "${CONFDIR} doesn't exist," ; \
	  ${ECHO_MSG} "so I cannot install foswiki.conf.sample there!" ; \
	  ${ECHO_MSG} "" ; \
	  ${FALSE} ; \
	fi
.endif
	@${CAT} ${PKGMESSAGE}

.include "${.CURDIR}/bsd.foswiki.mk"
.include <bsd.port.post.mk>
