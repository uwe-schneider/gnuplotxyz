# GNUPLOTXYZ.GMS 

A Windows based GAMS Interface to GNUPLOT

Uwe A. Schneider

* Credits
* [Description](https://github.com/uwe-schneider/gnuplotxyz/wiki/#description)
* [Download](https://github.com/uwe-schneider/gnuplotxyz/wiki/#download-and-installation)
* [2D Syntax](https://github.com/uwe-schneider/gnuplotxyz/wiki/#2d-plot-syntax)
* [3D Syntax](https://github.com/uwe-schneider/gnuplotxyz/wiki/Home/#3d-syntax)
* [Examples](https://github.com/uwe-schneider/gnuplotxyz/wiki/Home/#examples)
* [Options](https://github.com/uwe-schneider/gnuplotxyz/wiki/Home/#options)
* [Modification](https://github.com/uwe-schneider/gnuplotxyz/wiki/Home/#modification)

# Credits

This software interface was largely developed by [Uwe Schneider ](https://www.fnu.uni-hamburg.de/en/staff/schneider.html). Credit goes also to [Bruce McCarl](http://agecon2.tamu.edu/people/faculty/mccarl-bruce/) who initiated the project and did some initial programming and to [Thomas Rutherford](http://www.mpsge.org/inclib/tools.htm). Tom's existing gnuplot interface provided useful guidance. Additional contributions were made by Michael Bussieck and Armin Pruessner from [GAMS Development Corporation](https://www.gams.com/). Thanks also to Hans-Bernhard Broeker from the [Gnuplot](http://www.gnuplot.info/) team.

There is (almost) no technical support. Bug reports/fixes are welcome. 

([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))

# Description

Gnuplotxyz.gms allows users to plot data from GAMS runs in GNUPLOT. 

Gnuplotxyz.gms is user friendly as only one single line is needed to produce a plot. Nevertheless, many of the default options can be changed by using [optional statements](https://github.com/uwe-schneider/gnuplotxyz/wiki/Home/#options) as illustrated below. In addition, one can modify the gnuplotxyz.gms file for personal needs and preferences.  

([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))

# Download and Installation  

1) Download and install the latest version of gnuplot for windows from [http://www.gnuplot.info/download.html](http://www.gnuplot.info/download.html). When installing make sure that the option "Add application directory to your PATH environment variable" is selected. (see below)

![](https://github.com/uwe-schneider/gnuplotxyz/blob/master/instructions/pathvariable.png)

2) Copy the file [gnuplotxyz.gms](https://github.com/uwe-schneider/gnuplotxyz/blob/master/gnuplotxyz.gms) to the .\inclib subdirectory of your GAMS system directory.

([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))

# 2D Plot Syntax  
## 2D Line and other plots (no histograms)  

The data to be graphed as 2D-plot must be contained in a three-dimensional parameter, i.e. a parameter which has three indexes. The elements in the first argument determine different lines in a plot. The elements in the second argument determine the points of each line. The order of elements in the second index determines how the different data points pertaining to one line are connected. The remaining argument (third index) must contain at least two elements of which one depicts the x-axis and another one the y-axis. If you choose styles with error bars you may need to give additional values (see examples).

Required syntax

`$libinclude gnuplotxyz <parameter name> <xaxis element> <yaxis element>`

multiple plots in sequence with custom formatting

`[$setglobal < global variable name> < value>]`

`[$setglobal < global variable name> <value>]`

`$libinclude gnuplotxyz < parameter name> <xaxis element> <yaxis element>`

`[$setglobal < global variable name> <value>]`

`[$libinclude gnuplotxyz < parameter name> <xaxis element> <yaxis element>]`


## 2D - Histograms

Note, depending on how many data columns will be provided, gnuplot may use different calculations (see errorlines, errorbars)

### histograms using 2 indexes

Applies automatically to parameters with 2 indexes. Only use one argument after `$libinclude gnuplotxyz`

`[$setglobal gp_hist "clustered gap 2"]`

`[$setglobal gp_hist "rowstacked"]`

`[$setglobal gp_hist "columnstacked"]`

`$libinclude gnuplotxyz < parameter name>`


### new histograms using 3 indexes

Applies automatically to parameters with 3 indexes and one argument after `$libinclude gnuplotxyz`. If each index contains rather many elements than the plot will not look nice.

`$libinclude gnuplotxyz <parameter name>`

xerrorlines, xerrorbars

`$setglobal gp_style " xerrorlines"`

`$libinclude gnuplotxyz <parameter name> <xvalue> <yvalue> <xdelta>`

or

`$libinclude gnuplotxyz <parameter name> <xvalue> <yvalue> <xlowvalue> <xhighvalue>`

yerrorlines, yerrorbars

`$setglobal gp_style "yerrorbars"`

`$libinclude gnuplotxyz <parameter name> <xvalue> <yvalue> <ydelta>`

or

`$libinclude gnuplotxyz <parameter name> <xvalue> <yvalue> <ylowvalue> <yhighvalue>`

candlesticks (Note: low value <opening value <closing value <high value)

`$setglobal gp_style "candlesticks"`

`$libinclude gnuplotxyz <parameter name> <xvalue> <opening value> <low value> <high value> <closing value>`

xyerrorlines,xyerrorbars

`$setglobal gp_style " xyerrorlines"`

`$libinclude gnuplotxyz <parameter name> <xvalue> <yvalue> <xdelta> <ydelta>`

or

`$libinclude gnuplotxyz <parameter name> <xvalue> <yvalue> <xlowvalue> <xhighvalue> <ylowvalue> <yhighvalue>`

## 2D - Loop

Outside (above) loops:

`$libinclude gnuplotxyz`

`[$setglobal gp_loop1  <setname1>]`

`[$setglobal gp_loop2  <setname2>]`

`[$setglobal gp_loop3  <setname3>]`

`[$setglobal gp_loop4  <setname4>]`

The statements in square brackets above are optional. If used, the title of the graph will show the current element of the loop. You can "unset" the values of these variables by assigning "no" or "0" (see below).


Inside loops:

`$libinclude gnuplotxyz <parameter name> <xaxis element> <yaxis element>`

After loop:

`[$setglobal gp_loop1  no]`

`[$setglobal gp_loop2  no]`

`[$setglobal gp_loop3  no]`

`[$setglobal gp_loop4  no]`


([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))

## 3D Syntax  
## 3D - No loop

The data to be graphed as 3D-plot must be contained in a four-dimensional parameter, i.e. a parameter with four indexes. The elements in the first argument determine the different planes in a plot. The elements in the second argument determine the number of x-axis values. The number of elements in the third argument determines the number of y-axis values. The order of the elements in the second and third index determines how the different data points pertaining to one plane are connected. The remaining argument (fourth index) must contain at least three set elements of which one represents the x-axis, another one the y-axis coordinate, and a third one the z-axis coordinate.

`$libinclude gnuplotxyz <parameter name> <xaxis element> <yaxis element> <zaxis element>`

## 3D - Loop

Outside (above) loops:
`$libinclude gnuplotxyz`

`[$setglobal gp_loop1  <setname1>]`

`[$setglobal gp_loop2  <setname2>]`

`[$setglobal gp_loop3  <setname3>]`

`[$setglobal gp_loop4  <setname4>]`

The statements in square brackets above are optional. If used, the title of the graph will show the current element of the loop. You can "unset" the values of these variables by assigning "no" or "0" (see below).

Inside loops:

`$libinclude gnuplotxyz <parameter name> <xaxis element> <yaxis element> <zaxis element>`

After loop:
`[$setglobal gp_loop1  no]`

`[$setglobal gp_loop2  no]`

`[$setglobal gp_loop3  no]`

`[$setglobal gp_loop4  no]`


([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))

# Examples

2D

2D Histograms

3 dimensional 2D Histograms

assign some elements of 2D Histograms to second y (y2) axis

2D Mixed Styles

2D Fix Line Color

2D Fill Space between lines

2D Loop (may not be suitable for all ages ;)

3D

TextLabels

new Function plots

([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))
 
# Options

Through use of global variables, the format of the plot can be changed. If it doesn't work at all or not as you intended, you can examine gnuplotxyz.gms to find out how it is used and to fix the problem.
Non-windows terminals

`gp_term wxt`   

other terminal types include emf, gif, .. some options will not work properly with non-windows terminals
User Supplied Options

(these form entire lines befoe the plot statement in the gnuplot.inp file)

gp_option_1, ..., gp_option_4
Key

gp_key, gp_keytitle, gp_keybox, gp_keyopt
Style

gp_color, gp_title, gp_size

gp_style, gp_fill, gp_rectangle, gp_hist

gp_lwidth, gp_pointsz

gp_grid, gp_xgrid, gp_ygrid

gp_zeroax, gp_xzeroax, gp_yzeroax

gp_border, gp_borddim

gp_bmargin, gp_tmargin, gp_rmargin, gp_lmargin (for manually specifying margins)

gp_l1style .. gp_l16style

gp_l1axes .. gp_l16axes

gp_lw_1, ... gp_lw_16 (for specifying the width of individual lines)

gp_lc_1 .. gp_lc_16 (see available color names )

gp_fixcolor_set  (for keeping the same color over a set)
Axis

gp_x2axis, gp_y2axis

gp_label, gp_xlabel, gp_ylabel, gp_zlabel, gp_x2label, gp_y2label

gp_ymin (useful when using a 2nd y-axis through y2scale)

gp_y2scale

gp_xrange, gp_yrange, gp_x2range, gp_y2range,

gp_tics, gp_xtics, gp_ytics, gp_xinc, gp_yinc

gp_logscale
Data

gp_supzero

gp_zeroend
Text Labels

gp_label_1   ...  gp_label_9
Resetting

gp_resetstyle

gp_resetaxis

([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))

# Modification

Modifications of gnuplotxyz.gms may be necessary a) to implement additional plotting features and b) to fix bugs. The best way to fix a problem is to work backwards.

Step1: Open and examine the files "gnuplot.inp" and "gnuplot.dat" and determine a) wanted or b) misspecified commands/data (use gnuplot documentation if necessary)

Step2: Create a new file, i.e. "test.gms", in the same directory where "gnuplot.inp" and "gnuplot.dat" are put. The file should have the following content:

execute 'if exist gnuplot.ini del gnuplot.ini >nul';
execute 'copy gnuplot.inp gnuplot.ini >nul';
$if     "%system.filesys%" == "MS95"   execute '"%gams.sysdir%inclib\callgplt.bat" x %gams.sysdir%';
$if     "%system.filesys%" == "MSNT"   execute '"%gams.sysdir%inclib\callgplt.bat" x';

Step3: Modify "gnuplot.inp" and/or "gnuplot.dat" and test by running "test.gms"

Step4: If you found out how "gnuplot.inp" and/or "gnuplot.dat" should be changed, modify statements in "gnuplotxyz.gms" to produce the desired content in  "gnuplot.inp" and/or "gnuplot.dat"

([back to top](https://github.com/uwe-schneider/gnuplotxyz/wiki/#gnuplotxyzgms))
 
