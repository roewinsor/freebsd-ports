--- choparp.c.orig	Fri Nov  8 07:36:03 2002
+++ choparp.c	Thu Apr 20 23:56:38 2006
@@ -42,6 +42,7 @@
 #include <string.h>
 #include <sys/types.h>
 #include <fcntl.h>
+#include <sys/event.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
 #include <net/bpf.h>
@@ -239,6 +240,10 @@
 	fprintf(stderr,"checkarp: WARNING: received unknown type ARP request.\n");
 	return(0);
     }
+    if (ntohl(*(u_int32_t *)(arp->arp_tpa)) == ntohl(*(u_int32_t *)(arp->arp_spa))) {
+	fprintf(stderr,"checkarp: WARNING: sender equal dest.\n");
+	return(0);
+    }
     target_ip = ntohl(*(u_int32_t *)(arp->arp_tpa));
     return match(target_ip, targets) && !match(target_ip, excludes);
 }
@@ -280,13 +285,22 @@
     char    *rframe;
     char    *sframe;
     size_t  frame_len;
-    fd_set  fdset;
+    int     kq;
+    struct  kevent kev;
 
-    FD_ZERO(&fdset);
-    FD_SET(fd,&fdset);
+    if ((kq = kqueue()) < 0) {
+        perror("kqueue");
+        return;
+    }
+
+    EV_SET(&kev, fd, EVFILT_READ, EV_ADD, 0, 0, NULL);
+    if (kevent(kq, &kev, 1, NULL, 0, NULL) < 0 ) {
+        perror("kevent");
+        return;
+    }
 
     for(;;){
-        int r = select(fd+1,&fdset, 0, 0, 0);
+        int r = kevent(kq, NULL, 0, &kev, 1, NULL);
 
         if (r < 0) {
             if (errno == EINTR)
@@ -295,7 +309,7 @@
             return;
         }
 
-        rlen = read(fd, buf, buflen);
+        rlen = read(kev.ident, buf, buflen);
         if (rlen < 0) {
             if (errno == EINTR)
                 continue;
@@ -307,7 +321,7 @@
 	while((rframe = getarp(p, rlen, &nextp, &nextlen)) != NULL){
 	    if (checkarp(rframe)){
 		sframe = gen_arpreply(rframe, &frame_len);
-		write(fd, sframe, frame_len);
+		write(kev.ident, sframe, frame_len);
 	    }
 	    p = nextp;
 	    rlen = nextlen;
@@ -437,6 +451,9 @@
 #endif
     if ((fd = openbpf(ifname, &buf, &buflen)) < 0)
 	return(-1);
+	#ifndef DEBUG
+    		daemon(0, 0);
+	#endif
     loop(fd, buf, buflen);
     return(-1);
 }
