# New ports collection makefile for:	sccmilter
# Date created:				25 Jul 2003
# Whom:					Rashid N. Achilov <shelton@granch.ru>
#
# $FreeBSD$
#

PORTNAME=	sccmilter
PORTVERSION=	0.95.7
PORTREVISION=	2
CATEGORIES=	mail sysutils
MASTER_SITES=	http://openoffice.mirahost.ru/fileZ/ports/ \
		http://citycat4.land.ru/

MAINTAINER=	citycat4@ngs.ru
COMMENT=	Sendmail spam control and canceling filter, based on Milter API

.if !exists(/usr/lib/libmilter.a)
IGNORE=		requires Sendmail 8.12; upgrade the base system
.endif

USE_BZIP2=		yes
USE_RC_SUBR=		yes
USE_AUTOTOOLS=	autoconf

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--localstatedir=/var

WRKSRC=		${WRKDIR}/${PORTNAME}

MAN5=		sccmilter.conf.5 scchosts.5 sccusers.5
MAN8=		sccmilter.8

CPPFLAGS+=	${PTHREAD_CFLAGS} -I${LOCALBASE}/include
LDFLAGS+=	${PTHREAD_LIBS} -L${LOCALBASE}/lib

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--with-debug
.endif

pre-configure:
	@${ECHO_MSG} ""
	@${ECHO_MSG} "For debugging information support you should specify"
	@${ECHO_MSG} "	WITH_DEBUG=yes (press Ctrl-C here and start make WITH_DEBUG=yes)"
	@${ECHO_MSG} ""
	@sleep 2

post-install:
	${STRIP_CMD} ${PREFIX}/libexec/sccmilter
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in CHANGES FAQ README TODO
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif
	@${CAT} ${PKGMESSAGE}

post-deinstall:
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Do not forget delete filter description from /etc/mail/freebsd.mc"
	@${ECHO_MSG} "and rebuild sendmail.cf file!"
	@${ECHO_MSG} ""

.include <bsd.port.mk>
