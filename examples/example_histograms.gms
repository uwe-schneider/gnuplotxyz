set
lines    /USA,Germany,Poland,Australia,Canada/
section  /Emission,Employment/
;
Parameter histfigure(lines,section)
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
;

* Figure 1: Default histogram
$setglobal gp_title   "Figure 1: Default histogram"
$setglobal gp_ylabel  "Change (in percent)"
$setglobal gp_fontsize "16"
$setglobal gp_key     "at-0.5,10"
$setglobal gp_xlabel  no
$setglobal gp_xrange  "-1.5:1.5"
$setglobal gp_yrange  "0:10"
$setglobal gp_style   histogram
$setglobal gp_bmargin  4
$libinclude gnuplotxyz histfigure
$setglobal gp_xlabeloffset  no


* Figure 2: Rowstacked histogram
$setglobal gp_xrange  "no"
$setglobal gp_title   "Figure 2: Rowstacked histogram"
$setglobal gp_key     "outside width -7"
$setglobal gp_yrange  "0:40"
$setglobal gp_hist    rowstacked
$setglobal gp_fill    pattern
$setglobal gp_boxwid  "0.7 relative"
$setglobal gp_xtics   "nomirror"
$libinclude gnuplotxyz histfigure


* Figure 3: Columnstacked histogram
$setglobal gp_title   "Figure 3: Columnstacked histogram"
$setglobal gp_yrange  "0:22"
$setglobal gp_hist    "columnstacked"
$setglobal gp_fill    'solid 1'
$libinclude gnuplotxyz histfigure


* Figure 4: Default histogram with solid fill and custom line colors
$setglobal gp_style   histogram
$setglobal gp_hist    no
$setglobal gp_boxwid  no
$setglobal gp_fill    'solid 1'
$setglobal gp_title   "Figure 4: Default histogram with solid fill and custom line colors"
$setglobal gp_ylabel  "Change (in percent)"
$setglobal gp_xlabel  no
$setglobal gp_yrange  "0:12"
$setglobal gp_lc_1    black
$setglobal gp_lc_2    yellow
$setglobal gp_lc_3    orange
$setglobal gp_lc_4    cornflowerblue
$setglobal gp_lc_5    green
$libinclude gnuplotxyz histfigure


* Figure 5: Histogram with formatted x-axis labels
$setglobal gp_title   "Figure 5: Histogram with formatted x-axis labels"
$setglobal gp_fontsize 20
$setglobal gp_xtics   'nomirror rotate by 320 font "Times New Roman, 13"'
$setglobal gp_lc_1    crimson
$setglobal gp_lc_2    deepskyblue
$libinclude gnuplotxyz histfigure
