# New ports collection makefile for:	p5-Email-Date
# Date created:		2004-07-26
# Whom:			Lars Thegler <lth@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Email-Date
PORTVERSION=	1.10.3
PORTREVISION=	1
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.([0-9]+)$/\1/}

MAINTAINER=	clsung@FreeBSD.org
COMMENT=	Find and Format Date Headers

BUILD_DEPENDS=	p5-Email-Abstract>=2.10:${PORTSDIR}/mail/p5-Email-Abstract \
		p5-Email-Date-Format>=1:${PORTSDIR}/mail/p5-Email-Date-Format \
		p5-Email-Simple>=1.9:${PORTSDIR}/mail/p5-Email-Simple \
		p5-Time-Piece>=1.08:${PORTSDIR}/devel/p5-Time-Piece \
		p5-TimeDate>=1.16:${PORTSDIR}/devel/p5-TimeDate
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Email::Date.3

.include <bsd.port.mk>
