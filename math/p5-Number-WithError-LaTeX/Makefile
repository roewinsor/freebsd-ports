# New ports collection makefile for:	Number-WithError-LaTeX
# Date created:				15 May 2006
# Whom:					Aaron Dalton <aaron@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Number-WithError-LaTeX
PORTVERSION=	0.06
PORTREVISION=	1
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	LaTeX output for Number::WithError

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Params/Util.pm:${PORTSDIR}/devel/p5-Params-Util \
		${SITE_PERL}/prefork.pm:${PORTSDIR}/devel/p5-prefork \
		${SITE_PERL}/Number/WithError.pm:${PORTSDIR}/math/p5-Number-WithError \
		${SITE_PERL}/TeX/Encode.pm:${PORTSDIR}/textproc/p5-TeX-Encode
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-LectroTest>=0:${PORTSDIR}/devel/p5-Test-LectroTest

MAN3=	Number::WithError::LaTeX.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
