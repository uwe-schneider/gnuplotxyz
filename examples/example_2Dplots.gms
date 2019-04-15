Sets
Scenario     Scenarios     /First,Second,Third,Fourth/
Observation  Observations  /1*12/
Item         Items         /Price,Quantity/
;

Table plot_2D(Scenario,Observation,item)
                price   quantity

  first. 1       3.00    -3.00
  first. 2       2.00    -2.00
  first. 3       1.00    -1.00
  first. 4       0.00     0.00
  first. 5       1.00     1.00
  first. 6       2.00     2.00
  first. 7       3.00     3.00
  first. 8       4.00     4.00
  first. 9       5.00     5.00
  first.10       6.00     6.00
  first.11       7.00     7.00
  first.12       8.00     8.00
 second. 1      -3.00    -2.40
 second. 2      -2.20    -1.58
 second. 3      -1.40    -0.90
 second. 4      -0.60    -0.34
 second. 5       0.20     0.10
 second. 6       1.00     0.40
 second. 7       1.80     0.58
 second. 8       2.60     0.62
 second. 9       3.40     0.54
 second.10       4.20     0.34
 second.11       5.00     0.00
 second.12       5.80    -0.46
  third. 1      -1.00     8.00
  third. 2       0.00     7.00
  third. 3       1.00     6.00
  third. 4       2.00     5.30
  third. 5       3.00     4.80
  third. 6       4.00     4.40
  third. 7       5.00     4.10
  third. 8       6.00     3.90
;


* General settings
$setglobal gp_graphorigin -8 -8
$setglobal gp_wlength 1920
$setglobal gp_wheight 1086
$setglobal gp_fontsize  16
$setglobal gp_bmargin 7


* Figures 1-3: treatment of (0,0) data
$setglobal gp_title    'Figure 1: All defaults - no ending (0,0)'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 2: All (0,0) suppressed'
$setglobal gp_supzero  'yes'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 3: All (0,0) displayed'
$setglobal gp_zeroend  'yes'
$setglobal gp_supzero  'no'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_zeroend  'no'


* Figures 4-6: grid display
$setglobal gp_title    'Figure 4: No global grid, lines at x,y =0'
$setglobal gp_grid     'no'
$setglobal gp_zeroax   'yes'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_zeroax   'no'


$setglobal gp_title    'Figure 5: X-grid only'
$setglobal gp_xgrid    'yes'
$setglobal gp_ygrid    'no'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 6: Y-grid only'
$setglobal gp_xgrid    'no'
$setglobal gp_ygrid    'yes'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_grid     'no'
$setglobal gp_ygrid    'no'


* Figure 7: ranges for axes
$setglobal gp_title    'Figure 7: User specified x,y-axis range'
$setglobal gp_xrange   '-5 : 10'
$setglobal gp_yrange   '-10: 20'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_xrange   'no'
$setglobal gp_yrange   'no'


* Figures 8-10: Key location
$setglobal gp_title    'Figure 8: Key location at bottom right'
$setglobal gp_key      'bottom right'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 9: Key outside'
$setglobal gp_key      'outside'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 10: Key at x=4,y=0.5'
$setglobal gp_key      'at 4,0.5'
$libinclude gnuplotxyz plot_2D quantity price


* Figures 11-12: linestyle, color
$setglobal gp_title    'Figure 11: Monochrome, no key, linespoints'
$setglobal gp_key      'no'
$setglobal gp_style    'linespoints'
$setglobal gp_color    'monochrome'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 12: Points'
$setglobal gp_key      'yes'
$setglobal gp_style    'points'
$setglobal gp_color    'color'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_style no


* Figures 13-14: font type and font size
$setglobal gp_title    'Figure 13: Arial Bold Italic Size 14'
$setglobal gp_font     'Arial Bold Italic'
$setglobal gp_fontsize '14'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_font     'Times New Roman'
$setglobal gp_fontsize '16'
$setglobal gp_title    'Figure 14: Times New Roman Size 12'
$libinclude gnuplotxyz plot_2D quantity price


* Figures 15-16: border dimensions
$setglobal gp_color    'monochrome'
$setglobal gp_borddim  'two'
$setglobal gp_title    'Figure 15: Monochrome with X1 and Y1 border'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_color    'color'
$setglobal gp_borddim  '5'
$setglobal gp_title    'Figure 16: X1 and X2 border'
$libinclude gnuplotxyz plot_2D quantity price


* Figure 17: Boxes and Boxwidth
$setglobal gp_borddim  'all'
$setglobal gp_title    'Figure 17: Boxes and Boxwidth'
$setglobal gp_style    'boxes'
$setglobal gp_boxwidth '.2'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_boxwid   'no'


* Figure 18: Steps
$setglobal gp_title    'Figure 18: Steps'
$setglobal gp_style    'steps'
$libinclude gnuplotxyz plot_2D quantity price


* Figure 19-21: Use of second X,Y axis
$setglobal gp_title    'Figure 19: X2 and Y2 axis autoscaled by 10 and 3, respectively'
$setglobal gp_style    'lines'
$setglobal gp_x2label  '2nd X-axis'
$setglobal gp_y2label  '2nd Y-axis'
$setglobal gp_x2scale  '10'
$setglobal gp_y2scale  '3'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 20: lines 1, 2, and 3 assigned to X1Y1, X1Y2, and X2Y2 respectively'
$setglobal gp_l1axes   'x1y1'
$setglobal gp_l2axes   'x1y2'
$setglobal gp_l3axes   'x2y2'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_l1axes   'x1y1'
$setglobal gp_l2axes   'x1y1'
$setglobal gp_l3axes   'x1y1'


$setglobal gp_title    'Figure 21: 2nd Y-axis assigned a range from -2 to 6 and to Line1'
$setglobal gp_x2axis   'no'
$setglobal gp_y2range  '-2:6'
$setglobal gp_l2axes   'x1y2'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_y2axis   'no'
$setglobal gp_l2axes   'x1y1'


* Figures 22: Different line width for graphs
$setglobal gp_title    'Figure 22: Lines two times thicker than normal'
$setglobal gp_lwidth   '2'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_lwidth   'no'


* Figure 23: Different line styles within a graph (works for lines 1 to 16)
$setglobal gp_title    'Figure 23: Use different line styles for lines 1 and 3'
$setglobal gp_l1style  'steps'
$setglobal gp_l3style  'points'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_l1style  'no'
$setglobal gp_l3style  'no'


* Figure 24: Adjusting tic increments
$setglobal gp_title    'Figure 24: Change tic increments'
$setglobal gp_xinc     '2.5'
$setglobal gp_yinc     '0.8'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_xinc     'no'
$setglobal gp_yinc     'no'


* Figures 25-26: Filled Curves
$setglobal gp_title    'Figure 25: Filled curves'
$setglobal gp_style    'filledcurves'
$libinclude gnuplotxyz plot_2D quantity price


$setglobal gp_title    'Figure 26: Filled curves on individual data series'
$setglobal gp_style    'lines'
$setglobal gp_l1style  'filledcurves'
$libinclude gnuplotxyz plot_2D quantity price
$setglobal gp_l1style  'no'
