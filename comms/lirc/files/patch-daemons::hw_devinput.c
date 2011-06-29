--- daemons/hw_devinput.c.orig
+++ daemons/hw_devinput.c
@@ -376,9 +376,15 @@ int devinput_decode(struct ir_remote *re
 	return 1;
 }
 
+/* simulate key repeat if receiving the same scancode again */
+#define RPT_SCAN
+
 char *devinput_rec(struct ir_remote *remotes)
 {
 	struct input_event event;
+#ifdef RPT_SCAN
+	static struct input_event rptevent, scancodeevent;
+#endif
 	int rd;
 	ir_code value;
 
@@ -399,6 +405,23 @@ char *devinput_rec(struct ir_remote *rem
 	LOGPRINTF(1, "time %ld.%06ld  type %d  code %d  value %d", event.time.tv_sec, event.time.tv_usec, event.type,
 		  event.code, event.value);
 
+#ifdef RPT_SCAN
+	repeat_state = RPT_UNKNOWN;
+	if (event.type == EV_KEY)
+		rptevent = event;
+	else if (event.type == EV_MSC && event.code == MSC_SCAN) {
+		if (scancodeevent.type == EV_MSC &&
+		    event.value == scancodeevent.value) {
+			if (rptevent.type == EV_KEY && rptevent.value != 0) {
+				event = rptevent;
+				event.value = 2;
+				repeat_state = RPT_YES;
+			}
+		} else if (rptevent.type == EV_KEY && rptevent.value == 0) {
+			scancodeevent = event;
+		}
+	}
+#endif
 	value = (unsigned)event.value;
 #ifdef EV_SW
 	if (value == 2 && (event.type == EV_KEY || event.type == EV_SW)) {
@@ -418,6 +441,9 @@ char *devinput_rec(struct ir_remote *rem
 		if (event.value == 2) {
 			repeat_state = RPT_YES;
 		} else {
+#ifdef RPT_SCAN
+			if (repeat_state == RPT_UNKNOWN)
+#endif
 			repeat_state = RPT_NO;
 		}
 	} else {