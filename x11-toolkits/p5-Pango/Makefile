# New ports collection makefile for:		x11-toolkits/p5-Pango
# Date created:					Oct 30 2009
# Whom:						Cheng-Lung Sung <clsung@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Pango
PORTVERSION=	1.223
CATEGORIES=	x11-toolkits lang perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	swills@FreeBSD.org
COMMENT=	Perl module for layout and render i18n text

BUILD_DEPENDS=	p5-ExtUtils-Depends>=0.300:${PORTSDIR}/devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1.03:${PORTSDIR}/devel/p5-ExtUtils-PkgConfig \
		p5-Cairo>=1:${PORTSDIR}/graphics/p5-Cairo \
		p5-Glib2>=1.220:${PORTSDIR}/devel/p5-Glib2
RUN_DEPENDS=	p5-Glib2>=1.220:${PORTSDIR}/devel/p5-Glib2

USE_GNOME=	pango
PERL_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=yes

post-install:
	@cd ${WRKSRC}/blib/man3 && ${FIND} * -name "*.3" | ${SED} \
		's,^,${MAN3PREFIX:S,^${PREFIX}/,,}/man/man3/,' >> ${TMPPLIST}

.include <bsd.port.mk>
