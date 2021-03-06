--- java/src/charvax/swing/text/JTextComponent.java.orig	Sat Dec 17 15:27:30 2005
+++ java/src/charvax/swing/text/JTextComponent.java	Mon Jan 29 09:39:30 2007
@@ -19,6 +19,7 @@
 
 package charvax.swing.text;
 
+import charva.awt.Font;
 import charvax.swing.JComponent;
 
 /**
@@ -72,6 +73,10 @@ public abstract class JTextComponent
         _editable = editable_;
     }
 
+    public void setFont(Font font_) {
+        _bold = ((font_.getStyle() & Font.BOLD) != 0);
+    }
+
     //====================================================================
     // INSTANCE VARIABLES
 
@@ -84,4 +89,6 @@ public abstract class JTextComponent
     protected StringBuffer _document;
 
     protected boolean _editable = true;
+
+    protected boolean _bold = false;
 }
