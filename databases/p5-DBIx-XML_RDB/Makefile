# New ports collection makefile for:	p5-DBIx-XML_RDB
# Date created:				May 26 2001
# Whom:					vanilla
#
# $FreeBSD$
#

PORTNAME=	DBIx-XML_RDB
PORTVERSION=	0.05
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Perl extension for creating XML from existing DBI datasources

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		DBIx::XML_RDB.3

.include <bsd.port.mk>
