# New ports collection makefile for:	p5-Email-Filter
# Date created:		2003-08-31
# Whom:			Lars Thegler <lars@thegler.dk>
#
# $FreeBSD$
#

PORTNAME=	Email-Filter
PORTVERSION=	1.03.2
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Library for creating easy email filters

BUILD_DEPENDS=	${SITE_PERL}/Email/Simple.pm:${PORTSDIR}/mail/p5-Email-Simple \
		${SITE_PERL}/Email/LocalDelivery.pm:${PORTSDIR}/mail/p5-Email-LocalDelivery \
		${SITE_PERL}/IPC/Run.pm:${PORTSDIR}/devel/p5-IPC-Run \
		${SITE_PERL}/Class/Trigger.pm:${PORTSDIR}/devel/p5-Class-Trigger
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Email::Filter.3

.include <bsd.port.mk>
