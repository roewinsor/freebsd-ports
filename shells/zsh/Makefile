# New ports collection makefile for:	zsh
# Date created:			11 Feb. 1995
# Whom:				torstenb
#
# $FreeBSD$
#

PORTNAME=	zsh
PORTVERSION=	4.3.15
PORTREVISION=	1
CATEGORIES=	shells
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-dev/${PORTVERSION} \
		SF/${PORTNAME}/${PORTNAME}-doc-dev/${PORTVERSION}:doc
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
.if !defined(NOPORTDOCS)
DISTFILES+=	${DISTNAME}-doc${EXTRACT_SUFX}:doc
.endif

MAINTAINER=	bapt@FreeBSD.org
COMMENT=	The Z shell

LICENSE=	ZSH
LICENSE_NAME=   ZSH license
LICENSE_FILE=	${WRKSRC}/LICENCE
LICENSE_PERMS=  ${_LICENSE_PERMS_DEFAULT}

MAKE_JOBS_UNSAFE=	yes

ZSH_VER=	${PORTVERSION}

USE_BZIP2=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
USE_NCURSES=	yes
.if !defined(WITH_ZSH_STATIC)
USE_LDCONFIG=	${PREFIX}/lib/${PORTNAME}
.endif

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-term-lib="ncursesw ncurses" --with-tcsetpgrp \
		--enable-function-subdirs

EXTRA_PATCHES=	${FILESDIR}/extra-patch-bsdtar
#EXTRA_COMPLETION_FILES=	_sockstat
#EXTRA_COMPLETION_DIR=	Completion/BSD/Command

OPTIONS=	ZSH_GDBM	"Enable GDBM support (GPL)" off \
		ZSH_MEM		"Enable zsh-mem options" off \
		ZSH_SECURE_FREE	"Enable zsh-secure-free" on \
		ZSH_MAILDIR	"Enable support for Maildirs in MAIL(PATH)" on \
		ZSH_MULTIBYTE	"Enable multibyte character support" on \
		ZSH_PCRE	"Enable PCRE support" off \
		ZSH_STATIC	"Build static executable" off

PLIST_SUB+=	ZSH_VER="${ZSH_VER}"

MAN1=		zsh.1 zshbuiltins.1 zshcompctl.1 zshcompwid.1 zshcompsys.1 \
		zshcontrib.1 zshexpn.1 zshmisc.1 zshmodules.1 zshoptions.1 \
		zshparam.1 zshroadmap.1 zshtcpsys.1 zshzftpsys.1 zshzle.1 \
		zshall.1 zshcalsys.1
DOCS=		LICENCE META-FAQ README Etc/BUGS Etc/CONTRIBUTORS Etc/FAQ \
		Etc/completion-style-guide Doc/zsh*.html Doc/zsh.dvi
PORTDOCS=	*
PORTEXAMPLES=	zlogin zshenv zshrc
SHELLS=		/etc/shells

.include <bsd.port.pre.mk>

.if defined(WITH_ZSH_GDBM)
LIB_DEPENDS+=		gdbm.4:${PORTSDIR}/databases/gdbm
PLIST_SUB+=		GDBM=""
.else
CONFIGURE_ARGS+=	--disable-gdbm
PLIST_SUB+=		GDBM="@comment "
.endif

.if defined(WITH_ZSH_PCRE)
CONFIGURE_ARGS+=	--enable-pcre
LIB_DEPENDS+=		pcre.0:${PORTSDIR}/devel/pcre
PLIST_SUB+=		PCRE=""
.else
CONFIGURE_ARGS+=	--disable-pcre
PLIST_SUB+=		PCRE="@comment "
.endif

.if defined(WITH_ZSH_MEM)
CONFIGURE_ARGS+=	--enable-zsh-mem
.endif

.if defined(WITH_ZSH_SECURE_FREE)
CONFIGURE_ARGS+=	--enable-zsh-secure-free
.endif

.if defined(WITH_ZSH_MAILDIR)
CONFIGURE_ARGS+=	--enable-maildir-support
.endif

.if defined(WITH_ZSH_STATIC)
LDFLAGS+=	-static
CONFIGURE_ARGS+=	--disable-dynamic
PLIST_SUB+=		SHARED="@comment "
.else
CONFIGURE_ARGS+=	--enable-dynamic
PLIST_SUB+=		SHARED=""
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-zsh-debug
.else
CONFIGURE_ARGS+=	--disable-zsh-debug
.endif

.if defined(WITH_ZSH_MULTIBYTE)
CONFIGURE_ARGS+=	--enable-multibyte
.else
CONFIGURE_ARGS+=	--disable-multibyte
.endif

post-patch:
	@${SED} -i "" -e "s,link=dynamic,link=either," \
		${WRKSRC}/Src/Modules/*.mdd
	@${SED} -i "" -e "s,/etc/,${LOCALBASE}/etc/," \
		${WRKSRC}/Functions/MIME/zsh-mime-setup
.ifdef EXTRA_COMPLETION_FILES
	@${ECHO} "===>  Installing extra completion files"
.for COMPFILE in ${EXTRA_COMPLETION_FILES}
	@(if [ -f ${WRKSRC}/${EXTRA_COMPLETION_DIR}/${COMPFILE} ] ; then \
		${ECHO} "${EXTRA_COMPLETION_DIR}/${COMPFILE} already exists" ; \
		exit 1 ; \
	else \
		${ECHO} ${EXTRA_COMPLETION_DIR}/${COMPFILE} ; \
		${CP} ${FILESDIR}/${COMPFILE} \
			${WRKSRC}/${EXTRA_COMPLETION_DIR}/${COMPFILE} ; \
	fi)
.endfor
.endif
	@${FIND} ${WRKSRC}/Completion -type f -iname '*.orig' -delete

post-build:
	# Fix ".so" macro problem by using "soelim" command.
	${LN} -sf ${WRKSRC}/Doc ${WRKSRC}/man1
	${MV} ${WRKSRC}/Doc/zshall.1 ${WRKSRC}/Doc/zshall.1.source
	cd ${WRKSRC} && /usr/bin/soelim ${WRKSRC}/Doc/zshall.1.source > \
		${WRKSRC}/Doc/zshall.1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/info
	makeinfo --no-split --output=${WRKSRC}/Doc/zsh.info \
		${WRKSRC}/Doc/zsh.texi
INFO=	zsh
.endif

post-install:
	${LN} ${PREFIX}/bin/zsh ${PREFIX}/bin/rzsh
	${TEST} -d ${ZSH_ETCDIR} || ${MKDIR} ${ZSH_ETCDIR}
	${TEST} -d ${ZSH_SITEFNDIR} || ${MKDIR} ${ZSH_SITEFNDIR}
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC}/StartupFiles && ${INSTALL_DATA} ${PORTEXAMPLES} ${EXAMPLESDIR}
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Doc/zsh.info ${PREFIX}/info/zsh.info
.endif
	@${ECHO_MSG} "Updating ${SHELLS}"
	@${GREP} -v ${PREFIX}/bin/r?zsh ${SHELLS}	 > ${SHELLS}.new
	@${ECHO_CMD} ${PREFIX}/bin/zsh			>> ${SHELLS}.new
	@${ECHO_CMD} ${PREFIX}/bin/rzsh			>> ${SHELLS}.new
	@${MV} ${SHELLS}.new ${SHELLS}
	@${PREFIX}/bin/zsh -fc ' \
		setopt extendedglob nomark_dirs; \
		for i in ${DATADIR}/${ZSH_VER}/functions/**/*(/) ; do \
			zcompile -U -M $$i.zwc $$i/*~*.zwc(^/) ; \
			${CHMOD} 644 $$i.zwc ; \
		done'

.include <bsd.port.post.mk>
