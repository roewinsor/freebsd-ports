
$FreeBSD: ports/www/neon/files/patch-ltmain.sh,v 1.1 2002/03/02 19:46:12 olgeni Exp $

--- ltmain.sh.orig	Wed Jan 23 11:38:40 2002
+++ ltmain.sh	Sun Feb  3 01:44:17 2002
@@ -1037,8 +1037,16 @@
 	continue
 	;;
 
+      -pthread)
+	compile_command="$compile_command -pthread"
+	finalize_command="$finalize_command -pthread"
+	compiler_flags="$compiler_flags -pthread"
+	continue
+	;;
+
       -module)
 	module=yes
+	build_old_libs=no
 	continue
 	;;
 
@@ -2412,6 +2420,9 @@
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
 	    ;;
+	  *-*-freebsd*)
+	    # FreeBSD doesn't need this...
+	    ;;
 	  *)
 	    # Add libc to deplibs on all other systems if necessary.
 	    if test "$build_libtool_need_lc" = "yes"; then
