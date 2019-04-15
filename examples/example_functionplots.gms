Set i /i1/,j /j1*j5/,c /x,y/;
Parameter a(i,j,c);
a(i,j,"x")=ord(j);
a(i,j,"y")=1-0.1*ord(j);

$ontext
By default, gnuplot assumes that the independent, or "dummy", variable for the plot command is "t" if
in parametric or polar mode, or "x" otherwise. Similarly the independent variables for the splot command
are "u" and "v" in parametric mode (splot cannot be used in polar mode), or "x" and "y" otherwise.

The set parametric command changes the meaning of plot from normal functions to parametric
functions. The command unset parametric restores the plotting style to normal, single-valued expression
plotting.
For 2D plotting, a parametric function is determined by a pair of parametric functions operating on a
parameter. An example of a 2D parametric function would be plot sin(t),cos(t), which draws a circle (if
the aspect ratio is set correctly | see set size (p. 144)). gnuplot will display an error message if both
functions are not provided for a parametric plot.
$offtext

$setglobal gp_keepname function_plot
$setglobal gp_fontsize 20

$setglobal gp_title "Figure 1: Simple functions from http://gnuplot.sourceforge.net/demo_4.6/simple.html"
$setglobal gp_functionplot_1 [-10:10] sin(x),atan(x),cos(atan(x))
$libinclude gnuplotxyz function

$setglobal gp_title "Figure 2: Simple functions from http://gnuplot.sourceforge.net/demo_4.6/simple.html"
$setglobal gp_functionplot_1 [-pi/2:pi] cos(x),-(sin(x) > sin(x+1) ? sin(x) : sin(x+1))
$libinclude gnuplotxyz function

$setglobal gp_title "Figure 3: Simple functions from http://gnuplot.sourceforge.net/demo_4.6/simple.html"
$setglobal gp_functionplot_1 [-3:5] asin(x),acos(x)
$libinclude gnuplotxyz function

$setglobal gp_title "Figure 4: Simple functions from http://gnuplot.sourceforge.net/demo_4.6/simple.html"
$setglobal gp_functionplot_1  x*x with filledcurves, 50-x*x with filledcurves, x*x with line lt 1
$libinclude gnuplotxyz function

$setglobal gp_title "Figure 5: Simple functions from http://gnuplot.sourceforge.net/demo_4.6/simple.html"
$setglobal gp_functionplot_1 [-30:20] besj0(x)*0.12e1 with impulses, (x**besj0(x))-2.5 with points
$setglobal gp_key inside left top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 1.000
$libinclude gnuplotxyz function

$setglobal gp_title "Figure 6: Simple functions from http://gnuplot.sourceforge.net/demo_4.6/simple.html"
$setglobal gp_key bmargin left horizontal Right noreverse enhanced autotitles box linetype -1 linewidth 1.000
$setglobal gp_samples 800, 800
$setglobal gp_functionplot_1 [-30:20] sin(x*20)*atan(x)
$libinclude gnuplotxyz function
$setglobal gp_samples no
$setglobal gp_key yes

$setglobal gp_title "Figure 7: plot with filledcurve [options]"
$setglobal gp_key outside right top vertical Right noreverse enhanced autotitles nobox
$setglobal gp_functionplot_1 [-10:10] [-5:3] 1.5+sin(x)/x with filledcurve x2
$setglobal gp_functionplot_2  sin(x)/x with filledcurve
$setglobal gp_functionplot_3  1+sin(x)/x with lines
$setglobal gp_functionplot_4  -1+sin(x)/x with filledcurve y1=-2
$setglobal gp_functionplot_5  -2.5+sin(x)/x with filledcurve xy=-5,-4.
$setglobal gp_functionplot_6  -4.3+sin(x)/x with filledcurve x1
$setglobal gp_functionplot_7  (x>3.5 ? x/3-3 : 1/0) with filledcurve y2
$libinclude gnuplotxyz function
$setglobal gp_functionplot_2   no
$setglobal gp_functionplot_3   no
$setglobal gp_functionplot_4   no
$setglobal gp_functionplot_5   no
$setglobal gp_functionplot_6   no
$setglobal gp_functionplot_7   no

$setglobal gp_title "Figure 8: Filled sinus and cosinus curves"
$setglobal gp_tics front
$setglobal gp_grid nopolar xtics nomxtics ytics nomytics noztics nomztics nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics front linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000
$setglobal gp_key outside right top vertical Right noreverse enhanced autotitles nobox
$setglobal gp_functionplot_1 2+sin(x)**2 with filledcurve x1, cos(x)**2 with filledcurve x1
$libinclude gnuplotxyz function
$setglobal gp_grid no
$setglobal gp_key yes

$setglobal gp_title "Figure 9: Parametric function plot without data"
$setglobal gp_trange no
$setglobal gp_parametric yes
$setglobal gp_functionplot_1 t,2*t lw 2 lc 4
$libinclude gnuplotxyz function
$setglobal gp_parametric no

$setglobal gp_title "Figure 10: Non-Parametric function plot without data"
$setglobal gp_functionplot_1 x,2*x,x**2 lw 2 lc 2
$libinclude gnuplotxyz function

$setglobal gp_title "Figure 11: Combined data and parametric function plot"
$setglobal gp_linewidth 2
$setglobal gp_trange 0:5
$setglobal gp_parametric yes
$setglobal gp_functionplot_1 t,2*t lw 2 lc 4
$setglobal gp_functionplot_2 t,3*t lw 3 lc 15
$libinclude gnuplotxyz a x y
$setglobal gp_trange no
$setglobal gp_parametric no

$setglobal gp_title "Figure 12: Combined data and non-parametric function plot"
$setglobal gp_functionplot_1 x lw 2,2*x lw 2
$setglobal gp_functionplot_2 no
$libinclude gnuplotxyz a x y
