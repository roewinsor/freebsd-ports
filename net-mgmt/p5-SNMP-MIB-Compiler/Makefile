# New ports collection makefile for:	p5-SNMP-MIB-Compiler
# Date created:				December 12, 2001
# Whom:	      				Joe Clarke <marcus@marcuscom.com
#
# $FreeBSD$
#

PORTNAME=	SNMP-MIB-Compiler
PORTVERSION=	0.06
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	marcus@FreeBSD.org
COMMENT=	A Perl MIB compiler supporting both SMIv1 and SMIv2

BUILD_DEPENDS=	${SITE_PERL}/Data/Compare.pm:${PORTSDIR}/devel/p5-Data-Compare

PERL_CONFIGURE=	yes

MAN3=		SNMP::MIB::Compiler.3 \
		Bundle::SNMP::MIB::Compiler.3

.include <bsd.port.mk>
