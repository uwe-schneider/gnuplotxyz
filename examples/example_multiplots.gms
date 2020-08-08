Sets CROP /Wheat,Potatoes/, PESTICIDE /Fungicides,Herbicides,Insecticides/, YEAR /2000,2100/;
Table  PEST_DATA(CROP,YEAR,PESTICIDE)
                 Fungicides    Herbicides  Insecticides
Wheat   .2000       3.3          0.4         5
Wheat   .2100       4.4          2.6         2
Potatoes.2000       1.4          6.3         1
Potatoes.2100       1.9          4.4         0.4
;
Parameters FData(CROP,YEAR),HData(CROP,YEAR),IData(CROP,YEAR);
FData(CROP,YEAR) = PEST_DATA(CROP,YEAR,"Fungicides");
HData(CROP,YEAR) = PEST_DATA(CROP,YEAR,"Herbicides");
IData(CROP,YEAR) = PEST_DATA(CROP,YEAR,"Insecticides");

$setglobal gp_multiplot yes
$setglobal gp_multiplotlayout 4,1
$setglobal gp_multiplottitle "My title \n"
$setglobal gp_multiplottitlefont "Algerian,30"

$setglobal gp_tmargin 1
$setglobal gp_bmargin 1
$setglobal gp_lmargin 8
$setglobal gp_rmargin 1

$setglobal gp_yrange  "0:8"
$setglobal gp_ytics   2
$setglobal gp_ylabel "Application"
$setglobal gp_font "Britannic"
$setglobal gp_fontsize "14"

$setglobal gp_xlabel no
$setglobal gp_key top left

$libinclude gnuplotxyz FDATA

$setglobal gp_key no
$setglobal gp_fontsize "10"
$libinclude gnuplotxyz HDATA

$setglobal gp_xtics   1
$setglobal gp_xlabel "\n Year"
$libinclude gnuplotxyz IDATA

$libinclude gnuplotxyz multiplot

