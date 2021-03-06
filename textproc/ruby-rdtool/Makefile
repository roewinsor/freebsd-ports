# New ports collection makefile for:	Ruby-RDtool
# Date created:		7 Aug 2000
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $FreeBSD$
#

PORTNAME=	rdtool
PORTVERSION=	0.6.31
CATEGORIES=	textproc ruby
MASTER_SITES=	https://github.com/uwabami/${PORTNAME}/tarball/v${PORTVERSION}/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	uwabami-${PORTNAME}-v${PORTVERSION}-0-g${GITVERSION}
DIST_SUBDIR=	ruby

MAINTAINER=	knu@FreeBSD.org
COMMENT=	RD to HTML/man/etc. converter (RD is to Ruby as POD is to Perl)

BUILD_DEPENDS=	racc:${PORTSDIR}/devel/ruby-racc

GITVERSION=	0df3288
FETCH_ARGS=	-pRr
WRKSRC=		${WRKDIR}/uwabami-${PORTNAME}-${GITVERSION}

USE_RUBY=	yes
USE_RUBY_SETUP=	yes

RUBY_MODNAME=	rd

DOCS_EN=	README.rd	doc/rd-draft.rd
DOCS_JA=	README.rd.ja	doc/rd-draft.rd.ja

post-install:
	${MKDIR} ${RUBY_SITELIBDIR}/rd
	${INSTALL_DATA} ${WRKSRC}/lib/rd/dot.rd2rc ${RUBY_SITELIBDIR}/rd/
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${RUBY_MODEXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/lib/rd/dot.rd2rc ${RUBY_MODEXAMPLESDIR}/
.endif
.if !defined(NOPORTDOCS)
	${MKDIR} ${RUBY_MODDOCDIR}/ja
.for f in ${DOCS_EN}
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/
.endfor
.for f in ${DOCS_JA}
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/ja/
.endfor
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
