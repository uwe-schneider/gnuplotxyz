sets
scenario     Scenarios     /First,Second,Third,Fourth/,
obsrvation   Observations  /1*12/,
item         Items         /x,y/;

parameter
textlabelplot(scenario,obsrvation,item)
;


textlabelplot(scenario,obsrvation,"x")
 = ord(obsrvation);

textlabelplot(scenario,obsrvation,"y")
 = 3*ord(scenario) - textlabelplot(scenario,obsrvation,"x");

$setglobal gp_title   "Add Text Labels to Graph"
$ontext
 '"<label text>" {at <position>} {left | center | right} {norotate | rotate {by <degrees>}}
                 {font "<name>{,<size>}"} {noenhanced} {front | back}
$offtext
$setglobal gp_label_1 '"Hi World" at 10,12 right font "Times New Roman Bold,24" tc lt 4'
$setglobal gp_label_2 '"Bye World" at 1,-5 left  font "Arial Italic,24" tc lt 1'
$setglobal gp_fontsize 16
$setglobal gp_lwidth 2
$setglobal gp_key no
$setglobal gp_xlabel no
$setglobal gp_ylabel no
$libinclude gnuplotxyz  textlabelplot  x   y

$setglobal gp_label_1 no
$setglobal gp_label_3 '"Confused World" at 11,13 left rotate by 190 font "Arial Italic,24" tc ls 3'
$libinclude gnuplotxyz  textlabelplot  x   y
