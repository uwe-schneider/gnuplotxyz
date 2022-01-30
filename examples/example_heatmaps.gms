
Sets Slope /S1*S10/, FallowLength /L1*L8/, DataItem /Slope,Length,Erosion/ ;
Parameter Erosion_Data;
Erosion_Data(Slope,FallowLength,"Slope")   = ord(slope)/20;
Erosion_Data(Slope,FallowLength,"Length")  = ord(FallowLength);
Erosion_Data(Slope,FallowLength,"Erosion") = Max(0,uniform(20*ord(slope),40*ord(slope))-uniform(0.1,0.3)*ord(FallowLength));
Display Erosion_Data;

* Figure 1 - Defaults
$setglobal gp_title "Heatmap 1 - default display"
$setglobal gp_style heatmap
$libinclude gnuplotxyz Erosion_Data

* Figure 2 - Adjust margins to have color legend label appear
$setglobal gp_title "Heatmap 2 - Adjust margins and axis ranges"
$setglobal gp_lmargin at screen 0.1
$setglobal gp_rmargin at screen 0.85
$setglobal gp_xrange  0.05:0.5
$setglobal gp_yrange  1:8
$setglobal gp_cbrange 0:400
$libinclude gnuplotxyz Erosion_Data

* Figure 3 - Change X Y Z Axis Arrangement
$setglobal gp_title "Heatmap 3 - X=Slope Y=Erosion Z=Length"
$setglobal gp_heatmap_x  Slope
$setglobal gp_heatmap_y  Erosion
$setglobal gp_heatmap_z  Length
$setglobal gp_xrange  no
$setglobal gp_yrange  no
$setglobal gp_cbrange  no
$libinclude gnuplotxyz Erosion_Data
$dropglobal gp_ylabel

* Figure 4 - Interpolate values
$setglobal gp_heatmap_x  Slope
$setglobal gp_heatmap_y  Length
$setglobal gp_heatmap_z  Erosion
$setglobal gp_xrange  0.05:0.5
$setglobal gp_yrange  1:8
$setglobal gp_cbrange 0:400

$setglobal gp_title "Heatmap 4 - Interpolate values"
$setglobal gp_pm3d map interpolate 0,0
$libinclude gnuplotxyz Erosion_Data

* Figure 5 - Adjust color palette
$setglobal gp_title "Heatmap 5 - Adjust color palette"
$setglobal gp_palette rgbformulae 34,35,36
$libinclude gnuplotxyz Erosion_Data

* Figure 6 - Adjust color palette
$setglobal gp_title "Heatmap 6 - Use reverse color palette"
$setglobal gp_palette negative rgbformulae 34,35,36
$libinclude gnuplotxyz Erosion_Data

$exit

* More color palettes
$setglobal gp_title "traditional pm3d\n(black-blue-red-yellow)"
$setglobal gp_palette rgb 7,5,15
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "green-red-violet"
$setglobal gp_palette rgb 3,11,6
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "ocean (green-blue-white)\ntry also other permutations"
$setglobal gp_palette rgb 23,28,3
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "hot (black-red-yellow-white)"
$setglobal gp_palette rgb 21,22,23
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "color printable on gray\n(black-blue-violet-yellow-white)"
$setglobal gp_palette rgb 30,31,32
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "rainbow (blue-green-yellow-red)"
$setglobal gp_palette rgb 33,13,10
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "AFM hot (black-red-yellow-white)"
$setglobal gp_palette rgb 34,35,36
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "HSV model\n(red-yellow-green-cyan-blue-magenta-red)"
$setglobal gp_palette model HSV rgb 3,2,2
$libinclude gnuplotxyz Erosion_Data

$setglobal gp_title "gray palette"
$setglobal gp_palette gray
$libinclude gnuplotxyz Erosion_Data


* Adjust labeloffset (default for heatmap is 1.5,0
*$setglobal gp_cblabeloffset 1.5,0

