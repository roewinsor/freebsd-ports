# New ports collection makefile for:	p5-LWP-Protocol-https
# Date created:		2011-06-05
# Whom:			Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	LWP-Protocol-https
PORTVERSION=	6.02
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Provide https support for LWP::UserAgent

# We remove p5-libwww here to avoid cyclic dependency
RUN_DEPENDS=	p5-IO-Socket-SSL>=1.38:${PORTSDIR}/security/p5-IO-Socket-SSL \
		p5-Mozilla-CA>=20110101:${PORTSDIR}/www/p5-Mozilla-CA \
		p5-Net-HTTP>=6:${PORTSDIR}/net/p5-Net-HTTP

PERL_CONFIGURE=	yes

MAN3=		LWP::Protocol::https.3

.include <bsd.port.mk>
