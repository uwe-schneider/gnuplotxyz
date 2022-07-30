$setglobal gp_term svg

Sets
Country      /USA,Germany,Poland,Australia,Canada/
Indicator    /Emission,Employment/
Machinery    /Tractor,Combine,Trailer/
Observation  /1*12/
DataItem     /Price,Quantity/
;
Parameter HistogramFigure(Country,Indicator)
/
USA.Emission               8
USA.Employment             9
Germany.Emission           4
Germany.Employment         6
Poland.Emission            3
Poland.Employment          4
Australia.Emission         9
Australia.Employment       7
Canada.Emission            4
Canada.Employment          6
/
LineFigure(Machinery,Observation,DataItem)
;

LineFigure(Machinery,Observation,"price")    = ord(Observation)+20-ord(Machinery);
LineFigure(Machinery,Observation,"quantity") = ord(Observation);


* Figure 1: Assign Color Fractions from HSV Model Palette
$setglobal gp_palette_fractions  5
$setglobal gp_palette model HSV rgb 3,2,2
$setglobal gp_title   "Figure 1: Assign Color Fractions from HSV Model Palette"
$setglobal gp_yrange 0:10
$libinclude gnuplotxyz HistogramFigure

* Figure 2: green-red-violet Palette
$setglobal gp_palette rgb 3,11,6
$setglobal gp_title   "Figure 2: green-red-violet Palette"
$libinclude gnuplotxyz HistogramFigure

* Figure 3: Change CB Range,Ocean (green-blue-white) Palette
$setglobal gp_palette rgb 23,28,3
$setglobal gp_cbrange 0:1
$setglobal gp_title   "Figure 3: Change CB Range,Ocean (green-blue-white) Palette"
$libinclude gnuplotxyz HistogramFigure

* Figure 4: Traditional (black-blue-red-yellow) Palette
$setglobal gp_palette rgb 7,5,15
$setglobal gp_palette_fractions 3
$setglobal gp_linewidth 2
$setglobal gp_yrange no
$setglobal gp_title   "Figure 4: Traditional (black-blue-red-yellow) Palette"
$libinclude gnuplotxyz LineFigure Quantity Price

* Figure 5: Color Printable on Gray (black-blue-violet-yellow-white) Palette
$setglobal gp_palette rgb 30,31,32
$setglobal gp_palette_fractions 5
$setglobal gp_xlabel no
$setglobal gp_yrange 0:10
$setglobal gp_title   "Figure 5: Color Printable on Gray (black-blue-violet-yellow-white) Palette"
$libinclude gnuplotxyz HistogramFigure

* Figure 6: Switch off colorbox, AFM hot (black-red-yellow-white) Palette
$setglobal gp_colorbox no
$setglobal gp_palette negative rgb 34,35,36
$setglobal gp_title   "Figure 6: Switch off colorbox, AFM hot (black-red-yellow-white) Palette"
$libinclude gnuplotxyz HistogramFigure









* "hot (black-red-yellow-white)"
*$setglobal gp_palette rgb 21,22,23


* "rainbow (blue-green-yellow-red)"
*$setglobal gp_palette rgb 33,13,10



* "gray palette"
*$setglobal gp_palette gray






