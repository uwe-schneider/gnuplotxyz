Sets
CROPS
/
Pomes,Berries,Drupes,Citrus,FrVeg,Bulbs
Salads,Podded,Tubers,Roots,Cereals
/
PESTICIDE
/
Fungicides
Herbicides
Insecticides
/
YEAR
/2000,2100/
;

Table  PEST_DATA1(CROPS,YEAR,PESTICIDE)
                 Fungicides    Herbicides    Insecticides
Pomes.2000           3.3679       0.4641        4.5137
Pomes.2100           4.4175       0.6072        5.9271
Berries.2000         1.4775       0.3801        6.0297
Berries.2100         1.9397       0.4972        7.9175
Drupes.2000          1.1628       0.3102        5.8668
Drupes.2100          1.5275       0.4049        7.7058
Citrus.2000          0.1123       0.1779        2.4991
Citrus.2100          0.1475       0.2336        3.2842
FrVeg.2000           0.9790       0.4853        6.2047
FrVeg.2100           1.2958       0.6418        8.2019
Bulbs.2000           0.8735       0.2827        2.3907
Bulbs.2100           1.1198       0.3625        3.0651
Salads.2000          0.2184       0.4463        0.6530
Salads.2100          0.2880       0.5857        0.8563
Podded.2000          0.0741       0.1492        0.9160
Podded.2100          0.0951       0.1953        2.0209
Tubers.2000          0.8430       0.1918        0.6769
Tubers.2100          1.1262       0.2548        0.8940
Roots.2000           0.0007       0.0766        0.8348
Roots.2100           0.0012       0.0983        1.0752
Cereals.2000         0.0786       0.2346        0.0190
Cereals.2100         0.1116       0.3116        0.0246
;

PARAMETERS
PEST_DATA2(CROPS,PESTICIDE,YEAR)
PEST_DATA3(YEAR,CROPS,PESTICIDE)
PEST_DATA4(YEAR,PESTICIDE,CROPS)
PEST_DATA5(PESTICIDE,CROPS,YEAR)
PEST_DATA6(PESTICIDE,YEAR,CROPS)
;

PEST_DATA2(CROPS,PESTICIDE,YEAR)
 = PEST_DATA1(CROPS,YEAR,PESTICIDE);
PEST_DATA3(YEAR,CROPS,PESTICIDE)
 = PEST_DATA1(CROPS,YEAR,PESTICIDE);
PEST_DATA4(YEAR,PESTICIDE,CROPS)
 = PEST_DATA1(CROPS,YEAR,PESTICIDE);
PEST_DATA5(PESTICIDE,CROPS,YEAR)
 = PEST_DATA1(CROPS,YEAR,PESTICIDE);
PEST_DATA6(PESTICIDE,YEAR,CROPS)
 = PEST_DATA1(CROPS,YEAR,PESTICIDE);


$setglobal gp_ppt_fontname      "Times New Roman"
$setglobal gp_ppt_fontsize      16
$setglobal gp_ppt_boldfont      yes


* Figure 1: New Histogram - cluster (default) histogram
$setglobal gp_title "Figure 1: New Histogram - cluster (default) histogram"
$libinclude gnuplotxyz PEST_DATA1

* Figure 2: New Histogram - cluster with formatting
$setglobal gp_key top center
$setglobal gp_fill 'solid 1.0 border lt -1'
$setglobal gp_boxwidth 0.95 relative
$setglobal gp_fontsize 14
$setglobal gp_xtics offset character 0.3,0.3
$setglobal gp_hist cluster
$ontext
The following option moves all but the first labels (here: Herbicides Insecticides)
of histogram sections by the specified number of spaces to the right (default = 0)
$offtext
$setglobal gp_movenewhistogramlabels 22
$setglobal gp_title "Figure 2: New Histogram - cluster with formatting"
$libinclude gnuplotxyz PEST_DATA1

* Figure 3: New Histogram - rowstacked
$setglobal gp_hist rowstacked
$setglobal gp_title "Figure 3: New Histogram - rowstacked"
$libinclude gnuplotxyz PEST_DATA1


* Figure 4: New Histogram - columnstacked
$setglobal gp_hist columnstacked
$setglobal gp_title "Figure 4: New Histogram - columnstacked"
$setglobal gp_xtics rotate by 270 offset character 0.3,0.1
$libinclude gnuplotxyz PEST_DATA1

* Figure 5-: New Histogram - columnstacked
$setglobal gp_title "Figure 5: PEST_DATA1(CROPS,YEAR,PESTICIDE)"
$libinclude gnuplotxyz PEST_DATA1

* Figure 6: PEST_DATA2(CROPS,PESTICIDE,YEAR)
$setglobal gp_title "Figure 6: PEST_DATA2(CROPS,PESTICIDE,YEAR)"
$setglobal gp_key "right top inside width -17"
$libinclude gnuplotxyz PEST_DATA2

$setglobal gp_title "Figure 7: PEST_DATA3(YEAR,CROPS,PESTICIDE)"
$setglobal gp_xtics offset character 0.3,0.1
$setglobal gp_key outside
$libinclude gnuplotxyz PEST_DATA3

$setglobal gp_title "Figure 8: PEST_DATA4(YEAR,PESTICIDE,CROPS)"
$setglobal gp_xtics rotate by 330 offset character 0,0.1
$setglobal gp_key top right width -17
$setglobal gp_boxwidth 0.8 relative
$libinclude gnuplotxyz PEST_DATA4

$setglobal gp_title "Figure 9: PEST_DATA5(PESTICIDE,CROPS,YEAR)"
$setglobal gp_xtics rotate by 270 offset character 0.3,0.1
$setglobal gp_key outside
$libinclude gnuplotxyz PEST_DATA5

$setglobal gp_title "Figure 10: PEST_DATA6(PESTICIDE,YEAR,CROPS)"
$setglobal gp_xtics rotate by 270 offset character 0.3,0
$setglobal gp_key inside
$libinclude gnuplotxyz PEST_DATA6

$setglobal gp_title "Figure 11: costum colors, columnstacked"
$ontext
width - 17 decreases the white space in the key box
to make sure that the key is relatively right
$offtext
$setglobal gp_key "right top inside width -17"
$setglobal gp_lc_1 deeppink
$setglobal gp_lc_2 peru
$setglobal gp_lc_3 blueviolet
$setglobal gp_ygrid yes
$setglobal gp_hist columnstacked
$setglobal gp_newhistogramgap 0.2
$setglobal gp_xtics offset character 0.3,0
$libinclude gnuplotxyz PEST_DATA4
