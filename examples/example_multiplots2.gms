$setglobal gp_multiplot        yes
$setglobal gp_multiplotlayout  1,4
$setglobal gp_multiplottitle   "Multiplot"



sets
scenario     Scenarios     /First,Second,Third,Fourth/,
obsrvation   Observations  /1*12/,
item         Items         /price,quantity/
Line
 /Line1*Line9/
Observation
 /Obs1*Obs10/
AxisItem
 /x,val2,val3,val5,val4,val6,y,z/
planes Scenarios     /Uno,Dos,Helix/
u /u1*u50/
v /v1*v20/
w /w1*w100/
CROPS
/
Pomes,Berries,Drupes,Citrus
/
PESTICIDE
/
Fungicides
Herbicides
Insecticides
/
YEAR
/19, 20/
;

table example(scenario,obsrvation,item)
           1.price  1.quantity     2.price  2.quantity     3.price  3.quantity     4.price  4.quantity     5.price  5.quantity     6.price  6.quantity     7.price  7.quantity     8.price  8.quantity     9.price  9.quantity    10.price 10.quantity    11.price 11.quantity    12.price 12.quantity

First         3.00       -3.00        2.00       -2.00        1.00       -1.00                                1.00        1.00        2.00        2.00        3.00        3.00        4.00        4.00        5.00        5.00        6.00        6.00        7.00        7.00        8.00        8.00
Second       -3.00       -2.40       -2.20       -1.58       -1.40       -0.90       -0.60       -0.34        0.20        0.10        1.00        0.40        1.80        0.58        2.60        0.62        3.40        0.54        4.20        0.34        5.00                    5.80       -0.46
Third        -1.00        8.00                    7.00        1.00        6.00        2.00        5.30        3.00        4.80        4.00        4.40        5.00        4.10        6.00        3.90
;


$setglobal gp_title   'Figure 1: Lines'
$libinclude gnuplotxyz example quantity price

Table Graph1(Line,Observation,AxisItem)
                      x        val2        val3        val5        val4        val6

Line1.Obs1         1.00       13.69        0.50        6.49        1.42       18.73
Line1.Obs2         2.00       18.33        1.82       12.01        2.31       26.64
Line1.Obs3         3.00       22.46        2.81       21.31        3.49       28.48
Line1.Obs4         4.00       24.17        3.61       14.46        4.01       24.99
Line1.Obs5         5.00       29.27        4.80       22.20        5.09       35.05
Line1.Obs6         6.00       33.03        5.54       23.17        6.04       38.96
Line1.Obs7         7.00       37.61        6.94       29.06        7.27       44.44
Line1.Obs8         8.00       42.93        7.63       36.72        8.06       44.52
Line1.Obs9         9.00       45.24        8.97       38.23        9.37       48.56
Line1.Obs10       10.00       50.00        9.71       42.99       10.06       53.16
Line2.Obs1         1.00       23.09        0.97       15.18        1.24       28.29
Line2.Obs2         2.00       28.34        2.00       22.24        2.40       31.98
Line2.Obs3         3.00       31.34        2.80       30.79        3.25       33.02
Line2.Obs4         4.00       35.51        3.74       30.66        4.27       42.34
Line2.Obs5         5.00       41.88        4.69       41.36        5.01       46.94
Line2.Obs6         6.00       43.28        5.89       36.29        6.27       49.04
Line2.Obs7         7.00       46.70        6.80       44.75        7.23       53.90
Line2.Obs8         8.00       50.62        7.86       48.36        8.49       57.46
Line2.Obs9         9.00       56.32        8.92       48.18        9.09       56.52
Line2.Obs10       10.00       61.19        9.53       51.27       10.08       69.58
Line3.Obs1         1.00       32.85        0.79       25.34        1.01       39.95
Line3.Obs2         2.00       38.71        1.93       31.53        2.09       40.27
Line3.Obs3         3.00       43.02        2.81       43.01        3.03       49.12
Line3.Obs4         4.00       45.28        3.81       42.64        4.01       51.89
Line3.Obs5         5.00       49.00        4.87       40.76        5.42       50.94
Line3.Obs6         6.00       54.01        5.53       45.81        6.30       57.64
Line3.Obs7         7.00       57.01        6.91       48.40        7.01       63.24
Line3.Obs8         8.00       61.09        7.85       58.97        8.10       68.41
Line3.Obs9         9.00       66.66        8.96       62.09        9.48       70.80
Line3.Obs10       10.00       71.57        9.80       71.19       10.17       73.15
;


* General options
$setglobal gp_boxwidth "0.4"
$setglobal gp_fill 'solid 1'
$setglobal gp_title "Figure 2: boxes (1), points (2), xyerrorbars (3)"
$setglobal gp_style lines
$setglobal gp_xlabel ""
$setglobal gp_ylabel "Simulated Value"
$setglobal gp_key "at 0.5,180"
$setglobal gp_fontsize 16
$setglobal gp_xrange "-2:11"

* Line 1 options
$setglobal gp_l1style boxes
$setglobal gp_lc_1 darkgreen
* Line 2 options
$setglobal gp_lc_2 teal
$setglobal gp_lw_2 4
$setglobal gp_l2style points
* Line 3 options
$setglobal gp_l3style xyerrorbars

$libinclude gnuplotxyz Graph1 x val2 val3 val4 val5 val6


* Declarations
PARAMETER uval(u),vval(v),wval(w),InterlockingTori(planes,u,v,axisitem);
* Tori Calculation
uval(u) = -3.14159 + ((ord(u)-1)/(card(u)-1))*2*3.14159;
vval(v) = -3.14159 + ((ord(v)-1)/(card(v)-1))*2*3.14159;
InterlockingTori("uno",u,v,"x")  = cos(uval(u))+.5*cos(uval(u))*cos(vval(v));
InterlockingTori("uno",u,v,"y")  = sin(uval(u))+.5*sin(uval(u))*cos(vval(v));
InterlockingTori("uno",u,v,"z")  = .5*sin(vval(v));
InterlockingTori("dos",u,v,"x")  = 1+cos(uval(u))+.5*cos(uval(u))*cos(vval(v));
InterlockingTori("dos",u,v,"y")  = .5*sin(uval(u));
InterlockingTori("dos",u,v,"z")  = sin(uval(u))+.5*sin(uval(u))*cos(vval(v));
* Tori Plotting
$setglobal gp_key "no"
$setglobal gp_style "lines"
$setglobal gp_grid  "no"
$setglobal gp_xlabel "Earth"
$setglobal gp_ylabel "Water"
$setglobal gp_zlabel "Air"
$setglobal gp_title "Figure 3: Fire (3D)"
$libinclude gnuplotxyz InterlockingTori x y z
$setglobal gp_xlabel "no"
$setglobal gp_ylabel "no"
$setglobal gp_zlabel "no"



Table  PEST_DATA1(CROPS,YEAR,PESTICIDE)
                 Fungicides    Herbicides    Insecticides
Pomes.19           3.3679       0.4641        4.5137
Pomes.20           4.4175       0.6072        5.9271
Berries.19         1.4775       0.3801        6.0297
Berries.20         1.9397       0.4972        7.9175
Drupes.19          1.1628       0.3102        5.8668
Drupes.20          1.5275       0.4049        7.7058
Citrus.19          0.1123       0.1779        2.4991
Citrus.20          0.1475       0.2336        3.2842
;

$setglobal gp_title "Figure 4: New Histogram - cluster (default) histogram"
$libinclude gnuplotxyz PEST_DATA1


$libinclude gnuplotxyz multiplot