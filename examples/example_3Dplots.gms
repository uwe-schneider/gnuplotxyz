* Declarations
SETS
planes Scenarios     /Uno,Dos,Helix/
u /u1*u50/
v /v1*v20/
w /w1*w100/
axisitem /x,y,z/
;

PARAMETER
uval(u)
vval(v)
wval(w)
InterlockingTori(planes,u,v,axisitem)
HelixPlot(planes,w,v,axisitem)
;

* Tori Calculation
uval(u) = -3.14159 + ((ord(u)-1)/(card(u)-1))*2*3.14159;
vval(v) = -3.14159 + ((ord(v)-1)/(card(v)-1))*2*3.14159;

InterlockingTori("uno",u,v,"x")
 = cos(uval(u))+.5*cos(uval(u))*cos(vval(v));
InterlockingTori("uno",u,v,"y")
 = sin(uval(u))+.5*sin(uval(u))*cos(vval(v));
InterlockingTori("uno",u,v,"z")
 = .5*sin(vval(v));

InterlockingTori("dos",u,v,"x")
 = 1+cos(uval(u))+.5*cos(uval(u))*cos(vval(v));
InterlockingTori("dos",u,v,"y")
 = .5*sin(uval(u));
InterlockingTori("dos",u,v,"z")
 = sin(uval(u))+.5*sin(uval(u))*cos(vval(v));

* Tori Plotting
$setglobal gp_key "no"
$setglobal gp_style "lines"
$setglobal gp_grid  "no"
$setglobal gp_xlabel "Earth"
$setglobal gp_ylabel "Water"
$setglobal gp_zlabel "Air"
$setglobal gp_title "Fire"
$libinclude gnuplotxyz InterlockingTori x y z
$setglobal gp_xlabel "no"
$setglobal gp_ylabel "no"
$setglobal gp_zlabel "no"

* Helix Calculation
wval(w) = ((ord(w)-1)/(card(w)-1))*31.4159;
vval(v) = ((ord(v)-1)/(card(v)-1))*6.28319;

HelixPlot("Helix",w,v,"x")
 = (1-0.1*cos(vval(v)))*cos(wval(w));
HelixPlot("Helix",w,v,"y")
 = (1-0.1*cos(vval(v)))*sin(wval(w));
HelixPlot("Helix",w,v,"z")
 = 0.1*(sin(vval(v))+wval(w)/1.7-10);

* Helix Plotting
$setglobal gp_style "lines"
$setglobal gp_title "Plot of Helix"
$libinclude gnuplotxyz HelixPlot x y z
