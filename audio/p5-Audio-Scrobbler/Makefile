# New ports collection makefile for:	p5-Audio-Scrobbler
# Date created:				January 3rd, 2005
# Whom:	      				Peter Pentchev <roam@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Audio-Scrobbler
PORTVERSION=	0.01
PORTREVISION=	2
CATEGORIES=	audio net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	roam@FreeBSD.org
COMMENT=	A Perl interface to Last.fm / AudioScrobbler

BUILD_DEPENDS=	${SITE_PERL}/Config/IniFiles.pm:${PORTSDIR}/devel/p5-Config-IniFiles \
		p5-libwww>=5:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=		scrobbler-helper.1
MAN3=		Audio::Scrobbler.3

.include <bsd.port.mk>
