# New ports collection makefile for:	devel/p5-Moo
# Date created:				Feb 25, 2011
# Whom:					Wen Heping <wen@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Moo
PORTVERSION=	0.009012
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MSTROUT
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Minimalist Object Orientation (with Moose compatiblity)

BUILD_DEPENDS=	p5-strictures>=1.001001:${PORTSDIR}/devel/p5-strictures \
		p5-Class-Method-Modifiers>=1.05:${PORTSDIR}/devel/p5-Class-Method-Modifiers
RUN_DEPENDS=	p5-strictures>=1.001001:${PORTSDIR}/devel/p5-strictures \
		p5-Class-Method-Modifiers>=1.05:${PORTSDIR}/devel/p5-Class-Method-Modifiers
TEST_DEPENDS=	p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal

PERL_CONFIGURE=	yes

MAN3=	Moo.3 \
	Moo::Role.3 \
	Role::Tiny.3 \
	Role::Tiny::With.3 \
	Sub::Defer.3 \
	Sub::Quote.3

.include <bsd.port.mk>
