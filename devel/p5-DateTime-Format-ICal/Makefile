# New ports collection makefile for:	p5-DateTime-Format-ICal
# Date created:	   2 july 2003
# Whom:		   Mathieu Arnold <m@absolight.net>
#
# $FreeBSD$
#

PORTNAME=	DateTime-Format-ICal
PORTVERSION=	0.09
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Parse and format ICal datetime and duration strings

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DateTime.pm:${PORTSDIR}/devel/p5-DateTime \
		${SITE_PERL}/DateTime/TimeZone.pm:${PORTSDIR}/devel/p5-DateTime-TimeZone \
		${SITE_PERL}/DateTime/Event/ICal.pm:${PORTSDIR}/devel/p5-DateTime-Event-ICal \
		${SITE_PERL}/DateTime/Span.pm:${PORTSDIR}/devel/p5-DateTime-Set \
		p5-Params-Validate>=0:${PORTSDIR}/devel/p5-Params-Validate
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		DateTime::Format::ICal.3

.include <bsd.port.mk>
