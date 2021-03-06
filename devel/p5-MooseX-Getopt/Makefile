# New ports collection makefile for:	devel/p5-MooseX-Getopt
# Date created:				28 Jul 2008
# Whom:					Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	MooseX-Getopt
PORTVERSION=	0.38
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	A Moose role for processing command line options

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Getopt-Long-Descriptive>=0.081:${PORTSDIR}/devel/p5-Getopt-Long-Descriptive \
		p5-Moose>=0.56:${PORTSDIR}/devel/p5-Moose \
		p5-MooseX-Role-Parameterized>=0:${PORTSDIR}/devel/p5-MooseX-Role-Parameterized
RUN_DEPENDS:=	${BUILD_DEPENDS}

TEST_DEPENDS=	p5-MooseX-SimpleConfig>=0.07:${PORTSDIR}/devel/p5-MooseX-SimpleConfig \
		p5-Test-Deep>=0:${PORTSDIR}/devel/p5-Test-Deep \
		p5-Test-Fatal>=0.003:${PORTSDIR}/devel/p5-Test-Fatal \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires \
		p5-Test-Warn>=0:${PORTSDIR}/devel/p5-Test-Warn

PERL_CONFIGURE=	yes

MAN3=	MooseX::Getopt.3 \
	MooseX::Getopt::Basic.3 \
	MooseX::Getopt::Dashes.3 \
	MooseX::Getopt::GLD.3 \
	MooseX::Getopt::Meta::Attribute.3 \
	MooseX::Getopt::Meta::Attribute::NoGetopt.3 \
	MooseX::Getopt::Meta::Attribute::Trait.3 \
	MooseX::Getopt::Meta::Attribute::Trait::NoGetopt.3 \
	MooseX::Getopt::OptionTypeMap.3 \
	MooseX::Getopt::ProcessedArgv.3 \
	MooseX::Getopt::Strict.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
TEST_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
