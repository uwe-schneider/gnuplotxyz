sets
scenario     Scenarios     /Coal,Biomass,"Biomass Above Coal","Biomass Below Coal",Solar/
CoalBiomass(Scenario)      /Coal,Biomass/
Observation  Observations  /1*100/,
item         Items         /price,energy,reference/
;

Parameters filledlinesplot(scenario,Observation,item),deviation(scenario,Observation,item);
filledlinesplot(CoalBiomass,Observation,"price")= ord(Observation);
filledlinesplot("Coal",Observation,"energy")    = Uniform(1,100) + ord(Observation);
filledlinesplot("Biomass",Observation,"energy") = Uniform(1,100) + ord(Observation);

* Normal Plot
$setglobal gp_lc_1 dimgray
$setglobal gp_lc_2 limegreen
$setglobal gp_lwidth 1.5
$setglobal gp_fontsize 18
$setglobal gp_title "Normal plot with custom line colors, line width, and font size"
$libinclude gnuplotxyz filledlinesplot price energy


* Deviation Plot Biomass referenced to coal
deviation("Biomass Above Coal",Observation,"price") = ord(Observation);
deviation("Biomass below Coal",Observation,"price") = ord(Observation);
deviation("Biomass Above Coal",Observation,"energy")= filledlinesplot("Biomass",Observation,"energy");
deviation("Biomass below Coal",Observation,"energy")= filledlinesplot("Biomass",Observation,"energy");

* Biomass above coal fill with red color
deviation("Biomass Above Coal",Observation,"reference")
 $(filledlinesplot("Biomass",Observation,"energy") ge filledlinesplot("Coal",Observation,"energy"))
 = filledlinesplot("Biomass",Observation,"energy");
deviation("Biomass Above Coal",Observation,"reference")
 $(filledlinesplot("Biomass",Observation,"energy") lt filledlinesplot("Coal",Observation,"energy"))
 = filledlinesplot("Coal",Observation,"energy");

* Biomass below coal fill with blue color
deviation("Biomass below Coal",Observation,"reference")
 $(filledlinesplot("Biomass",Observation,"energy") lt filledlinesplot("Coal",Observation,"energy"))
 = filledlinesplot("Biomass",Observation,"energy");
deviation("Biomass below Coal",Observation,"reference")
 $(filledlinesplot("Biomass",Observation,"energy") ge filledlinesplot("Coal",Observation,"energy"))
 = filledlinesplot("Coal",Observation,"energy");

no_gp_legend("Biomass below Coal") = yes;

$setglobal gp_lc_1 red
$setglobal gp_lc_2 blue
$setglobal gp_lwidth 1
$setglobal gp_fill "solid 1"
$setglobal gp_style filledcurves
$setglobal gp_title "Plot deviation from biomass to coal"
$libinclude gnuplotxyz deviation price energy reference


* Stack coal biomass and solar and fill space between curves
filledlinesplot("Solar",Observation,"price")
 = ord(Observation);
filledlinesplot("Biomass",Observation,"energy")
 = filledlinesplot("Biomass",Observation,"energy")
 + filledlinesplot("Coal",Observation,"energy");
filledlinesplot("Biomass",Observation,"reference")
 = filledlinesplot("Coal",Observation,"energy");
filledlinesplot("Solar",Observation,"energy")
 = Uniform(1,50) + ord(Observation)
 + filledlinesplot("Biomass",Observation,"energy");
filledlinesplot("Solar",Observation,"reference")
 = filledlinesplot("Biomass",Observation,"energy");

$setglobal gp_lc_1 brown
$setglobal gp_lc_2 green
$setglobal gp_lc_3 yellow
$setglobal gp_style filledcurves
$setglobal gp_title "Stack coal biomass and solar and fill space between curves"
$libinclude gnuplotxyz filledlinesplot price energy reference
