# New ports collection makefile for:	www/p5-CGI-Application-Plugin-HtmlTidy
# Date created:				14 September 2005
# Whom:					George Hartzell <hartzell@alerce.com>
#
# $FreeBSD$
#

PORTNAME=	CGI-Application-Plugin-HtmlTidy
PORTVERSION=	1.04
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	hartzell@alerce.com
COMMENT=	Add HTML::Tidy support to CGI::Application

BUILD_DEPENDS=	p5-CGI-Application>4.01:${PORTSDIR}/www/p5-CGI-Application \
		${SITE_PERL}/CGI/Application/Plugin/DevPopup.pm:${PORTSDIR}/www/p5-CGI-Application-Plugin-DevPopup \
		p5-HTML-Tidy>=1.08:${PORTSDIR}/textproc/p5-HTML-Tidy
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	CGI::Application::Plugin::HtmlTidy.3

.include <bsd.port.mk>
