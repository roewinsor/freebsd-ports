# New ports collection makefile for:	libssh
# Date created:				12 April 2009
# Whom:					Alexander Logvinov <ports@logvinov.com>
#
# $FreeBSD$
#

PORTNAME=	libssh
PORTVERSION=	0.4.8
PORTREVISION=	1
CATEGORIES=	security devel
MASTER_SITES=	http://www.libssh.org/files/0.4/ \
		LOCAL/avl

MAINTAINER=	avl@FreeBSD.org
COMMENT=	A library implementing the SSH1 and SSH2 protocol

OPTIONS=	GCRYPT	"Build with libgcrypt"		off \
		SSH1	"Build with SSH1 support"	off

MAKE_JOBS_SAFE=	yes
USE_CMAKE=	yes
CMAKE_SOURCE_PATH=	${WRKSRC}
CONFIGURE_WRKSRC=	${CMAKE_SOURCE_PATH}/build
BUILD_WRKSRC=		${CONFIGURE_WRKSRC}
INSTALL_WRKSRC?=	${BUILD_WRKSRC}
CMAKE_ARGS+=	-DWITH_STATIC_LIB:BOOL=ON
USE_LDCONFIG=	yes

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/COPYING

.include <bsd.port.options.mk>

.if defined(WITH_GCRYPT)
LIB_DEPENDS+=	gcrypt.18:${PORTSDIR}/security/libgcrypt
CMAKE_ARGS+=	-DWITH_GCRYPT:BOOL=ON
.else
USE_OPENSSL=	yes
.endif

.if defined(WITH_SSH1)
CMAKE_ARGS+=	-DWITH_SSH1:BOOL=ON
PLIST_SUB+=	SSH1=""
.else
CMAKE_ARGS+=	-DWITH_SSH1:BOOL=OFF
PLIST_SUB+=	SSH1="@comment "
.endif

post-patch:
	@${MKDIR} ${BUILD_WRKSRC}
	@${RM} ${PATCH_WRKSRC}/cmake/Modules/UseDoxygen.cmake
	@${REINPLACE_CMD} -e '/add_subdirectory.*s)/d' \
		${PATCH_WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|ssh_static|ssh|' \
		${PATCH_WRKSRC}/libssh/CMakeLists.txt

.include <bsd.port.mk>
