# New ports collection makefile for:	spamcup
# Date created:				07 February 2005
# Whom:	      				Yen-Ming Lee <leeym@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	spamcup
PORTVERSION=	1.09
PORTREVISION=	3
CATEGORIES=	mail
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A tool for automatic spam reporting via Spamcop.net

LICENSE=	GPLv1

RUN_DEPENDS=	${SITE_PERL}/LWP/UserAgent.pm:${PORTSDIR}/www/p5-libwww \
		${SITE_PERL}/Getopt/ArgvFile.pm:${PORTSDIR}/devel/p5-Getopt-ArgvFile \
		${SITE_PERL}/HTML/Form.pm:${PORTSDIR}/www/p5-HTML-Form

PERL_CONFIGURE=	yes

PLIST_FILES=	bin/spamcup.pl ${SITE_PERL_REL}/spamcup.pl \
		${SITE_PERL_REL}/${PERL_ARCH}/auto/Spamcup/.packlist

PLIST_DIRS=	${SITE_PERL_REL}/${PERL_ARCH}/auto/Spamcup

.include <bsd.port.mk>
