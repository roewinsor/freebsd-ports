# New ports collection makefile for:	textproc/p5-Pod-POM-View-HTML-Filter
# Date created:				01 September 2005
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Pod-POM-View-HTML-Filter
PORTVERSION=	0.09
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Use filters on sections of your pod documents

BUILD_DEPENDS=	${SITE_PERL}/Pod/POM.pm:${PORTSDIR}/textproc/p5-Pod-POM \
		${SITE_PERL}/Syntax/Highlight/Shell.pm:${PORTSDIR}/www/p5-Syntax-Highlight-Shell \
		${SITE_PERL}/Perl/Tidy.pm:${PORTSDIR}/devel/perltidy \
		${SITE_PERL}/Syntax/Highlight/HTML.pm:${PORTSDIR}/www/p5-Syntax-Highlight-HTML
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Pod::POM::View::HTML::Filter.3

.include <bsd.port.mk>
