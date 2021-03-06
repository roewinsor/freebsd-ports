# ex:ts=8
# Ports collection makefile for:	libEtPan!
# Date created:			Jun 27, 2002
# Whom:				ijliao
#
# $FreeBSD$
#

PORTNAME=	libetpan
PORTVERSION=	1.1
CATEGORIES=	mail ipv6
MASTER_SITES=	SF

MAINTAINER=	pawel@FreeBSD.org
COMMENT=	A mail library

LICENSE=	BSD

LIB_DEPENDS=	curl:${PORTSDIR}/ftp/curl \
		expat:${PORTSDIR}/textproc/expat2 \
		sasl2.2:${PORTSDIR}/security/cyrus-sasl2

USE_ICONV=	yes
USE_AUTOTOOLS=	libtool autoconf
USE_LDCONFIG=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

OPTIONS=	GNUTLS	"Enable gnuTLS support" off \
		IPV6	"Enable ipv6 support." on

.if defined(WITH_GNUTLS)
LIB_DEPENDS+=	gnutls.47:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--without-openssl --with-gnutls
.else
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--without-gnutls
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.else
CONFIGURE_ARGS+=	--enable-ipv6
.endif

AUTOTOOLSFILES=	aclocal.m4

post-patch:
	@${REINPLACE_CMD} -e 's|2.61|%%AUTOCONF_VERSION%%|g' ${WRKSRC}/aclocal.m4

.include <bsd.port.mk>
