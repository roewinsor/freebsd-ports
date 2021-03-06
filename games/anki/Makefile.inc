# $FreeBSD: ports/games/anki/Makefile.inc,v 1.11 2011/07/20 20:09:09 shaun Exp $

PORTNAME=	anki
PORTVERSION=	1.2.8
PORTREVISION?=	1
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
EXTRACT_SUFX=	.tgz

USE_PYTHON=	yes
USE_GETTEXT=	yes
USE_PYDISTUTILS=	easy_install

.if !defined(PKGNAMEPREFIX)
BUILD_DEPENDS=	${PYNUMPY} \
		py*-qt4-core>=4.4:${PORTSDIR}/devel/py-qt4-core \
		py*-sip>=4.6:${PORTSDIR}/devel/py-sip \
		py*-matplotlib>=0.90.0:${PORTSDIR}/math/py-matplotlib \
		py*-qt4-gui>=4.4:${PORTSDIR}/x11-toolkits/py-qt4-gui
RUN_DEPENDS:=	${BUILD_DEPENDS} \
		py*-anki>=1.2.8:${PORTSDIR}/games/py-anki \
		py*-svg>=4.4:${PORTSDIR}/graphics/py-qt4-svg \
		py*-network>=4.4:${PORTSDIR}/net/py-qt4-network \
		py*-webkit>=4.4:${PORTSDIR}/www/py-qt4-webkit

USE_QT_VER=	4
QT_COMPONENTS=	corelib gui
PYDISTUTILS_PKGNAME=	ankiqt

PORT_VERBS=	ankiqt
DESKTOP_ENTRIES=	"${PORTNAME}" \
		"${COMMENT}" \
		"" \
		"anki" \
		"Education;Languages;Qt;" \
		false
.else
BUILD_DEPENDS=	${PYNUMPY} \
		${PYTHON_SITELIBDIR}/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3 \
		py*-sqlalchemy06>=0:${PORTSDIR}/databases/py-sqlalchemy06 \
		py*-game>=0:${PORTSDIR}/devel/py-game \
		py*-simplejson>=0:${PORTSDIR}/devel/py-simplejson \
		py*-matplotlib>=0.90.0:${PORTSDIR}/math/py-matplotlib
RUN_DEPENDS:=	${BUILD_DEPENDS}

PLIST=		${PKGDIR}/pkg-plist.py-anki
WRKSRC=		${WRKDIR}/${DISTNAME}/lib${PORTNAME}
.endif

post-patch:
.if !defined(PKGNAMEPREFIX)
	@${REINPLACE_CMD} -e '/req/d' ${WRKSRC}/setup.py
.endif

.include <bsd.port.mk>
