Sets
Polygon     Polygons     /"Ms J","Mr U","Ms L"/
Score       Scores       /Age,Size,Strength,Wisdom,Hair,GAMS,EPIC,Money/
;

Table plot_2D(Polygon,Score)
           Age   Size  Strength Wisdom  Hair  GAMS   EPIC  Money
 "Ms J"     27   17.5      80     80     100    95     20     30
 "Mr U"     53   18.3      90     70      10   100     60     40
 "Ms L"     39   17.1      70     90      80     5     99     80
;


* Example 1
* required spider plot syntax
$setglobal gp_style spiderplot
$libinclude gnuplotxyz plot_2d




* Example 2
* change various options


* switch key off or define kex locations
*$setglobal gp_key no
$setglobal gp_key 'at -1.5,1.3'
$setglobal gp_key_style boxes

* change grid
$setglobal gp_grid spider

* change fillstyle (fs) and border
$setglobal gp_spiderplot_style1 fs transparent solid 0.05 border

* change linewidth (lw), point type (pt) and point size (ps)
$setglobal gp_linewidth 2
$setglobal gp_spiderplot_style2 lw 3 pt 6 ps 2

* change margins
$setglobal gp_tmargin 5
$setglobal gp_bmargin 5

* define length of rays:
* automax_ijk => calculate upper value for each ray automatically
* automax_equ => calculate global upper value for all rays automatically
* number => puts the same number on all rays
*$setglobal gp_spider_range automax_ijk
*$setglobal gp_spider_range automax_equ
$setglobal gp_spider_range 130


*$setglobal gp_spider_tics axis in scale 1,0.5 nomirror norotate  autojustify norangelimit autofreq  font ",9"
$setglobal gp_spider_tics axis in scale 1,0.5 nomirror norotate  autojustify norangelimit autofreq  font ",14"
$setglobal gp_spider_label   font ",18" textcolor lt -1 norotate offset 2

* line colors
$setglobal gp_lc_1 red
$setglobal gp_lc_2 green
$setglobal gp_lc_3 orange

* required spider plot syntax
$setglobal gp_style spiderplot
$libinclude gnuplotxyz plot_2d



