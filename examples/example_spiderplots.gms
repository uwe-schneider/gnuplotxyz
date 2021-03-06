* Note - Spiderplots require GNUPLOT 5.4

$oneolcom

Sets
SDG       /Livelihood,Nutrition,Wildlife,Climate/
Scenario  /"Diet Change","Carbon Tax","Business as Usual"/
Expert    /"Ms J","Mr U","Ms L"/
Score     /Age,Size,Strength,Wisdom,Hair,GAMS,EPIC,Income/
;

Table spiderplot_IAM(Scenario,SDG)
                        Livelihood   Nutrition   Wildlife   Climate
"Diet Change"                40          20         40         35
"Carbon Tax"                 30          25         70         30
"Business as Usual"          60          80         77         85
;

Table spiderplot_experts(Expert,Score)
           Age   Size  Strength Wisdom  Hair  GAMS   EPIC  Income
 "Ms J"     27   17.5      84     80     100    92     17     32
 "Mr U"     53   18.3      91     70      10    95     60     50
 "Ms L"     39   17.1      70     90      80     9     98     60
;

* Example 1: minimum spider plot syntax
$setglobal gp_style spiderplot
$libinclude gnuplotxyz spiderplot_IAM


* Example 2:
$setglobal gp_style spiderplot
$setglobal gp_spiderplot_style1 fs transparent solid 0.4 border             !! change fillstyle (fs) and border
$setglobal gp_linewidth 2                                                   !! change linewidth (lw), point type (pt) and point size (ps)
$setglobal gp_spiderplot_style2 lw 3 pt 6 ps 2
$setglobal gp_tmargin 5                                                     !! change margins
$setglobal gp_bmargin 5
$setglobal gp_key 'at 1.5,1.3'                                              !! define key locations
$setglobal gp_lc_1 red                                                      !! specific line colors
$setglobal gp_lc_2 green
$setglobal gp_lc_3 orange
$setglobal gp_spider_label font ",16" textcolor lt -1 norotate offset 1     !! labels
$libinclude gnuplotxyz spiderplot_IAM



* Example 3
$setglobal gp_style spiderplot
$setglobal gp_grid spider                                                   !! change grid
$setglobal gp_spiderplot_style1 fs transparent solid 0.05 border            !! change fillstyle (fs) and border
$setglobal gp_linewidth 2                                                   !! change linewidth (lw), point type (pt) and point size (ps)
$setglobal gp_spiderplot_style2 lw 3 pt 4 ps 0.5
$setglobal gp_key no                                                        !! switch key off
$ontext
define length of rays:
$setglobal gp_spider_range automax_ijk                                      !! calculate upper value for each ray automatically
$setglobal gp_spider_range automax_equ                                      !! calculate global upper value for all rays automatically (default)
$setglobal gp_spider_range 150                                              !! ranges all rays from 0 to 150
$offtext
$setglobal gp_spider_range 130
$setglobal gp_spider_range automax_equ
$libinclude gnuplotxyz spiderplot_experts


* Example 4
$setglobal gp_style spiderplot
$setglobal gp_spider_range automax_ijk
$setglobal gp_spider_tics axis in scale 0.25,0.25 nomirror norotate  autojustify norangelimit autofreq  font ",14"
$setglobal gp_spider_label   font ",18" textcolor lt -1 norotate offset 2
$setglobal gp_key_style boxes                                               !! define key style and location
$setglobal gp_key 'at -1.5,1.3'
$libinclude gnuplotxyz spiderplot_experts



