# New ports collection makefile for:	MooseX-MethodAttributes
# Date created:	   13 May 2009
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD$
#

PORTNAME=	MooseX-MethodAttributes
PORTVERSION=	0.26
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BOBTFISH
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Code attribute introspection

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Moose>=0.98:${PORTSDIR}/devel/p5-Moose \
		p5-MooseX-Types>=0.21:${PORTSDIR}/devel/p5-MooseX-Types \
		p5-namespace-clean>=0.10:${PORTSDIR}/devel/p5-namespace-clean \
		p5-namespace-autoclean>=0:${PORTSDIR}/devel/p5-namespace-autoclean
RUN_DEPENDS:=	${BUILD_DEPENDS}

TEST_DEPENDS=	p5-MooseX-Role-Parameterized>=0:${PORTSDIR}/devel/p5-MooseX-Role-Parameterized \
		p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception

PERL_CONFIGURE=	yes

MAN3=		MooseX::MethodAttributes.3 \
		MooseX::MethodAttributes::Inheritable.3 \
		MooseX::MethodAttributes::Role.3 \
		MooseX::MethodAttributes::Role::AttrContainer.3 \
		MooseX::MethodAttributes::Role::AttrContainer::Inheritable.3 \
		MooseX::MethodAttributes::Role::Meta::Class.3 \
		MooseX::MethodAttributes::Role::Meta::Map.3 \
		MooseX::MethodAttributes::Role::Meta::Method.3 \
		MooseX::MethodAttributes::Role::Meta::Method::MaybeWrapped.3 \
		MooseX::MethodAttributes::Role::Meta::Method::Wrapped.3 \
		MooseX::MethodAttributes::Role::Meta::Role.3 \
		MooseX::MethodAttributes::Role::Meta::Role::Application.3 \
		MooseX::MethodAttributes::Role::Meta::Role::Application::Summation.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
TEST_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
