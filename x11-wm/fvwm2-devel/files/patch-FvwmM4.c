--- modules/FvwmM4/FvwmM4.c.orig	Tue Jun 18 04:53:39 2002
+++ modules/FvwmM4/FvwmM4.c	Mon Jul  1 00:02:14 2002
@@ -71,7 +71,7 @@
 int  m4_prefix_defines;		/* Add "m4_" to the names of the defines */
 char m4_options[BUFSIZ];	/* Command line options to m4 */
 char m4_outfile[BUFSIZ] = "";	/* The output filename for m4 */
-char *m4_prog = "m4";		/* Name of the m4 program */
+char *m4_prog = "gm4";		/* Name of the m4 program */
 int  m4_default_quotes;		/* Use default m4 quotes */
 char *m4_startquote = "`";	   /* Left quote characters for m4 */
 char *m4_endquote = "'";	   /* Right quote characters for m4 */
