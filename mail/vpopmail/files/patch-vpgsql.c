diff -urN -x .svn ../../vendor/vpopmail/vpgsql.c ./vpgsql.c
--- ../../vendor/vpopmail/vpgsql.c	2007-10-07 23:44:14.000000000 +0300
+++ vpgsql.c	2007-12-25 03:47:54.000000000 +0200
@@ -390,13 +390,15 @@
 #endif
 
 #ifdef ENABLE_SQL_LOGGING
-    qnprintf( sqlBufUpdate, SQL_BUF_SIZE,
+#ifdef ENABLE_SQL_REMOVE_DELETED
+    qnprintf( SqlBufUpdate, SQL_BUF_SIZE,
        "delete from vlog where domain = '%s'", domain );
     pgres=PQexec(pgc, SqlBufUpdate);
-    if( !pgres || PGresultStatus(pgres)!=PGRES_COMMAND_OK) {
+    if( !pgres || PQresultStatus(pgres)!=PGRES_COMMAND_OK) {
       return(-1);
     }
 #endif
+#endif
     return(0);
 }
 
@@ -443,14 +445,16 @@
 #endif
 
 #ifdef ENABLE_SQL_LOGGING
-    qnprintf( sqlBufUpdate, SQL_BUF_SIZE,
+#ifdef ENABLE_SQL_REMOVE_DELETED
+    qnprintf( SqlBufUpdate, SQL_BUF_SIZE,
         "delete from vlog where domain = '%s' and user='%s'", 
        domain, user );
     pgres=PQexec(pgc, SqlBufUpdate);
-    if( !pgres || PGresultStatus(pgres)!=PGRES_COMMAND_OK) {
+    if( !pgres || PQresultStatus(pgres)!=PGRES_COMMAND_OK) {
       err = -1;
     }
 #endif
+#endif
 
   return(err);
 }
@@ -1553,6 +1557,80 @@
     return valias_current->data; 
   }
 }
+
+/************************************************************************
+ *
+ *  valias_select_names
+ */
+
+char *valias_select_names( char *domain )
+{
+  PGresult *pgres;
+  int err;
+  unsigned ntuples, ctuple;
+ struct linklist *temp_entry = NULL;
+
+
+    /* remove old entries as necessary */
+    while (valias_current != NULL)
+        valias_current = linklist_del (valias_current);
+
+    if ( (err=vauth_open(0)) != 0 ) return(NULL);
+
+    qnprintf( SqlBufRead, SQL_BUF_SIZE, 
+        "select distinct alias from valias where domain = '%s' order by alias", domain );
+
+  if ( ! (pgres=PQexec(pgc, SqlBufRead))
+       || PQresultStatus(pgres) != PGRES_TUPLES_OK ) {
+    if(pgres) PQclear(pgres);
+    vcreate_valias_table();
+    if ( ! (pgres=PQexec(pgc, SqlBufRead))
+         || PQresultStatus(pgres) != PGRES_TUPLES_OK ) {
+      fprintf(stderr,"vpgsql: sql error[o]: %s\n",
+              PQerrorMessage(pgc));
+      if (pgres) PQclear (pgres);
+      return(NULL);
+    }
+  }
+
+  ntuples = PQntuples (pgres);
+  for (ctuple = 0; ctuple < ntuples; ctuple++) {
+    temp_entry = linklist_add (temp_entry, PQgetvalue (pgres, ctuple, 0), "");
+    if (valias_current == NULL) valias_current = temp_entry;
+  }
+  PQclear (pgres);
+  pgres = NULL; 
+
+    if (valias_current == NULL) return NULL; /* no results */
+    else return(valias_current->data);
+}
+
+/************************************************************************
+ *
+ *  valias_select_names_next
+ */
+
+char *valias_select_names_next()
+{
+    if (valias_current == NULL) return NULL;
+    valias_current = linklist_del (valias_current);
+ 
+    if (valias_current == NULL) return NULL; /* no results */
+    else return(valias_current->data);
+}
+
+
+/************************************************************************
+ *
+ *  valias_select_names_end
+ */
+
+void valias_select_names_end() {
+
+//  not needed by pgsql
+
+}
+
 #endif
 
 #ifdef ENABLE_SQL_LOGGING
