# New ports collection makefile for:	py-django-caching-app-plugins
# Date created:				12 January 2012
# Whom:					Kevin Golding <ports@caomhin.org>
#
# $FreeBSD$
#

PORTNAME=	django-caching-app-plugins
PORTVERSION=	0.1.3
CATEGORIES=	www python
MASTER_SITES=	http://www.caomhin.org/ports/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@caomhin.org
COMMENT=	Django app for writting pluggable reusable django applications

LICENSE=	BSD

RUN_DEPENDS=	${PYTHON_SITELIBDIR}/django/bin/django-admin.py:${PORTSDIR}/www/py-django

WRKSRC=		${WRKDIR}/bkroeze-django-caching-app-plugins-tip
USE_PYTHON=	yes
USE_PYDISTUTILS=	easy_install

.include <bsd.port.mk>
