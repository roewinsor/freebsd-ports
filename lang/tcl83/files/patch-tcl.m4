--- tcl.m4.orig	Sat Oct 20 02:24:15 2001
+++ tcl.m4	Sat Oct 20 10:47:49 2001
@@ -957,11 +957,11 @@
 	    SHLIB_SUFFIX=".so"
 	    DL_OBJS="tclLoadDl.o"
 	    DL_LIBS=""
-	    LDFLAGS="-export-dynamic"
+	    LDFLAGS=""
 	    LD_SEARCH_FLAGS=""
 	    # FreeBSD doesn't handle version numbers with dots.
 	    UNSHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.a'
-	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so'
+	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so.1'
 	    TCL_LIB_VERSIONS_OK=nodots
 	    ;;
 	Rhapsody-*|Darwin-*)
