--- src/ptytty.c.orig	2005-10-17 09:36:46.000000000 +0200
+++ src/ptytty.c	2007-09-27 14:12:26.000000000 +0200
@@ -41,7 +41,7 @@
 #ifdef HAVE_SYS_IOCTL_H
 # include <sys/ioctl.h>
 #endif
-#if defined(PTYS_ARE_PTMX) && !defined(__CYGWIN32__)
+#if defined(PTYS_ARE_PTMX) && !defined(__CYGWIN32__) && !defined(__FreeBSD__)
 # include <sys/stropts.h>	/* for I_PUSH */
 #endif
 
@@ -159,11 +159,19 @@
     char pty_name[] = "/dev/pty??";
     char tty_name[] = "/dev/tty??";
 
-# ifndef PTYCHAR1
-#  define PTYCHAR1	"pqrstuvwxyz"
-# endif
-# ifndef PTYCHAR2
-#  define PTYCHAR2	"0123456789abcdef"
+# ifdef __FreeBSD__
+/* Auto-detected pty names do not work well with devfs! */
+#  undef  PTYCHAR1
+#  define PTYCHAR1	"pqrsPQRS"
+#  undef  PTYCHAR2
+#  define PTYCHAR2	"0123456789abcdefghijklmnopqrstuv"
+# else
+#  ifndef PTYCHAR1
+#   define PTYCHAR1	"pqrstuvwxyz"
+#  endif
+#  ifndef PTYCHAR2
+#   define PTYCHAR2	"0123456789abcdef"
+#  endif
 # endif
     for (c1 = PTYCHAR1; *c1; c1++) {
       pty_name[(sizeof(pty_name) - 3)] =
