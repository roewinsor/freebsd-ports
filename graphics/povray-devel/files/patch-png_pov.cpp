--- source/png_pov.cpp.orig	2004-08-03 01:11:37.000000000 +0200
+++ source/png_pov.cpp	2010-03-29 14:06:26.000000000 +0200
@@ -1428,7 +1428,7 @@
 		if(r_info_ptr->valid & PNG_INFO_tRNS)
 		{
 			for (index = 0; index < r_info_ptr->num_trans; index++)
-				cmap[index].Transmit = 255 - r_info_ptr->trans[index];
+				cmap[index].Transmit = 255 - r_info_ptr->trans_alpha[index];
 		}
 
 		Image->data.map_lines = (unsigned char **)POV_MALLOC(height * sizeof(unsigned char *), "PNG image");
@@ -1461,7 +1461,7 @@
 		if(r_info_ptr->valid & PNG_INFO_tRNS)
 		{
 			for (index = 0; index < r_info_ptr->num_trans; index++)
-				cmap[index].Transmit = 255 - r_info_ptr->trans[index];
+				cmap[index].Transmit = 255 - r_info_ptr->trans_alpha[index];
 		}
 
 		Image->data.map_lines = (unsigned char **)POV_MALLOC(height * sizeof(unsigned char *), "PNG image");
