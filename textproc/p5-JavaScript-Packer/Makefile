# New ports collection makefile for:	p5-JavaScript-Packer
# Date created:		2011-07-23
# Whom:			Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	JavaScript-Packer
PORTVERSION=	1.006
CATEGORIES=	textproc www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Perl version of Dean Edwards' Packer.js

BUILD_DEPENDS=	p5-Regexp-RegGrp>=1.001.001:${PORTSDIR}/devel/p5-Regexp-RegGrp
RUN_DEPENDS=	p5-Regexp-RegGrp>=1.001.001:${PORTSDIR}/devel/p5-Regexp-RegGrp

PERL_CONFIGURE=	yes

MAN3=		JavaScript::Packer.3

.include <bsd.port.mk>
