# New ports collection makefile for:    mod_auth_kerb
# Date created:             19 October 2001
# Whom:                 wollman
#
# $FreeBSD$
#


# Shamelessly stolen from will's mod_auth_any port.

PORTNAME=	mod_auth_kerb
PORTVERSION=	5.4
PORTREVISION=	3
CATEGORIES=	www
MASTER_SITES=	SF/modauthkerb/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}

MAINTAINER=	apache@FreeBSD.org
COMMENT=	An Apache module for authenticating users with Kerberos v5

MAKE_JOBS_SAFE=  yes

LATEST_LINK=   mod_auth_kerb2

USE_APACHE=	20+
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

BUILD_DEPENDS=  gsed:${PORTSDIR}/textproc/gsed

PORTSCOUT=	limit:^5.3

.if defined(KRB5_HOME)
BUILD_DEPENDS+=	${KRB5_HOME}/lib/libgssapi_krb5.so:${PORTSDIR}/security/krb5
RUN_DEPENDS+=	${KRB5_HOME}/lib/libgssapi_krb5.so:${PORTSDIR}/security/krb5
CONFIGURE_ARGS+=	--with-krb5=${KRB5_HOME} --without-krb4
.elif defined(HEIMDAL_HOME)
BUILD_DEPENDS+=	${HEIMDAL_HOME}/lib/libgssapi.so:${PORTSDIR}/security/heimdal
RUN_DEPENDS+=	${HEIMDAL_HOME}/lib/libgssapi.so:${PORTSDIR}/security/heimdal
CONFIGURE_ARGS+=	--with-krb5=${HEIMDAL_HOME} --without-krb4
.elif exists(${DESTDIR}/usr/lib/libkrb5.a) && exists(${DESTDIR}/usr/bin/krb5-config)
CONFIGURE_ARGS+=	--with-krb5=${DESTDIR}/usr --without-krb4
.else
LIB_DEPENDS+=	gssapi_krb5:${PORTSDIR}/security/krb5
CONFIGURE_ARGS+=	--with-krb5=${LOCALBASE} --without-krb4
.endif

.include <bsd.port.mk>
