# New ports collection makefile for:	p5-Tree-Binary-Dictionary
# Date created:				24 May 2006
# Whom:					Aaron Dalton <aaron@daltons.ca>
#
# $FreeBSD$
#

PORTNAME=	Tree-Binary-Dictionary
PORTVERSION=	1.01
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A dictionary API to a binary tree

RUN_DEPENDS=	${SITE_PERL}/Tree/Binary.pm:${PORTSDIR}/devel/p5-Tree-Binary
BUILD_DEPENDS=	${RUN_DEPENDS}

MAN3=		Tree::Binary::Dictionary.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
