# New ports collection makefile for:	Math-SymbolicX-Statistics-Distributions
# Date created:				15 May 2006
# Whom:					Aaron Dalton <aaron@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Math-SymbolicX-Statistics-Distributions
PORTVERSION=	1.02
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Statistical distributions

BUILD_DEPENDS=	${SITE_PERL}/Math/Symbolic.pm:${PORTSDIR}/math/p5-Math-Symbolic \
		${SITE_PERL}/Math/SymbolicX/ParserExtensionFactory.pm:${PORTSDIR}/math/p5-Math-SymbolicX-ParserExtensionFactory
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-LectroTest>=0:${PORTSDIR}/devel/p5-Test-LectroTest

MAN3=	Math::SymbolicX::Statistics::Distributions.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
