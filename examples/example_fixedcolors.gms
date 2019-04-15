Sets
scenario     Scenarios     /Tractor,Combine,Trailer/,
obsrvation   Observations  /1*12/,
item         Items         /price,quantity/;

Parameters
fixedcol_line(scenario,obsrvation,item)
fixedcol_hist(scenario,item)
;


fixedcol_line(scenario,obsrvation,"price")
 = ord(obsrvation)+20-ord(scenario);
fixedcol_line(scenario,obsrvation,"quantity")
 = ord(obsrvation);
fixedcol_hist(scenario,item)
 = uniform(10,20);


$setglobal gp_lwidth 3
$setglobal gp_lc_1 blue
$setglobal gp_lc_2 red
$setglobal gp_lc_3 yellow
$setglobal gp_fontsize 18

* Line plots with fixed colors
$setglobal gp_fixcolor_set scenario
$setglobal gp_title "All set elements are active"
$libinclude gnuplotxyz fixedcol_line quantity price

fixedcol_line("Combine",obsrvation,item)  = 0;

$setglobal gp_title "COMBINE is inactive, color fixing is switched on"
$libinclude gnuplotxyz fixedcol_line quantity price

$setglobal gp_fixcolor_set no
$setglobal gp_title "COMBINE is inactive, color fixing is switched off again"
$libinclude gnuplotxyz fixedcol_line quantity price

* Histograms with fixed colors
$setglobal gp_lwidth 3
$setglobal gp_lc_1 brown
$setglobal gp_lc_2 orange
$setglobal gp_lc_3 pink
$setglobal gp_fontsize 18
$setglobal gp_xlabel no
$setglobal gp_ylabel no


$setglobal gp_fixcolor_set scenario
$setglobal gp_title "All set elements are active"
$libinclude gnuplotxyz fixedcol_hist

fixedcol_hist("Combine",item)  = 0;

$setglobal gp_title "COMBINE is inactive, color fixing is switched on"
$libinclude gnuplotxyz fixedcol_hist

$setglobal gp_fixcolor_set no
$setglobal gp_title "COMBINE is inactive, color fixing is switched off again"
$libinclude gnuplotxyz fixedcol_hist

display gp_xyz_fixed_col,gp_xyz_ind_col,gp_hex_color_name;





