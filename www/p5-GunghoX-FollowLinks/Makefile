# New ports collection makefile for:	GunghoX::FollowLinks
# Date created:		31 Dec 2011
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	GunghoX-FollowLinks
PORTVERSION=	0.00006
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/D/DM/DMAKI
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Perl extension to follow links within responses for Gungho

RUN_DEPENDS=	\
	p5-Gungho>=0.09.005:${PORTSDIR}/www/p5-Gungho \
	p5-HTML-Parser>0:${PORTSDIR}/www/p5-HTML-Parser \
	p5-HTML-Tagset>0:${PORTSDIR}/www/p5-HTML-Tagset \
	p5-MIME-Types>0:${PORTSDIR}/mail/p5-MIME-Types \
	p5-Sub-Exporter>0:${PORTSDIR}/devel/p5-Sub-Exporter \
	p5-URI-Match>0:${PORTSDIR}/net/p5-URI-Match
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	GunghoX::FollowLinks.3 \
	GunghoX::FollowLinks::Filter.3 \
	GunghoX::FollowLinks::Parser.3 \
	GunghoX::FollowLinks::Parser::HTML.3 \
	GunghoX::FollowLinks::Parser::Text.3 \
	GunghoX::FollowLinks::Rule.3 \
	GunghoX::FollowLinks::Rule::Allow.3 \
	GunghoX::FollowLinks::Rule::Deny.3 \
	GunghoX::FollowLinks::Rule::Fresh.3 \
	GunghoX::FollowLinks::Rule::Fresh::Cache.3 \
	GunghoX::FollowLinks::Rule::Fresh::Memory.3 \
	GunghoX::FollowLinks::Rule::HTML::SelectedTags.3 \
	GunghoX::FollowLinks::Rule::MIME.3 \
	GunghoX::FollowLinks::Rule::URI.3

.include <bsd.port.mk>
