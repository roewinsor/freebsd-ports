# New ports collection makefile for:	p5-Gtk
# Date created:		28 Oct 1997
# Whom:	      		Vanilla I. Shu <vanilla@MinJe.com.TW>
#
# $FreeBSD$
#

PORTNAME=	Gtk
PORTVERSION=	0.7009
PORTREVISION=	4
CATEGORIES=	x11-toolkits lang perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-Perl-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	The base module of Gtk-Perl

BUILD_DEPENDS=	${SITE_PERL}/XML/Writer.pm:${PORTSDIR}/textproc/p5-XML-Writer \
		${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser

USE_GNOME=	gtk12
PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-guessing --lazy-load
MAKE_JOBS_UNSAFE=	yes

MAN3=		Gtk.3pm \
		Gtk::CListModel.3pm \
		Gtk::cookbook.3pm \
		Gtk::objects.3pm \
		Gtk::reference.3pm

.include <bsd.port.mk>
