$ontext
      ___           ___           ___           ___           ___       ___           ___           ___           ___           ___
     /\  \         /\__\         /\__\         /\  \         /\__\     /\  \         /\  \         |\__\         |\__\         /\  \
    /::\  \       /::|  |       /:/  /        /::\  \       /:/  /    /::\  \        \:\  \        |:|  |        |:|  |        \:\  \
   /:/\:\  \     /:|:|  |      /:/  /        /:/\:\  \     /:/  /    /:/\:\  \        \:\  \       |:|  |        |:|  |         \:\  \
  /:/  \:\  \   /:/|:|  |__   /:/  /  ___   /::\~\:\  \   /:/  /    /:/  \:\  \       /::\  \      |:|__|__      |:|__|__        \:\  \
 /:/__/_\:\__\ /:/ |:| /\__\ /:/__/  /\__\ /:/\:\ \:\__\ /:/__/    /:/__/ \:\__\     /:/\:\__\ ____/::::\__\     /::::\__\ _______\:\__\
 \:\  /\ \/__/ \/__|:|/:/  / \:\  \ /:/  / \/__\:\/:/  / \:\  \    \:\  \ /:/  /    /:/  \/__/ \::::/~~/~       /:/~~/~    \::::::::/__/
  \:\ \:\__\       |:/:/  /   \:\  /:/  /       \::/  /   \:\  \    \:\  /:/  /    /:/  /       ~~|:|~~|       /:/  /       \:\~~\~~
   \:\/:/  /       |::/  /     \:\/:/  /         \/__/     \:\  \    \:\/:/  /     \/__/          |:|  |       \/__/         \:\  \
    \::/  /        /:/  /       \::/  /                     \:\__\    \::/  /                     |:|  |                      \:\__\
     \/__/         \/__/         \/__/                       \/__/     \/__/                       \|__|                       \/__/

                                    A GAMS GNUPLOT interface developed by Uwe A. Schneider

                                      https://github.com/uwe-schneider/gnuplotxyz/wiki
$offtext
$onlisting
$onuni

* Execute collected multiplots
$if "%1" == "multiplot"                           execute 'shellexecute wgnuplot.exe -persist gnuplot.inp';
$if "%1" == "multiplot"                           $goto gpxyzlabel_totalendofgnupltxyz

* Execute direct export to microsoft powerpoint (Neubersch utility)
$if "%1" == "compileppt"                          $goto gpxyzlabel_endofgnupltxyz

* Declare powerpoint counter and text file for image list (Huck utility)
$if not declared gpxyzsm_plot_count               scalar gpxyzsm_plot_count /0/;
$if not declared gams_ppt_list                    file gams_ppt_list /"%gams.sysdir%inclib\gams_ppt_list.txt"/;

* Reset powerpoint
$if "%1" == "reset"                               execute 'if exist "%gams.sysdir%inclib\gams_ppt_list.txt" del "%gams.sysdir%inclib\gams_ppt_list.txt" >nul';
$if "%1" == "reset"                               gpxyzsm_plot_count = 0;
$if "%1" == "reset"                               $goto gpxyzlabel_endofgnupltxyz

*       Exit compilation if there is a pre-existing program error:
*$if not exist "%gams.sysdir%wgnuplot.exe"         $abort "missing wgnuplot.exe in gams system directory"
$if not errorfree                                 $exit

$if declared u__1                                 $goto gpxyzlabel_declared1

* Delete helper file for powerpoint
$call if exist "%gams.sysdir%inclib\gams_ppt_list.txt" del "%gams.sysdir%inclib\gams_ppt_list.txt" >nul

* One time declaration of sets parameters and files for graphs in a loop
alias(u__1,u__2,u__3,u__4,u__5,u__6,u__7,u__8,u__9,u__10,u__11,u__12,u__13,u__14,u__15,u__16,all_gp_legend,*);
set uu___1(u__1);
set uu___2(u__2);
set uu___3(u__3);
set uu___4(u__4);
set uu___5(u__5);
set uu___6(u__6);
set uu___7(u__7);
set uu___8(u__8);
set uu___9(u__9);
set uu___10(u__10);
set uu___11(u__11);
set uu___12(u__12);
set uu___13(u__13);
set uu___14(u__14);
set uu___15(u__15);
set uu___16(u__16);

* may also use phantom set element
set no_gp_legend(all_gp_legend); no_gp_legend("nothing_nothing") = no;
set gp_hun_100_set /gp_hun_100_set_1*gp_hun_100_set_100/;
alias(first_index_gpxyzset,second_index_gpxyzset,third_index_gpxyzset,*);
set gpxyzset_one(first_index_gpxyzset),gpxyzset_two(second_index_gpxyzset),gpxyzset_three(third_index_gpxyzset);
set ppt_repeat_loop_all /1*9/;
set ppt_repeat_loop(ppt_repeat_loop_all) This set allows to combine graphs from different restart files in one power point file;

* what is this needed for?
gpxyzset_one("no")=no;
gpxyzset_two("no")=no;
gpxyzset_three("no")=no;

* for more than 4 dimensions
Set gpxyz_index__set /gpxyz_index__set__1*gpxyz_index__set__20/;

* blank invocation of gnuplot if loop
set allu2(u__1,u__2);
set allu3(u__1,u__2,u__3);
set allu4(u__1,u__2,u__3,u__4);
set allu5(u__1,u__2,u__3,u__4,u__5);
set allu6(u__1,u__2,u__3,u__4,u__5,u__6);
set allu7(u__1,u__2,u__3,u__4,u__5,u__6,u__7);
set allu8(u__1,u__2,u__3,u__4,u__5,u__6,u__7,u__8);
set allu9(u__1,u__2,u__3,u__4,u__5,u__6,u__7,u__8,u__9);
set allu10(u__1,u__2,u__3,u__4,u__5,u__6,u__7,u__8,u__9,u__10);

FILES
 gp_screen               /""/
 gp_input                /gnuplot.inp/
 gp_data                 /gnuplot.dat/
 gp_data_mp1             /gnuplot_mp1.dat/
 gp_data_mp2             /gnuplot_mp2.dat/
 gp_data_mp3             /gnuplot_mp3.dat/
 gp_data_mp4             /gnuplot_mp4.dat/
 gp_data_mp5             /gnuplot_mp5.dat/
 gp_data_mp6             /gnuplot_mp6.dat/
 gp_data_mp7             /gnuplot_mp7.dat/
 gp_data_mp8             /gnuplot_mp8.dat/
 gp_data_mp9             /gnuplot_mp9.dat/
 gp_data_mp10            /gnuplot_mp10.dat/
 gp_data_mp11            /gnuplot_mp11.dat/
 gp_data_mp12            /gnuplot_mp12.dat/
 gp_data_mp13            /gnuplot_mp13.dat/
 gp_data_mp14            /gnuplot_mp14.dat/
 gp_data_mp15            /gnuplot_mp15.dat/
 gp_data_mp16            /gnuplot_mp16.dat/
 gp_data_mp17            /gnuplot_mp17.dat/
 gp_winini               /wgnuplot.ini/
 gpxyz_logscreen_putfile /''/
;

SCALARS
 gp_autoarrangement /0/
 gp_count
 gp_count_2
 gp_continue_loop
 gp_plot_count /0/
 gp_na         /na/
 gp_supzer permit user to supress zero values
 gp_ymin_value
 gp_ymax
 gp_xmax
 gp_xmin_value
 gp_y2low
 gp_y2up
 gp_x2low
 gp_x2up
 gpxyz_stoppvalue /0/
 gnuplotxyz_ploterror_nodata /0/
 gnuplotxyz_current_nodata  /0/
;

PARAMETERS
 gp_spider_max(*)
 gp_scencount(*) scenario counter
 gp_00(*) number of zeros at the end
 gp_xy(*) total observations
 gp__0(*) total observations minus end zeros
;

SETS
 gp_line_color_name
 /
  grey0  "0,0,0", grey1  "3,3,3", grey2  "5,5,5", grey3  "8,8,8", grey4  "10,10,10", grey5  "13,13,13", grey6  "15,15,15"
  grey7  "18,18,18", grey8  "20,20,20", grey9  "23,23,23", grey10  "26,26,26", grey11  "28,28,28", grey12  "31,31,31", grey13  "33,33,33"
  grey14  "36,36,36", grey15  "38,38,38", grey16  "41,41,41", grey17  "43,43,43", grey18  "46,46,46", grey19  "48,48,48", grey20  "51,51,51"
  grey21  "54,54,54", grey22  "56,56,56", grey23  "59,59,59", grey24  "61,61,61", grey25  "64,64,64", grey26  "66,66,66", grey27  "69,69,69"
  grey28  "71,71,71", grey29  "74,74,74", grey30  "77,77,77", grey31  "79,79,79", grey32  "82,82,82", grey33  "84,84,84", grey34  "87,87,87"
  grey35  "89,89,89", grey36  "92,92,92", grey37  "94,94,94", grey38  "97,97,97", grey39  "99,99,99", grey40  "102,102,102", grey41  "105,105,105"
  grey42  "107,107,107", grey43  "110,110,110", grey44  "112,112,112", grey45  "115,115,115", grey46  "117,117,117", grey47  "120,120,120", grey48  "122,122,122"
  grey49  "125,125,125", grey50  "127,127,127", grey51  "130,130,130", grey52  "133,133,133", grey53  "135,135,135", grey54  "138,138,138", grey55  "140,140,140"
  grey56  "143,143,143", grey57  "145,145,145", grey58  "148,148,148", grey59  "150,150,150", grey60  "153,153,153", grey61  "156,156,156", grey62  "158,158,158"
  grey63  "161,161,161", grey64  "163,163,163", grey65  "166,166,166", grey66  "168,168,168", grey67  "171,171,171", grey68  "173,173,173", grey69  "176,176,176"
  grey70  "179,179,179", grey71  "181,181,181", grey72  "184,184,184", grey73  "186,186,186", grey74  "189,189,189", grey75  "191,191,191", grey76  "194,194,194"
  grey77  "196,196,196", grey78  "199,199,199", grey79  "201,201,201", grey80  "204,204,204", grey81  "207,207,207", grey82  "209,209,209", grey83  "212,212,212"
  grey84  "214,214,214", grey85  "217,217,217", grey86  "219,219,219", grey87  "222,222,222", grey88  "224,224,224", grey89  "227,227,227", grey90  "229,229,229"
  grey91  "232,232,232", grey92  "235,235,235", grey93  "237,237,237", grey94  "240,240,240", grey95  "242,242,242", grey96  "245,245,245", grey97  "247,247,247"
  grey98  "250,250,250", grey99  "252,252,252", grey100  "255,255,255", redgreen1  "165,15,21", redgreen2  "222,45,38", redgreen3  "251,106,74", redgreen4  "252,146,114"
  redgreen5  "252,187,161", redgreen6  "254,229,217", redgreen7  "237,248,233", redgreen8  "199,233,192", redgreen9  "161,217,155", redgreen10  "116,196,118", redgreen11  "49,163,84"
  redgreen12  "0,109,44", diverging1_1  "84,48,5", diverging1_2  "140,81,10", diverging1_3  "191,129,45", diverging1_4  "223,194,125", diverging1_5  "246,232,195", diverging1_6  "245,245,245"
  diverging1_7  "199,234,229", diverging1_8  "128,205,193", diverging1_9  "53,151,143", diverging1_10  "1,102,94", diverging1_11  "0,60,48", diverging2_1  "64,0,75", diverging2_2  "118,42,131"
  diverging2_3  "153,112,171", diverging2_4  "194,165,207", diverging2_5  "231,212,232", diverging2_6  "247,247,247", diverging2_7  "217,240,211", diverging2_8  "166,219,160", diverging2_9  "90,174,97"
  diverging2_10  "27,120,55", diverging2_11  "0,68,27", qualitative1_1  "166,206,227", qualitative1_2  "31,120,180", qualitative1_3  "178,223,138", qualitative1_4  "51,160,44", qualitative1_5  "251,154,153"
  qualitative1_6  "227,26,28", qualitative1_7  "253,191,111", qualitative1_8  "255,127,0", qualitative1_9  "202,178,214", qualitative1_10  "106,61,154", qualitative1_11  "255,255,153", qualitative1_12  "177,89,40"

  aliceblue '240 248 255',antiquewhite '250 235 215',aqua '0 255 255',aquamarine '127 255 212',azure '240 255 255',beige '245 245 220',
  bisque '255 228 196',black '0 0 0',blanchedalmond '255 235 205',blue '0  0 255',blueviolet '138  43 226',brown '165  42  42',
  BrightCyan '0 255 255',BrightGreen '0 255 0',BrightMagneta '255 0 255',burlywood '222 184 135',cadetblue '95 158 160',chartreuse '127 255  0',
  chocolate '210 105  30',coral '255 127  80',cornflowerblue '100 149 237',cornsilk '255 248 220',crimson '220 20 60',cyan '0 255 255',
  darkblue '0 0 139',darkcyan '0 139 139',darkgoldenrod '184 134  11',darkgray '169 169 169',darkgreen '0 100  0',DarkGrey '128 128 128',
  darkkhaki '189 183 107',darkmagenta '139  0 139',darkolivegreen '85 107  47',darkorange '255 140  0',darkorchid '153  50 204',darkred '139  0  0',
  darksalmon '233 150 122',darkseagreen '143 188 143',darkslateblue '72  61 139',darkslategray '47  79  79',darkturquoise '0 206 209',darkviolet '148  0 211',
  deeppink '255  20 147',deepskyblue '0 191 255',dimgray '105 105 105',dodgerblue '30 144 255',firebrick '178  34  34',floralwhite '255 250 240',
  forestgreen '34 139  34',fuchsia '255 0 255',gainsboro '220 220 220',ghostwhite '248 248 255',gold '255 215  0',goldenrod '218 165  32',
  gray '127 127 127',green '0 128 0',greenyellow '173 255  47',honeydew '240 255 240',hotpink '255 105 180',indianred '205  92  92',
  indigo '75 0 130',ivory '255 255 240',khaki '240 230 140',lavender '230 230 250',lavenderblush '255 240 245',lawngreen '124 252  0',
  lemonchiffon '255 250 205',lightblue '173 216 230',lightcoral '240 128 128',lightcyan '224 255 255',lightgoldenrodyellow '250 250 210',lightgreen '144 238 144',
  lightgrey '211 211 211',lightpink '255 182 193',lightsalmon '255 160 122',lightseagreen '32 178 170',lightskyblue '135 206 250',lightslategray '119 136 153',
  lightsteelblue '176 196 222',lightyellow '255 255 224',lime '0 255 0',limegreen '50 205  50',linen '250 240 230',magenta '255  0 255',
  Magneta '128 0 128',maroon '128 0 0',mediumaquamarine '102 205 170',mediumblue '0 0 205',mediumorchid '186  85 211',mediumpurple '147 112 219',
  mediumseagreen '60 179 113',mediumslateblue '123 104 238',mediumspringgreen '0 250 154',mediumturquoise '72 209 204',mediumvioletred '199  21 133',midnightblue '25  25 112',
  mintcream '245 255 250',mistyrose '255 228 225',moccasin '255 228 181',navajowhite '255 222 173',navy '0  0 128',navyblue '159 175 223',
  oldlace '253 245 230',olive '128 128 0',olivedrab '107 142  35',orange '255 165  0',orangered '255  69  0',orchid '218 112 214',
  palegoldenrod '238 232 170',palegreen '152 251 152',paleturquoise '175 238 238',palevioletred '219 112 147',papayawhip '255 239 213',peachpuff '255 218 185',
  peru '205 133  63',pink '255 192 203',plum '221 160 221',powderblue '176 224 230',purple '128 0 128',red '255  0  0',
  rosybrown '188 143 143',royalblue '65 105 225',saddlebrown '139 69 19',salmon '250 128 114',sandybrown '244 164  96',seagreen '46 139  87',
  seashell '255 245 238',sienna '160  82  45',silver '192 192 192',skyblue '135 206 235',slateblue '106  90 205',slategray '112 128 144',
  snow '255 250 250',springgreen '0 255 127',steelblue '70 130 180',tan '210 180 140',teal '0 128 128',thistle '216 191 216',
  tomato '255  99  71',turquoise '64 224 208',violet '238 130 238',wheat '245 222 179',white '255 255 255',whitesmoke '245 245 245',
  yellow '255 255  0',yellowgreen '139 205 50'
 /
 gp_hex_color_name
 /
  grey0  "000000", grey1  "030303", grey2  "050505", grey3  "080808", grey4  "0A0A0A", grey5  "0D0D0D", grey6  "0F0F0F"
  grey7  "121212", grey8  "141414", grey9  "171717", grey10  "1A1A1A", grey11  "1C1C1C", grey12  "1F1F1F", grey13  "212121"
  grey14  "242424", grey15  "262626", grey16  "292929", grey17  "2B2B2B", grey18  "2E2E2E", grey19  "303030", grey20  "333333"
  grey21  "363636", grey22  "383838", grey23  "3B3B3B", grey24  "3D3D3D", grey25  "404040", grey26  "424242", grey27  "454545"
  grey28  "474747", grey29  "4A4A4A", grey30  "4D4D4D", grey31  "4F4F4F", grey32  "525252", grey33  "545454", grey34  "575757"
  grey35  "595959", grey36  "5C5C5C", grey37  "5E5E5E", grey38  "616161", grey39  "636363", grey40  "666666", grey41  "696969"
  grey42  "6B6B6B", grey43  "6E6E6E", grey44  "707070", grey45  "737373", grey46  "757575", grey47  "787878", grey48  "7A7A7A"
  grey49  "7D7D7D", grey50  "7F7F7F", grey51  "828282", grey52  "858585", grey53  "878787", grey54  "8A8A8A", grey55  "8C8C8C"
  grey56  "8F8F8F", grey57  "919191", grey58  "949494", grey59  "969696", grey60  "999999", grey61  "9C9C9C", grey62  "9E9E9E"
  grey63  "A1A1A1", grey64  "A3A3A3", grey65  "A6A6A6", grey66  "A8A8A8", grey67  "ABABAB", grey68  "ADADAD", grey69  "B0B0B0"
  grey70  "B3B3B3", grey71  "B5B5B5", grey72  "B8B8B8", grey73  "BABABA", grey74  "BDBDBD", grey75  "BFBFBF", grey76  "C2C2C2"
  grey77  "C4C4C4", grey78  "C7C7C7", grey79  "C9C9C9", grey80  "CCCCCC", grey81  "CFCFCF", grey82  "D1D1D1", grey83  "D4D4D4"
  grey84  "D6D6D6", grey85  "D9D9D9", grey86  "DBDBDB", grey87  "DEDEDE", grey88  "E0E0E0", grey89  "E3E3E3", grey90  "E5E5E5"
  grey91  "E8E8E8", grey92  "EBEBEB", grey93  "EDEDED", grey94  "F0F0F0", grey95  "F2F2F2", grey96  "F5F5F5", grey97  "F7F7F7"
  grey98  "FAFAFA", grey99  "FCFCFC", grey100  "FFFFFF", redgreen1  "a50f15", redgreen2  "de2d26", redgreen3  "fb6a4a", redgreen4  "fc9272"
  redgreen5  "fcbba1", redgreen6  "fee5d9", redgreen7  "edf8e9", redgreen8  "c7e9c0", redgreen9  "a1d99b", redgreen10  "74c476", redgreen11  "31a354"
  redgreen12  "006d2c", diverging1_1  "543005", diverging1_2  "8c510a", diverging1_3  "bf812d", diverging1_4  "dfc27d", diverging1_5  "f6e8c3", diverging1_6  "F5F5F5"
  diverging1_7  "c7eae5", diverging1_8  "80cdc1", diverging1_9  "35978f", diverging1_10  "01665e", diverging1_11  "003c30", diverging2_1  "40004b", diverging2_2  "762a83"
  diverging2_3  "9970ab", diverging2_4  "c2a5cf", diverging2_5  "e7d4e8", diverging2_6  "F7F7F7", diverging2_7  "d9f0d3", diverging2_8  "a6dba0", diverging2_9  "5aae61"
  diverging2_10  "1b7837", diverging2_11  "00441b", qualitative1_1  "a6cee3", qualitative1_2  "1f78b4", qualitative1_3  "b2df8a", qualitative1_4  "33a02c", qualitative1_5  "fb9a99"
  qualitative1_6  "e31a1c", qualitative1_7  "fdbf6f", qualitative1_8  "ff7f00", qualitative1_9  "cab2d6", qualitative1_10  "6a3d9a", qualitative1_11  "ffff99", qualitative1_12  "b15928"

  aliceblue 'F0F8FF',antiquewhite 'FAEBD7',aqua '00FFFF',aquamarine '7FFFD4',azure 'F0FFFF',beige 'F5F5DC',
  bisque 'FFE4C4',black '000000',blanchedalmond 'FFEBCD',blue '0000FF',blueviolet '8A2BE2',brown 'A52A2A',
  burlywood 'DEB887',cadetblue '5F9EA0',chartreuse '7FFF00',chocolate 'D2691E',coral 'FF7F50',cornflowerblue '6495ED',
  cornsilk 'FFF8DC',crimson 'DC143C',cyan '00FFFF',darkblue '00008B',darkcyan '008B8B',darkgoldenrod 'B8860B',
  darkgray 'A9A9A9',darkgreen '006400',darkkhaki 'BDB76B',darkmagenta '8B008B',darkolivegreen '556B2F',darkorange 'FF8C00',
  darkorchid '9932CC',darkred '8B0000',darksalmon 'E9967A',darkseagreen '8FBC8F',darkslateblue '483D8B',darkslategray '2F4F4F',
  darkturquoise '00CED1',darkviolet '9400D3',deeppink 'FF1493',deepskyblue '00BFFF',dimgray '696969',dodgerblue '1E90FF',
  firebrick 'B22222',floralwhite 'FFFAF0',forestgreen '228B22',fuchsia 'FF00FF',gainsboro 'DCDCDC',ghostwhite 'F8F8FF',
  gold 'FFD700',goldenrod 'DAA520',gray '7F7F7F',green '008000',greenyellow 'ADFF2F',honeydew 'F0FFF0',
  hotpink 'FF69B4',indianred 'CD5C5C',indigo '4B0082',ivory 'FFFFF0',khaki 'F0E68C',lavender 'E6E6FA',
  lavenderblush 'FFF0F5',lawngreen '7CFC00',lemonchiffon 'FFFACD',lightblue 'ADD8E6',lightcoral 'F08080',lightcyan 'E0FFFF',
  lightgoldenrodyellow 'FAFAD2',lightgreen '90EE90',lightgrey 'D3D3D3',lightpink 'FFB6C1',lightsalmon 'FFA07A',lightseagreen '20B2AA',
  lightskyblue '87CEFA',lightslategray '778899',lightsteelblue 'B0C4DE',lightyellow 'FFFFE0',lime '00FF00',limegreen '32CD32',
  linen 'FAF0E6',magenta 'FF00FF',maroon '800000',mediumaquamarine '66CDAA',mediumblue '0000CD',mediumorchid 'BA55D3',
  mediumpurple '9370DB',mediumseagreen '3CB371',mediumslateblue '7B68EE',mediumspringgreen '00FA9A',mediumturquoise '48D1CC',mediumvioletred 'C71585',
  midnightblue '191970',mintcream 'F5FFFA',mistyrose 'FFE4E1',moccasin 'FFE4B5',navajowhite 'FFDEAD',navy '000080',
  navyblue '9FAFDF',oldlace 'FDF5E6',olive '808000',olivedrab '6B8E23',orange 'FFA500',orangered 'FF4500',
  orchid 'DA70D6',palegoldenrod 'EEE8AA',palegreen '98FB98',paleturquoise 'AFEEEE',palevioletred 'DB7093',papayawhip 'FFEFD5',
  peachpuff 'FFDAB9',peru 'CD853F',pink 'FFC0CB',plum 'DDA0DD',powderblue 'B0E0E6',purple '800080',
  red 'FF0000',rosybrown 'BC8F8F',royalblue '4169E1',saddlebrown '8B4513',salmon 'FA8072',sandybrown 'F4A460',
  seagreen '2E8B57',seashell 'FFF5EE',sienna 'A0522D',silver 'C0C0C0',skyblue '87CEEB',slateblue '6A5ACD',
  slategray '708090',snow 'FFFAFA',springgreen '00FF7F',steelblue '4682B4',tan 'D2B48C',teal '008080',
  thistle 'D8BFD8',tomato 'FF6347',turquoise '40E0D0',violet 'EE82EE',wheat 'F5DEB3',white 'FFFFFF',
  whitesmoke 'F5F5F5',yellow 'FFFF00',yellowgreen '9ACD32'
 /
 gp_xyz_ind_col(*)
 gp_xyz_fixed_col(*,*)
 gp_fixlinecolormap(gp_hex_color_name,*)
;

* exit if blank invocation
* the next two lines have to be after all declarations to allow
* using gnuplotxyz within loops
$if "%1" == ""                                    $goto gpxyzlabel_endofgnupltxyz
$if "%1" == "loop"                                $goto gpxyzlabel_endofgnupltxyz


* +++++++++++++++++++++++++++++++++++++++++++++++ *
*              After declararation                *
* +++++++++++++++++++++++++++++++++++++++++++++++ *

$label gpxyzlabel_declared1

* Initialize
gp_scencount("gp_nothing") = 0;
gp_xyz_fixed_col(gp_line_color_name,"gp_nothing") = no;
gnuplotxyz_ploterror_nodata = 0;

* retain name of output file (not relevant for windows terminal)
$if not setglobal gp_keepname                     $goto gpxyzlabel_afterkeepname_assignment
$if "%gp_keepname%" == "no"                       $goto gpxyzlabel_afterkeepname_assignment
$setglobal gp_name %gp_keepname%
$label gpxyzlabel_afterkeepname_assignment

* change plot style from histograms to lines if 3rd argument is provided
$if a%3==a                                        $goto gpxyzlabel_afterstylecheck
$if "%gp_style%" == "histogram"                   $setglobal gp_style linespoints
$if "%gp_style%" == "newhistogram"                $setglobal gp_style linespoints
$label gpxyzlabel_afterstylecheck

* exit if not declared
$if a%1==a                                        $exit
$if declared %1                                   $goto gpxyzlabel_declared2
$if a%1==afunction                                $goto gpxyzlabel_compile_input_commands

$error GNUPLOT: Identifier %1 is not declared.
$exit


* exit if not defined
$label gpxyzlabel_declared2
$if defined %1                                    $goto gpxyzlabel_defined0
$error GNUPLOT: Identifier %1 is not defined.
$exit

$label gpxyzlabel_defined0

* multiplot
$if not setglobal gp_multiplot                    $setglobal gp_multiplot_count     ""
$if '%gp_multiplot%' == 'no'                      $setglobal gp_multiplot_count     ""
$if not setglobal gp_multiplot                    $goto after_gp_multiplot_count_calc
$if '%gp_multiplot%' == 'no'                      $goto after_gp_multiplot_count_calc

* Update multiplot string
$if '%gp_multiplot_count%' == '_mp16'             $setglobal gp_multiplot_count    _mp17
$if '%gp_multiplot_count%' == '_mp15'             $setglobal gp_multiplot_count    _mp16
$if '%gp_multiplot_count%' == '_mp14'             $setglobal gp_multiplot_count    _mp15
$if '%gp_multiplot_count%' == '_mp13'             $setglobal gp_multiplot_count    _mp14
$if '%gp_multiplot_count%' == '_mp12'             $setglobal gp_multiplot_count    _mp13
$if '%gp_multiplot_count%' == '_mp11'             $setglobal gp_multiplot_count    _mp12
$if '%gp_multiplot_count%' == '_mp10'             $setglobal gp_multiplot_count    _mp11
$if '%gp_multiplot_count%' == '_mp9'              $setglobal gp_multiplot_count    _mp10
$if '%gp_multiplot_count%' == '_mp8'              $setglobal gp_multiplot_count    _mp9
$if '%gp_multiplot_count%' == '_mp7'              $setglobal gp_multiplot_count    _mp8
$if '%gp_multiplot_count%' == '_mp6'              $setglobal gp_multiplot_count    _mp7
$if '%gp_multiplot_count%' == '_mp5'              $setglobal gp_multiplot_count    _mp6
$if '%gp_multiplot_count%' == '_mp4'              $setglobal gp_multiplot_count    _mp5
$if '%gp_multiplot_count%' == '_mp3'              $setglobal gp_multiplot_count    _mp4
$if '%gp_multiplot_count%' == '_mp2'              $setglobal gp_multiplot_count    _mp3
$if '%gp_multiplot_count%' == '_mp1'              $setglobal gp_multiplot_count    _mp2
$if not setglobal gp_multiplot_count              $setglobal gp_multiplot_count    _mp1
$label after_gp_multiplot_count_calc

$setglobal gp_data_string gp_data
$if setglobal gp_multiplot                        $setglobal gp_data_string gp_data%gp_multiplot_count%
$if '%gp_multiplot%' == 'no'                      $setglobal gp_data_string gp_data


* Assign and direct procedure based on dimensions of plot item
* 2 - Dimensional parameter without 2nd argument -> histogram style
* 3 - Dimensional parameter without 2nd argument -> newhistogram style
$if dimension 1 %1                                $goto gpxyzlabel_assign1Dsets
$if dimension 2 %1                                $goto gpxyzlabel_assign2Dsets
$if dimension 3 %1                                $goto gpxyzlabel_assign3Dsets
$if dimension 4 %1                                $goto gpxyzlabel_assign4Dsets
$error GNUPLOT error: Identifier %1 has more than 4 dimensions
$exit


* 1D Setup
$label gpxyzlabel_assign1Dsets
uu___1(u__1) $ %1(u__1)=yes;
$goto  gpxyzlabel_assign_more_variables


* 2D Setup - Histograms and Spiderplots
$label gpxyzlabel_assign2Dsets
$if not setglobal gp_style            $setglobal gp_style histogram
$if not "%gp_style%" == "spiderplot"  $setglobal gp_style histogram
allu2(u__1,u__2) $(%1(u__1,u__2)) = yes;
uu___2(u__2)     $ sum(allu2(u__1,u__2),1)   = yes;
uu___1(u__1)     $ sum(allu2(u__1,uu___2),1) = yes;
allu2(u__1,u__2) $(%1(u__1,u__2))=no;
$goto gpxyzlabel_assign_more_variables


* 3D Setup
$label gpxyzlabel_assign3Dsets
$if "%gp_style%" == "histogram"                   $goto gpxyzlabel_assign_newhistogram_sets
$if a%2==a                                        $goto gpxyzlabel_assign_newhistogram_sets
$if not a%3==a                                    $goto gpxyzlabel_define__2D_2
$error GNUPLOT2: Vertical axis to be graphed 3rd argument is not present.
$exit

* a) line plots
$label gpxyzlabel_define__2D_2
allu3(u__1,u__2,"%2") $ %1(u__1,u__2,"%2")=yes;
allu3(u__1,u__2,"%3") $ %1(u__1,u__2,"%3")=yes;
uu___3("%3")=yes;
uu___3("%2")=yes;
uu___2(u__2)$sum(allu3(u__1,u__2,uu___3),1) =yes;
uu___1(u__1)$sum(allu3(u__1,uu___2,uu___3),1)=yes;
allu3(u__1,u__2,u__3)$(%1(u__1,u__2,"%2") or %1(u__1,u__2,"%3"))=no;
$goto gpxyzlabel_assign_more_variables


* b) new histogram plots
$label gpxyzlabel_assign_newhistogram_sets
allu3(u__1,u__2,u__3) $(%1(u__1,u__2,u__3))   = yes;
uu___3(u__3) $sum(allu3(u__1,u__2,u__3),1)    = yes;
uu___2(u__2) $sum(allu3(u__1,u__2,uu___3),1)  = yes;
uu___1(u__1) $sum(allu3(u__1,uu___2,uu___3),1)= yes;
allu3(u__1,u__2,u__3) $(%1(u__1,u__2,u__3)) = no;
$goto gpxyzlabel_assign_more_variables


* 4D Setup - Planes
$label gpxyzlabel_assign4Dsets
$if not a%2==a                                    $goto gpxyzlabel_assign4Dsets_1
$error GNUPLOT2: Horizontal axis to be graphed 2nd argument is not present.
$exit

$label gpxyzlabel_assign4Dsets_1
$if not a%3==a                                    $goto gpxyzlabel_assign4Dsets_2
$error GNUPLOT2: Z axis to be graphed 3rd argument is not present.
$exit

$label gpxyzlabel_assign4Dsets_2
$if not a%3==a                                    $goto gpxyzlabel_assign4Dsets_3
$error GNUPLOT2: Vertical axis to be graphed 4th argument is not present.
$exit

$label gpxyzlabel_assign4Dsets_3
allu4(u__1,u__2,u__3,u__4)
 $(%1(u__1,u__2,u__3,"%2") or
   %1(u__1,u__2,u__3,"%3") or
   %1(u__1,u__2,u__3,"%4")   )
 = yes;

uu___4("%4") = yes;
uu___4("%3") = yes;
uu___4("%2") = yes;
uu___3(u__3) $sum(allu4(u__1,u__2,u__3,uu___4),1) = yes;
uu___2(u__2) $sum(allu4(u__1,u__2,u__3,uu___4),1) = yes;
uu___1(u__1) $sum(allu4(u__1,uu___2,uu___3,uu___4),1)=yes;

allu4(u__1,u__2,u__3,u__4)
 $(%1(u__1,u__2,u__3,"%2") or
   %1(u__1,u__2,u__3,"%3") or
   %1(u__1,u__2,u__3,"%4")   )
 = no;
$goto gpxyzlabel_assign_more_variables


$label gpxyzlabel_assign_more_variables
$if not setglobal gp_name                         $setglobal gp_name '%1'
$if "%gp_name%" == "no"                           $setglobal gp_name '%1'

* 1D names
$if dimension 1 %1                                $setglobal gp_scen      'uu___1'
$if dimension 1 %1                                $setglobal gp_xxxvalue  ""
$if dimension 1 %1                                $setglobal gp_yyyvalue  "%1"
$if dimension 1 %1                                $goto gpxyzlabel_abort_1D_plot

* 2D names
$if dimension 2 %1                                $setglobal gp_scen      'uu___1'
$if dimension 2 %1                                $setglobal gp_obsv_1    'uu___2'
$if dimension 2 %1                                $goto gpxyzlabel_abort_2D_plot

* 3D names
$if dimension 3 %1                                $setglobal gp_scen      'uu___1'
$if dimension 3 %1                                $setglobal gp_obsv_1    'uu___2'
$if a%2==a                                        $setglobal gp__col3     'uu___3'
$if a%2==a                                        $goto gpxyzlabel_abort_newhistogram

$if dimension 3 %1                                $setglobal gp_xxxvalue  "%2"
$if dimension 3 %1                                $setglobal gp_yyyvalue  "%3"
$if dimension 3 %1                                $setglobal gp__col3     "%4"
$if dimension 3 %1                                $setglobal gp__col4     "%5"
$if dimension 3 %1                                $setglobal gp__col5     "%6"
$if dimension 3 %1                                $setglobal gp__col6     "%7"
$if dimension 3 %1                                $goto gpxyzlabel_abort_3D_plot

* 4D names
$if dimension 4 %1                                $setglobal gp_planes    'uu___1'
$if dimension 4 %1                                $setglobal gp_obsv_1    'uu___2'
$if dimension 4 %1                                $setglobal gp_obsv_2    'uu___3'
$if dimension 4 %1                                $setglobal gp_scen      'uu___4'
$if dimension 4 %1                                $setglobal gp_xxxvalue  "%2"
$if dimension 4 %1                                $setglobal gp_yyyvalue  "%3"
$if dimension 4 %1                                $setglobal gp_zzzvalue  "%4"
$if dimension 4 %1                                $goto gpxyzlabel_abort_4D_plot

$if dimension 4 %1                                $include gnuplot_temp.dat


* 1 D data check
$label gpxyzlabel_abort_1D_plot
gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum(%gp_scen% $%1(%gp_scen%),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* data for ', '%1' ,' are all zero' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );
$goto gpxyzlabel_compile_input_commands

* 2 D data check
$label gpxyzlabel_abort_2D_plot
gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
  $(sum((%gp_scen%,%gp_obsv_1%)
     $%1(%gp_scen%,%gp_obsv_1%),1) eq 0)
  = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* data for ', '%1' ,' are all zero' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );
$goto gpxyzlabel_compile_input_commands


* 3 D data check
$label gpxyzlabel_abort_3D_plot
gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_scen%,%gp_obsv_1%)
    $%1(%gp_scen%,%gp_obsv_1%,'%gp_xxxvalue%'),1) eq 0 and
   sum((%gp_scen%,%gp_obsv_1%)
    $%1(%gp_scen%,%gp_obsv_1%,'%gp_yyyvalue%'),1) ne 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* %gp_xxxvalue% all zero in ', '%1' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );

gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_scen%,%gp_obsv_1%)
    $%1(%gp_scen%,%gp_obsv_1%,'%gp_xxxvalue%'),1) ne 0 and
   sum((%gp_scen%,%gp_obsv_1%)
    $%1(%gp_scen%,%gp_obsv_1%,'%gp_yyyvalue%'),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* %gp_yyyvalue% all zero in ', '%1' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );


gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_scen%,%gp_obsv_1%)
    $%1(%gp_scen%,%gp_obsv_1%,'%gp_xxxvalue%'),1) eq 0 and
   sum((%gp_scen%,%gp_obsv_1%)
    $%1(%gp_scen%,%gp_obsv_1%,'%gp_yyyvalue%'),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* %gp_yyyvalue% and %gp_xxxvalue% all zero in ', '%1' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );

$goto gpxyzlabel_compile_input_commands

* New histogram data check
$label gpxyzlabel_abort_newhistogram
gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_scen%,%gp_obsv_1%,%gp__col3%)
  $%1(%gp_scen%,%gp_obsv_1%,%gp__col3%),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* data for ', '%1' ,' are all zero' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );
$goto gpxyzlabel_compile_input_commands

* 4 D data check
$label gpxyzlabel_abort_4D_plot
gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_planes%,%gp_obsv_1%,%gp_obsv_2%)
  $%1(%gp_planes%,%gp_obsv_1%,%gp_obsv_2%,'%gp_xxxvalue%'),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* data for %gp_xxxvalue% column are all zero in ','%1' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );

gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_planes%,%gp_obsv_1%,%gp_obsv_2%)
  $%1(%gp_planes%,%gp_obsv_1%,%gp_obsv_2%,'%gp_zzzvalue%'),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* data for %gp_zzzvalue% column are all zero in ','%1' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );

gnuplotxyz_current_nodata = 0;
gnuplotxyz_current_nodata
 $(sum((%gp_planes%,%gp_obsv_1%,%gp_obsv_2%)
  $%1(%gp_planes%,%gp_obsv_1%,%gp_obsv_2%,'%gp_yyyvalue%'),1) eq 0)
 = 1;
IF(gnuplotxyz_current_nodata gt 0.5,
 PUT gpxyz_logscreen_putfile,
  '*' /
  '*' /
  '* gnuplot warning - plot skipped ' /
  '* data for %gp_yyyvalue% column are all zero in ','%1' /
  '*' /
  '*' /;
gnuplotxyz_ploterror_nodata = 1;
 );
$goto gpxyzlabel_compile_input_commands


* ++++++++++++++++++++++++++++++++++++++++++++++++ *
*                                                  *
*       Gnuplot.inp - Contains Gnuplot Commands    *
*                                                  *
* ++++++++++++++++++++++++++++++++++++++++++++++++ *

$label gpxyzlabel_compile_input_commands

put gp_input;
gp_input.ap =  0;
gp_input.lw =  0;
gp_input.nr =  0;
gp_input.nd =  0;
gp_input.nw =  0;
gp_input.pw =32767;

$if not "%gp_multiplot_count%" == "_mp1"          gp_input.ap =  1;
$if not setglobal gp_multiplot                    gp_input.ap =  0;
$if '%gp_multiplot%' == 'no'                      gp_input.ap =  0;


* Color
$if not setglobal gp_color                        $setglobal gp_color 'color'
$if     "%gp_color%" =="yes"                      $setglobal gp_color 'color'
$if     "%gp_color%" =="monochrome"               $setglobal gp_color 'monochrome'
$if     "%gp_color%" =="no"                       $setglobal gp_color 'monochrome'

* Font
$if not setglobal gp_font                         $setglobal gp_font 'Times New Roman'
$if     "%gp_font%" == "no"                       $setglobal gp_font 'Times New Roman'

* Font Size
$if     setglobal gp_fntsize                      $setglobal gp_fontsize %gp_fntsize%
$if not setglobal gp_fontsize                     $setglobal gp_fontsize '14'
$if     "%gp_fontsize%" == "no"                   $setglobal gp_fontsize '14'

* Line Width
$if setglobal gp_lw                               $setglobal gp_lwidth  %gp_linewidth%
$if setglobal gp_linewidth                        $setglobal gp_lwidth  %gp_linewidth%
$if "%gp_lwidth%" == "no"                         $setglobal gp_lwidth  '1'
$if not setglobal gp_lwidth                       $setglobal gp_lwidth  '1'


$if "%gp_multiplot_count%" == "_mp1"               $goto gpxyzlabel_specify_termoptions
$if not setglobal gp_multiplot                     $goto gpxyzlabel_specify_termoptions
$if '%gp_multiplot%' == 'no'                       $goto gpxyzlabel_specify_termoptions
$goto gpxyzlabel_specify_winoptions


* Terminals
$label gpxyzlabel_specify_termoptions

$if "%gp_ppt%" =="no"                              $goto gpxyzlabel_after_terminal_ppt
$if     setglobal gp_ppt                           $setglobal gp_term 'emf'
$if     setglobal gp_ppt                           $setglobal gp_extension 'emf'
$goto gpxyzlabel_after_terminal_ppt

$label gpxyzlabel_after_terminal_ppt
$if not setglobal gp_term                         $setglobal gp_term "windows"
$if not setglobal gp_extension                    $setglobal gp_extension "%gp_term%"
$if "%gp_extension%" == "no"                      $setglobal gp_extension "%gp_term%"

put "set terminal %gp_term%";
put " font '%gp_font%, %gp_fontsize%' linewidth %gp_lwidth% size 871,653";
put /;
$if not setglobal gp_termoption                   $goto gpxyzlabel_more_on_terminal
$if     "%gp_termoption%"=="no"                   $goto gpxyzlabel_more_on_terminal
put "set termoption %gp_termoption%" /;
$goto gpxyzlabel_more_on_terminal

$label gpxyzlabel_more_on_terminal
*$if     "%gp_term%" =="windows"                   put "set terminal windows" /;
*$if not setglobal gp_termoption                   $setglobal gp_termoption noenhanced
*$if     "%gp_termoption%"=="no"                   $setglobal gp_termoption noenhanced
*put "set termoption %gp_termoption%" /;
gpxyzsm_plot_count = gpxyzsm_plot_count + 1;

$if     "%gp_term%"=="windows"                    $goto gpxyzlabel_specify_winoptions
$if     "%gp_ppt%" =="no"                         put "set output '%gp_name%.%gp_extension%'"/;
$if     "%gp_ppt%" =="no"                         $goto gpxyzlabel_specify_winoptions
$if     setglobal gp_ppt                          $goto gpxyzlabel_determine_ppt_graph_name
$if not setglobal gp_ppt                          put "set output '%gp_name%_",gpxyzsm_plot_count,".%gp_extension%'"/;
$goto gpxyzlabel_specify_winoptions

* Insert Auto Code 2 produced by make_2_pptplots.gms Sub Section 1 - Begin
$label gpxyzlabel_determine_ppt_graph_name
$if not setglobal gp_ppt_2                        $goto gpxyzlabel_after_ppt_output_name_2
$if setglobal gp_ppt_2                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_2%.%gp_extension%'" /;
$if setglobal gp_ppt_2                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_2

$if not setglobal gp_ppt_3                        $goto gpxyzlabel_after_ppt_output_name_3
$if setglobal gp_ppt_3                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_3%.%gp_extension%'" /;
$if setglobal gp_ppt_3                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_3

$if not setglobal gp_ppt_4                        $goto gpxyzlabel_after_ppt_output_name_4
$if setglobal gp_ppt_4                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_4%.%gp_extension%'" /;
$if setglobal gp_ppt_4                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_4

$if not setglobal gp_ppt_5                        $goto gpxyzlabel_after_ppt_output_name_5
$if setglobal gp_ppt_5                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_5%.%gp_extension%'" /;
$if setglobal gp_ppt_5                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_5

$if not setglobal gp_ppt_6                        $goto gpxyzlabel_after_ppt_output_name_6
$if setglobal gp_ppt_6                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_6%.%gp_extension%'" /;
$if setglobal gp_ppt_6                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_6

$if not setglobal gp_ppt_7                        $goto gpxyzlabel_after_ppt_output_name_7
$if setglobal gp_ppt_7                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_7%.%gp_extension%'" /;
$if setglobal gp_ppt_7                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_7

$if not setglobal gp_ppt_8                        $goto gpxyzlabel_after_ppt_output_name_8
$if setglobal gp_ppt_8                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_8%.%gp_extension%'" /;
$if setglobal gp_ppt_8                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_8

$if not setglobal gp_ppt_9                        $goto gpxyzlabel_after_ppt_output_name_9
$if setglobal gp_ppt_9                            put "set output '%gp_name%_",gpxyzsm_plot_count,"_%gp_ppt_9%.%gp_extension%'" /;
$if setglobal gp_ppt_9                            $goto gpxyzlabel_specify_winoptions
$label gpxyzlabel_after_ppt_output_name_9
* Insert Auto Code 2 produced by make_2_pptplots.gms Sub Section 1 - End

put "set output '%gp_name%_",gpxyzsm_plot_count,"_1.%gp_extension%'" /;

$label gpxyzlabel_specify_winoptions

$if not "%gp_multiplot_count%" == "_mp1"           $goto gpxyzlabel_aftermultiplot_write
PUT 'set multiplot ';
$if setglobal gp_multiplotlayout                   PUT 'layout %gp_multiplotlayout% ';
$if setglobal gp_multiplottitle                    PUT 'title "%gp_multiplottitle%" ';
$if setglobal gp_multiplottitlefont                PUT 'font "%gp_multiplottitlefont%" ';
PUT /;
$label gpxyzlabel_aftermultiplot_write



* Insert Auto Code 1 produced by make_1_label_code.gms - Begin
$if not setglobal gp_label_1                       $goto gpxyzlabel_afterlabel_1
$if '%gp_label_1%' == 'no'                         put 'unset label 1' /;
$if '%gp_label_1%' == 'no'                         $goto gpxyzlabel_afterlabel_1
$if setglobal gp_label_1                           put 'set label 1 %gp_label_1%' /;
$goto gpxyzlabel_afterlabel_1

$label gpxyzlabel_afterlabel_1

$if not setglobal gp_label_2                       $goto gpxyzlabel_afterlabel_2
$if '%gp_label_2%' == 'no'                         put 'unset label 2' /;
$if '%gp_label_2%' == 'no'                         $goto gpxyzlabel_afterlabel_2
$if setglobal gp_label_2                           put 'set label 2 %gp_label_2%' /;
$goto gpxyzlabel_afterlabel_2

$label gpxyzlabel_afterlabel_2

$if not setglobal gp_label_3                       $goto gpxyzlabel_afterlabel_3
$if '%gp_label_3%' == 'no'                         put 'unset label 3' /;
$if '%gp_label_3%' == 'no'                         $goto gpxyzlabel_afterlabel_3
$if setglobal gp_label_3                           put 'set label 3 %gp_label_3%' /;
$goto gpxyzlabel_afterlabel_3

$label gpxyzlabel_afterlabel_3

$if not setglobal gp_label_4                       $goto gpxyzlabel_afterlabel_4
$if '%gp_label_4%' == 'no'                         put 'unset label 4' /;
$if '%gp_label_4%' == 'no'                         $goto gpxyzlabel_afterlabel_4
$if setglobal gp_label_4                           put 'set label 4 %gp_label_4%' /;
$goto gpxyzlabel_afterlabel_4

$label gpxyzlabel_afterlabel_4

$if not setglobal gp_label_5                       $goto gpxyzlabel_afterlabel_5
$if '%gp_label_5%' == 'no'                         put 'unset label 5' /;
$if '%gp_label_5%' == 'no'                         $goto gpxyzlabel_afterlabel_5
$if setglobal gp_label_5                           put 'set label 5 %gp_label_5%' /;
$goto gpxyzlabel_afterlabel_5

$label gpxyzlabel_afterlabel_5

$if not setglobal gp_label_6                       $goto gpxyzlabel_afterlabel_6
$if '%gp_label_6%' == 'no'                         put 'unset label 6' /;
$if '%gp_label_6%' == 'no'                         $goto gpxyzlabel_afterlabel_6
$if setglobal gp_label_6                           put 'set label 6 %gp_label_6%' /;
$goto gpxyzlabel_afterlabel_6

$label gpxyzlabel_afterlabel_6

$if not setglobal gp_label_7                       $goto gpxyzlabel_afterlabel_7
$if '%gp_label_7%' == 'no'                         put 'unset label 7' /;
$if '%gp_label_7%' == 'no'                         $goto gpxyzlabel_afterlabel_7
$if setglobal gp_label_7                           put 'set label 7 %gp_label_7%' /;
$goto gpxyzlabel_afterlabel_7

$label gpxyzlabel_afterlabel_7

$if not setglobal gp_label_8                       $goto gpxyzlabel_afterlabel_8
$if '%gp_label_8%' == 'no'                         put 'unset label 8' /;
$if '%gp_label_8%' == 'no'                         $goto gpxyzlabel_afterlabel_8
$if setglobal gp_label_8                           put 'set label 8 %gp_label_8%' /;
$goto gpxyzlabel_afterlabel_8

$label gpxyzlabel_afterlabel_8

$if not setglobal gp_label_9                       $goto gpxyzlabel_afterlabel_9
$if '%gp_label_9%' == 'no'                         put 'unset label 9' /;
$if '%gp_label_9%' == 'no'                         $goto gpxyzlabel_afterlabel_9
$if setglobal gp_label_9                           put 'set label 9 %gp_label_9%' /;
$goto gpxyzlabel_afterlabel_9

$label gpxyzlabel_afterlabel_9
* Insert Auto Code 1 produced by make_label_code.gms - End


* More Styles
$if not setglobal gp_morestyle1                   $goto gpxyzlabel_after_morestyle1_assign
$if "%gp_morestyle1%" == "no"                     $goto gpxyzlabel_after_morestyle1_assign
PUT "set style %gp_morestyle1%" /;
$label gpxyzlabel_after_morestyle1_assign

$if not setglobal gp_morestyle2                   $goto gpxyzlabel_after_morestyle2_assign
$if "%gp_morestyle2%" == "no"                     $goto gpxyzlabel_after_morestyle2_assign
PUT "set style %gp_morestyle2%" /;
$label gpxyzlabel_after_morestyle2_assign

$if not setglobal gp_morestyle3                   $goto gpxyzlabel_after_morestyle3_assign
$if "%gp_morestyle3%" == "no"                     $goto gpxyzlabel_after_morestyle3_assign
PUT "set style %gp_morestyle3%" /;
$label gpxyzlabel_after_morestyle3_assign


* resetting of individual styles
$if "%gp_resetstyle%"=="no"                       $goto gpxyzlabel_l_reset_axes
$if not setglobal gp_resetstyle                   $goto gpxyzlabel_l_reset_axes
$setglobal gp_l1style  no
$setglobal gp_l2style  no
$setglobal gp_l3style  no
$setglobal gp_l4style  no
$setglobal gp_l5style  no
$setglobal gp_l6style  no
$setglobal gp_l7style  no
$setglobal gp_l8style  no
$setglobal gp_l9style  no
$setglobal gp_l10style no
$setglobal gp_l11style no
$setglobal gp_l12style no
$setglobal gp_l13style no
$setglobal gp_l14style no
$setglobal gp_l15style no
$setglobal gp_l16style no

* resetting of individual axes
$label gpxyzlabel_l_reset_axes
$if "%gp_resetaxes%"=="no"                        $goto gpxyzlabel_l_reset_done
$if not setglobal gp_resetstyle                   $goto gpxyzlabel_l_reset_done
$setglobal gp_l1axes   no
$setglobal gp_l2axes   no
$setglobal gp_l3axes   no
$setglobal gp_l4axes   no
$setglobal gp_l5axes   no
$setglobal gp_l6axes   no
$setglobal gp_l7axes   no
$setglobal gp_l8axes   no
$setglobal gp_l9axes   no
$setglobal gp_l10axes  no
$setglobal gp_l11axes  no
$setglobal gp_l12axes  no
$setglobal gp_l13axes  no
$setglobal gp_l14axes  no
$setglobal gp_l15axes  no
$setglobal gp_l16axes  no
$label gpxyzlabel_l_reset_done


gp_input.nd = 3;
gp_input.nw = 12;

* Mouse
$if not setglobal gp_mouse                        put "unset mouse" /;
$if     "%gp_mouse%" == "no"                      put "unset mouse" /;

* Cancel axes if not needed
$if  "%gp_y2axis%" == "no"                        $setglobal gp_y2scale "no"
$if  "%gp_y2axis%" == "no"                        $setglobal gp_y2range "no"
$if  "%gp_y2axis%" == "no"                        $setglobal gp_y2label "no"

$if  "%gp_x2axis%" == "no"                        $setglobal gp_x2scale "no"
$if  "%gp_x2axis%" == "no"                        $setglobal gp_x2range "no"
$if  "%gp_x2axis%" == "no"                        $setglobal gp_x2label "no"

$if not setglobal gp_xrange                       $setglobal gp_xrange "no"
$if  "%gp_xrange%" == "no"                        put 'set auto x'/;
$if  "%gp_xrange%" == "no"                        $goto gpxyzlabel_yrange
put 'set xrange [%gp_xrange%]'/;

$label gpxyzlabel_yrange
$if not setglobal gp_yrange                       $setglobal gp_yrange "no"
$if  "%gp_yrange%" == "no"                        put 'set auto y'/;
$if  "%gp_yrange%" == "no"                        $goto gpxyzlabel_zrange
put 'set yrange [%gp_yrange%]'/;

$label gpxyzlabel_zrange
$if not setglobal gp_zrange                       $setglobal gp_zrange "no"
$if  "%gp_zrange%" == "no"                        put 'set auto z'/;
$if  "%gp_zrange%" == "no"                        $goto gpxyzlabel_trange
put 'set zrange [%gp_zrange%]'/;

$label gpxyzlabel_trange
$if not setglobal gp_trange                       $setglobal gp_trange "no"
$if  "%gp_trange%" == "no"                        put 'set auto t'/;
$if  "%gp_trange%" == "no"                        $goto gpxyzlabel_scale_2axes
put 'set trange [%gp_trange%]'/;


* Calculate scalars to automatically scale the Y2 axis
* The four scalars calculate the maximum and minimum value for vertical and horizontal axis

$label gpxyzlabel_scale_2axes
$if a%1 == afunction                              $goto gpxyzlabel_functionrange
$if dimension 1 %1                                $goto gpxyzlabel_det1Drange
$if dimension 4 %1                                $goto gpxyzlabel_boxwidth
$if "%gp_style%" == "histogram"                   $goto gpxyzlabel_dethistrange
$if "%gp_style%" == "spiderplot"                  $goto gpxyzlabel_dethistrange
$if a%2 == a                                      $goto gpxyzlabel_detnewhistrange

gp_ymin_value  = smin((%gp_scen%,%gp_obsv_1%),%1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%"));
gp_ymax        = smax((%gp_scen%,%gp_obsv_1%),%1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%"));
gp_xmin_value  = smin((%gp_scen%,%gp_obsv_1%),%1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%"));
gp_xmax        = smax((%gp_scen%,%gp_obsv_1%),%1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%"));
gp_x2low       = gp_xmin_value;
gp_x2up        = gp_xmax;
$goto gpxyzlabel_setboundry_gp

$label gpxyzlabel_det1Drange
$if not setglobal gp_add_xvalue_1D   $setglobal gp_add_xvalue_1D 0
gp_ymin_value  = smin((%gp_scen%),%1(%gp_scen%));
gp_ymax        = smax((%gp_scen%),%1(%gp_scen%));
gp_xmin_value  = %gp_add_xvalue_1D% + 1;
gp_xmax        = %gp_add_xvalue_1D% + card(%gp_scen%);
$goto gpxyzlabel_setboundry_gp

$label gpxyzlabel_dethistrange
$if dimension 3 %1                                $goto gpxyzlabel_detnewhistrange
gp_ymin_value  = smin((%gp_scen%,%gp_obsv_1%),%1(%gp_scen%,%gp_obsv_1%));
gp_ymax        = smax((%gp_scen%,%gp_obsv_1%),%1(%gp_scen%,%gp_obsv_1%));

* spider ray max
gp_spider_max(%gp_obsv_1%) = smax(%gp_scen%,%1(%gp_scen%,%gp_obsv_1%));

$if not setglobal  gp_ymin                        $goto gpxyzlabel_setboundry_gp
$if    "%gp_ymin%" == "no"                        $goto gpxyzlabel_setboundry_gp
gp_ymin_value = %gp_ymin%;
$goto gpxyzlabel_setboundry_gp


$label gpxyzlabel_detnewhistrange
gp_ymin_value  = smin((%gp_scen%,%gp_obsv_1%,%gp__col3%),%1(%gp_scen%,%gp_obsv_1%,%gp__col3%));
gp_ymax        = smax((%gp_scen%,%gp_obsv_1%,%gp__col3%),%1(%gp_scen%,%gp_obsv_1%,%gp__col3%));

$if not setglobal  gp_ymin                        $goto gpxyzlabel_setboundry_gp
$if    "%gp_ymin%" == "no"                        $goto gpxyzlabel_setboundry_gp
gp_ymin_value = %gp_ymin%;

$label gpxyzlabel_setboundry_gp
gp_y2low = gp_ymin_value;
gp_y2up  = gp_ymax;

$label gpxyzlabel_functionrange
$if not setglobal gp_x2scale                      $goto gpxyzlabel_x2range
$if     "%gp_x2scale%" == "no"                    $goto gpxyzlabel_x2range

$if not setglobal gp_x2range                      $goto gpxyzlabel_x2auto
$if     "%gp_x2range%" == "no"                    $goto gpxyzlabel_x2auto
$if     setglobal gp_x2range                      $goto gpxyzlabel_x2range
$goto gpxyzlabel_x2auto

$label gpxyzlabel_x2auto
$if not defined gp_xmin_value                     $goto gpxyzlabel_x2range
$if setglobal gp_x2scale                          gp_x2low = %gp_x2scale% * gp_xmin_value;
$if setglobal gp_x2scale                          gp_x2up  = %gp_x2scale% * gp_xmax;
put 'unset auto x'/;
put 'unset auto x2'/;
put 'set xrange  [',gp_xmin_value, ' : ',gp_xmax,']'/;
put 'set x2range [',gp_x2low,' : ',gp_x2up,']'/;
$goto gpxyzlabel_y2scale

$label gpxyzlabel_x2range
$if not setglobal gp_x2range                      $goto gpxyzlabel_y2scale
$if  "%gp_x2range%" == "no"                       $goto gpxyzlabel_y2scale
put 'set x2range [%gp_x2range%]'/;


$label gpxyzlabel_y2scale
$if not setglobal gp_y2scale                      $goto gpxyzlabel_y2range
$if     "%gp_y2scale%" == "no"                    $goto gpxyzlabel_y2range

$if not setglobal gp_y2range                      $goto gpxyzlabel_y2auto
$if     "%gp_y2range%" == "no"                    $goto gpxyzlabel_y2auto
$if     setglobal gp_y2range                      $goto gpxyzlabel_y2range

$label gpxyzlabel_y2auto
$if setglobal gp_y2scale                          gp_y2low = %gp_y2scale% * gp_ymin_value;
$if setglobal gp_y2scale                          gp_y2up  = %gp_y2scale% * gp_ymax;
put 'unset auto y'/;
put 'unset auto y2'/;

$if not setglobal gp_yrange                       $goto gpxyzlabel_new_y2range
$if     "%gp_yrange%" == "no"                     $goto gpxyzlabel_new_y2range
put 'set y2range [%gp_y2scale%*%gp_yrange%*%gp_y2scale%]'/;
$goto gpxyzlabel_y2range

$label gpxyzlabel_new_y2range
put 'set yrange  [',gp_ymin_value, ' : ',gp_ymax,']'/;
put 'set y2range [',gp_y2low,' : ',gp_y2up,']'/;
$goto gpxyzlabel_boxwidth

$label gpxyzlabel_y2range
$if not setglobal gp_y2range                      $goto gpxyzlabel_boxwidth
$if  "%gp_y2range%" == "no"                       $goto gpxyzlabel_boxwidth
put 'set y2range [%gp_y2range%]'/;

$label gpxyzlabel_boxwidth
$if setglobal gp_boxwid                           $setglobal gp_boxwidth %gp_boxwid%
$if not setglobal gp_boxwidth                     $goto gpxyzlabel_figsize
$if  "%gp_boxwidth%" == "no"                      $goto gpxyzlabel_figsize
$if  "%gp_boxwidth%" == "0"                       $goto gpxyzlabel_figsize
put 'set boxwidth %gp_boxwidth%'/;

$label gpxyzlabel_figsize
$if not setglobal gp_size                         $goto gpxyzlabel_gplabel_bmargin
$if  "%gp_size%" == "no"                          $goto gpxyzlabel_gplabel_bmargin
put 'set size %gp_size%'/;

$label gpxyzlabel_gplabel_bmargin
$if not setglobal gp_bmargin                      $goto gpxyzlabel_gplabel_tmargin
$if "%gp_bmargin%" == "no"                        $goto gpxyzlabel_gplabel_tmargin
put "set bmargin %gp_bmargin%" /;

$label gpxyzlabel_gplabel_tmargin
$if not setglobal gp_tmargin                      $goto gpxyzlabel_gplabel_lmargin
$if "%gp_tmargin%" == "no"                        $goto gpxyzlabel_gplabel_lmargin
put "set tmargin %gp_tmargin%" /;

$label gpxyzlabel_gplabel_lmargin
$if not setglobal gp_lmargin                      $goto gpxyzlabel_gplabel_rmargin
$if "%gp_lmargin%" == "no"                        $goto gpxyzlabel_gplabel_rmargin
put "set lmargin %gp_lmargin%" /;

$label gpxyzlabel_gplabel_rmargin
$if not setglobal gp_rmargin                      $goto gpxyzlabel_x2axis
$if "%gp_rmargin%" == "no"                        $goto gpxyzlabel_x2axis
put "set rmargin %gp_rmargin%" /;

$label gpxyzlabel_x2axis
$if setglobal gp_x2scale                          $setglobal gp_x2axis  'yes'
$if  "%gp_x2scale%" == "no"                       $setglobal gp_x2axis  'no'
$if setglobal gp_x2range                          $setglobal gp_x2axis  'yes'
$if  "%gp_x2range%" == "no"                       $setglobal gp_x2axis  'no'
$if not setglobal gp_x2axis                       $goto gpxyzlabel_y2axis
$if  "%gp_x2axis%" == "no"                        $goto gpxyzlabel_y2axis
put 'set x2tics'/;

$label gpxyzlabel_y2axis
$if not setglobal gp_y2scale                      $goto gpxyzlabel_aftery2scale_test
$if  "%gp_y2scale%" == "no"                       $goto gpxyzlabel_aftery2scale_test
$if setglobal gp_y2scale                          $goto gpxyzlabel_beforeputy2tics
$label gpxyzlabel_aftery2scale_test
$if "%gp_x1y2%"=="no"                             $goto gpxyzlabel_afterx1y2_test
$if setglobal gp_x1y2                             $goto gpxyzlabel_beforeputy2tics
$label gpxyzlabel_afterx1y2_test
$if "%gp_x2y2%"=="no"                             $goto gpxyzlabel_afterx2y2_test
$if setglobal gp_x2y2                             $goto gpxyzlabel_beforeputy2tics
$label gpxyzlabel_afterx2y2_test

$if  "%gp_y2range%" == "no"                       $goto gpxyzlabel_logscale
$if not setglobal gp_y2axis                       $goto gpxyzlabel_logscale
$label gpxyzlabel_beforeputy2tics
put 'set y2tics'/;

$label gpxyzlabel_logscale
$if not setglobal gp_logscale                     $goto gpxyzlabel_gridline
$if "%gp_logscale%" == "no"                       put /'unset logscale xy'/
$if "%gp_logscale%" == "no"                       $goto gpxyzlabel_gridline
put /'set logscale %gp_logscale%'/;

$label gpxyzlabel_gridline
*$if not setglobal gp_gline                        $setglobal gp_gline  '4'
*$if "%gp_color%" == "monochrome"                  $setglobal gp_gline  '4'
*$if "%gp_term%"  == "windows"                     $setglobal gp_gline  '13'

$label gpxyzlabel_grid

$if not setglobal gp_zeroaxis_option              $setglobal gp_zeroaxis_option " "
$if "%gp_zeroaxis_option%" == no                  $setglobal gp_zeroaxis_option " "


$if not setglobal gp_zeroax                       $setglobal gp_zeroax no
$if %gp_zeroax%    == no                          put 'unset zeroaxis'/;
$if %gp_zeroax%    == yes                         put 'set zeroaxis %gp_zeroaxis_option%'/;
$if %gp_zeroax%    == yes                         $goto gpxyzlabel_grid2

$if not setglobal gp_xzeroax                      $setglobal gp_xzeroax no
$if %gp_xzeroax%   == no                          put 'unset xzeroaxis'/;
$if %gp_xzeroax%   == yes                         put 'set xzeroaxis %gp_zeroaxis_option%'/;

$if not setglobal gp_yzeroax                      $setglobal gp_yzeroax no
$if %gp_yzeroax%   == no                          put 'unset yzeroaxis'/;
$if %gp_yzeroax%   == no                          $goto gpxyzlabel_grid2
put 'set yzeroaxis  %gp_zeroaxis_option%' /;

$label gpxyzlabel_grid2

$if "%gp_style%" == "spiderplot"                  $goto gpxyzlabel_spiderplot_grid
$if not setglobal gp_grid                         $setglobal gp_grid no
$if "%gp_grid%" == "no"                           put 'unset grid'/;
$if "%gp_grid%" == "no"                           $goto gpxyzlabel_xgrid
$if "%gp_grid%" == "yes"                          put 'set grid' /;
$if "%gp_grid%" == "yes"                          $goto gpxyzlabel_xgrid
put 'set grid %gp_grid%' /;
$goto gpxyzlabel_xgrid

$label gpxyzlabel_spiderplot_grid
$if not setglobal gp_grid                         $setglobal gp_grid spider lt black lc "grey" lw 0.5 back
put 'set grid %gp_grid%' /;
$goto gpxyzlabel_formats

$label gpxyzlabel_xgrid
$if not setglobal gp_xgrid                        $goto gpxyzlabel_ygrid
$if "%gp_xgrid%" == "no"                          $goto gpxyzlabel_ygrid
put 'set grid xtics' /;
*put 'set grid xtics %gp_gline%' /;

$label gpxyzlabel_ygrid
$if not setglobal gp_ygrid                        $goto gpxyzlabel_formats
$if "%gp_ygrid%" == "no"                          $goto gpxyzlabel_formats
put 'set grid ytics' /;
*put 'set grid ytics %gp_gline%' /;

$label gpxyzlabel_formats
$if not setglobal gp_xform                        $goto gpxyzlabel_tickers
$if "%gp_xform%" == "no"                          $goto gpxyzlabel_tickers
put 'set format x %gp_xform%'/;

$label gpxyzlabel_tickers
$if not setglobal gp_tics                         $setglobal gp_tics 'in'
$if "%gp_tics%" == "no"                           put 'unset tics'/;
$if "%gp_tics%" == "no"                           $goto gpxyzlabel_gplb_xtics
put 'set tics %gp_tics%'/;
$goto gpxyzlabel_gplb_xtics

$label gpxyzlabel_gplb_xtics
$if not setglobal gp_xtics                        $setglobal gp_xtics "in"
$if "%gp_xtics%" == "no"                          put 'unset xtics'/;
$if "%gp_xtics%" == "no"                          $goto gpxyzlabel_ytics
put 'set xtics %gp_xtics%';

*** Uwe if gp_xtics no then scale 0 is not applied!!
$if not a%2==a                                    $goto gpxyzlabel_label_xticincrement
put " scale 0";
$goto gpxyzlabel_ytics

$label gpxyzlabel_label_xticincrement
$if not setglobal gp_xinc                         $goto gpxyzlabel_ytics
$if    '%gp_xinc%'   == 'no'                      $goto gpxyzlabel_ytics
put ' %gp_xinc%';

$label gpxyzlabel_ytics
put /;
$if not setglobal gp_ytics                        $setglobal gp_ytics "in"
$if "%gp_ytics%" == "no"                          put 'unset ytics'/;
$if "%gp_ytics%" == "no"                          $goto gpxyzlabel_ztics
put 'set ytics nomirror %gp_ytics%';

$if not setglobal gp_yinc                         put /;
$if    "%gp_yinc%"   == "no"                      put /;
$if not setglobal gp_yinc                         $goto gpxyzlabel_ztics
$if    "%gp_yinc%"   == "no"                      $goto gpxyzlabel_ztics
put ' %gp_yinc%'/;


$label gpxyzlabel_ztics
put /;
$if not setglobal gp_ztics                        $setglobal gp_ztics "in"
$if "%gp_ztics%" == "no"                          put 'unset ztics'/;
$if "%gp_ztics%" == "no"                          $goto gpxyzlabel_styles
put 'set ztics nomirror %gp_ztics%' /;



*       Write options for color labels, title, style, border, lines, and key
$label gpxyzlabel_styles


$if "%gp_color%" ==  "color"                      $goto gpxyzlabel_after_monochrome
put 'set monochrome' /;
$label gpxyzlabel_after_monochrome




$if not setglobal gp_label                        $goto gpxyzlabel_aftermanuallabels
$if "%gp_label%"  == "no"                         put 'unset label'/;
$if "%gp_label%"  == "no"                         $goto gpxyzlabel_aftermanuallabels
put 'set label'/;
$label gpxyzlabel_aftermanuallabels

* X-labels
$if not setglobal gp_xl_l1                        $goto gpxyzlabel_xlabel_noloop
$if "%gp_xl_l1%"  == "no"                         $goto gpxyzlabel_xlabel_noloop
put 'set xlabel  "';
$if     setglobal gp_xl_l1                        put     %gp_xl_l1%.tl;
$if     setglobal gp_xl_l2                        put ' ',%gp_xl_l2%.tl;
$if     setglobal gp_xl_l3                        put ' ',%gp_xl_l3%.tl;
$if     setglobal gp_xl_l4                        put ' ',%gp_xl_l4%.tl;
PUT '"' /;
$goto gpxyzlabel_ylabel_loop

$label gpxyzlabel_xlabel_noloop
$if not setglobal gp_xxxvalue                     put 'unset xlabel'/;
$if not setglobal gp_xxxvalue                     $goto gpxyzlabel_ylabel_loop
$if "%gp_xxxvalue%"  == "no"                      put 'unset xlabel'/;
$if "%gp_xxxvalue%"  == "no"                      $goto gpxyzlabel_ylabel_loop
$if "%gp_xlabel%"  == "no"                        put 'unset xlabel'/;
$if "%gp_xlabel%"  == "no"                        $goto gpxyzlabel_ylabel_loop

$if setglobal gp_xxxvalue                         put 'set xlabel  "%gp_xxxvalue%"'/;
$if setglobal gp_xlabel                           put 'set xlabel  "%gp_xlabel%"';
$if not setglobal gp_xlabeloffset                 $goto gpxyzlabel_after_xlabeloffset
$if "%gp_xlabeloffset%" == "no"                   $goto gpxyzlabel_after_xlabeloffset
$if setglobal gp_xlabeloffset                     put ' offset %gp_xlabeloffset%';
$label gpxyzlabel_after_xlabeloffset
$if setglobal gp_xlabel                           put /;

* Y-labels
$label gpxyzlabel_ylabel_loop
$if not setglobal gp_yl_l1                        $goto gpxyzlabel_ylabel_noloop
$if "%gp_yl_l1%"  == "no"                         $goto gpxyzlabel_ylabel_noloop
put 'set ylabel  "';
$if     setglobal gp_yl_l1                        put     %gp_yl_l1%.tl;
$if     setglobal gp_yl_l2                        put ' ',%gp_yl_l2%.tl;
$if     setglobal gp_yl_l3                        put ' ',%gp_yl_l3%.tl;
$if     setglobal gp_yl_l4                        put ' ',%gp_yl_l4%.tl;
PUT '"' /;
$goto gpxyzlabel_zlabel_loop

$label gpxyzlabel_ylabel_noloop
$if not setglobal gp_yyyvalue                     put 'unset ylabel'/;
$if "%gp_yyyvalue%"  == "no"                      put 'unset ylabel'/;
$if "%gp_ylabel%"  == "no"                        put 'unset ylabel'/;

$if "%gp_ylabel%"  == "no"                        $goto gpxyzlabel_y2label_check
$if setglobal gp_yyyvalue                         put 'set ylabel  "%gp_yyyvalue%"'/;
$if setglobal gp_ylabel                           put 'set ylabel  "%gp_ylabel%"'/;

$label gpxyzlabel_y2label_check
$if not setglobal gp_y2label                      put 'unset y2label'/;
$if "%gp_y2label%"  == "no"                       put 'unset y2label'/;
$if not setglobal gp_y2label                      $goto gpxyzlabel_zlabel_loop
$if "%gp_y2label%"  == "no"                       $goto gpxyzlabel_zlabel_loop
put 'set y2label  "%gp_y2label%"'/;


* Z-labels
$label gpxyzlabel_zlabel_loop
$if not setglobal gp_zl_l1                        $goto gpxyzlabel_zlabel_noloop
$if "%gp_zl_l1%"  == "no"                         $goto gpxyzlabel_zlabel_noloop
put 'set zlabel  "';
$if     setglobal gp_zl_l1                        put     %gp_zl_l1%.tl;
$if     setglobal gp_zl_l2                        put ' ',%gp_zl_l2%.tl;
$if     setglobal gp_zl_l3                        put ' ',%gp_zl_l3%.tl;
$if     setglobal gp_zl_l4                        put ' ',%gp_zl_l4%.tl;
PUT '"' /;
$goto gpxyzlabel_plottitle

$label gpxyzlabel_zlabel_noloop
$if a%1==afunction                                $goto gpxyzlabel_check_x2_label
$if not dimension 4 %1                            $goto gpxyzlabel_check_x2_label
$if not setglobal gp_zlabel                       put 'set zlabel  "%gp_zzzvalue%" rotate by 90'/;
$if "%gp_zlabel%"  == "no"                        put 'unset zlabel'/;
$if not setglobal gp_zlabel                       $goto gpxyzlabel_check_x2_label
$if "%gp_zlabel%"  == "no"                        $goto gpxyzlabel_check_x2_label
put 'set zlabel  "%gp_zlabel%"';
$if not setglobal gp_zlabelrotate                 $goto  gpxyzlabel_afterzlabelrotate
$if "%gp_zlabelrotate%"  == "no"                  $goto  gpxyzlabel_afterzlabelrotate
put ' rotate by %gp_zlabelrotate%';
$label gpxyzlabel_afterzlabelrotate
put /;

* X2-labels
$label gpxyzlabel_check_x2_label
$if not setglobal gp_x2label                      $goto gpxyzlabel_y2label
$if "%gp_x2label%" == "no"                        $goto gpxyzlabel_y2label
put 'set x2label "%gp_x2label%"'/;


* Y2-labels
$label gpxyzlabel_y2label
$if not setglobal gp_y2label                      $goto gpxyzlabel_plottitle
$if "%gp_y2label%" == "no"                        $goto gpxyzlabel_plottitle
put 'set y2label "%gp_y2label%"'/;


* Title

$label gpxyzlabel_plottitle
$if "%gp_keeptitleinppt%"   == "no"               $goto gpxyzlabel_skiptitle
$if setglobal gp_keeptitleinppt                   $goto gpxyzlabel_after_unsetppttitle
$if "%gp_ppt%" == "no"                            $goto gpxyzlabel_after_unsetppttitle
$if setglobal gp_ppt                              put 'unset title'/;
$if setglobal gp_ppt                              $goto gpxyzlabel_skiptitle
$label gpxyzlabel_after_unsetppttitle
$if "%gp_loop1%"   == "no"                        $goto gpxyzlabel_nolooptitle
$if     setglobal gp_loop1                        $goto gpxyzlabel_title_loop1

$label gpxyzlabel_nolooptitle
$if not setglobal gp_title                        $goto gpxyzlabel_skiptitle
$if "%gp_title%"   == "no"                        $goto gpxyzlabel_skiptitle
put 'set title  "%gp_title%"'/;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop1
$if not setglobal gp_title                        $setglobal gp_title " "
put 'set title  "%gp_title% ',%gp_loop1%.te(%gp_loop1%);
$if     setglobal gp_loop2                        $goto gpxyzlabel_title_loop2
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop2
$if "%gp_loop2%"   == "no"                        put '"' /;
$if "%gp_loop2%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop2%.te(%gp_loop2%);
$if     setglobal gp_loop3                        $goto gpxyzlabel_title_loop3
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop3
$if "%gp_loop3%"   == "no"                        put '"' /;
$if "%gp_loop3%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop3%.te(%gp_loop3%);
$if     setglobal gp_loop4                        $goto gpxyzlabel_title_loop4
put '"' /;
$goto gpxyzlabel_skiptitle

*new
$label gpxyzlabel_title_loop4
$if "%gp_loop4%"   == "no"                        put '"' /;
$if "%gp_loop4%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop4%.te(%gp_loop4%);
$if     setglobal gp_loop5                        $goto gpxyzlabel_title_loop5
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop5
$if "%gp_loop5%"   == "no"                        put '"' /;
$if "%gp_loop5%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop5%.te(%gp_loop5%);
$if     setglobal gp_loop6                        $goto gpxyzlabel_title_loop6
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop6
$if "%gp_loop6%"   == "no"                        put '"' /;
$if "%gp_loop6%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop6%.te(%gp_loop6%);
$if     setglobal gp_loop7                        $goto gpxyzlabel_title_loop7
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop7
$if "%gp_loop7%"   == "no"                        put '"' /;
$if "%gp_loop7%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop7%.te(%gp_loop7%);
$if     setglobal gp_loop8                        $goto gpxyzlabel_title_loop8
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop8
$if "%gp_loop8%"   == "no"                        put '"' /;
$if "%gp_loop8%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop8%.te(%gp_loop8%);
$if     setglobal gp_loop9                        $goto gpxyzlabel_title_loop9
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_title_loop9
$if "%gp_loop9%"   == "no"                        put '"' /;
$if "%gp_loop9%"   == "no"                        $goto gpxyzlabel_skiptitle
put ' ',%gp_loop9%.te(%gp_loop9%);
put '"' /;
$goto gpxyzlabel_skiptitle

$label gpxyzlabel_skiptitle
$if not setglobal gp_style                        $setglobal gp_style linespoints
$if "%gp_style%"   == "no"                        $setglobal gp_style linespoints
$if a%1==afunction                                $goto gpxyzlabel_gp_label_nohistogram
$if dimension 1 %1                                $goto gpxyzlabel_gp_label_nohistogram
$if not a%2==a                                    $goto gpxyzlabel_gp_label_nohistogram
$if not setglobal gp_style                        $setglobal gp_style histogram
$if     "%gp_style%"=="spiderplot"                $goto gpxyzlabel_gp_label_nohistogram
$if not "%gp_style%"=="histogram"                 $setglobal gp_style histogram
$label gpxyzlabel_gp_label_nohistogram
put 'set style data %gp_style%'/;

$if not setglobal gp_fill                         $setglobal gp_fill 'solid 1'
$if "%gp_fill%"   == "no"                         $setglobal gp_fill 'empty'
put 'set style fill %gp_fill%'/;

$if not "%gp_style%"=="histogram"                 $goto gpxyzlabel_rectangle_options
$if not setglobal gp_hist                         $setglobal gp_hist 'cluster'
$if "%gp_hist%"   == "no"                         $setglobal gp_hist 'cluster'
put 'set style histogram %gp_hist%'/;

$label gpxyzlabel_rectangle_options
$if not setglobal gp_rectangle                    $goto gpxyzlabel_borderoptions
$if "%gp_rectangle%"   == "no"                    $goto gpxyzlabel_borderoptions
put 'set style rectangle %gp_rectangle%'/;

* Border
$label gpxyzlabel_borderoptions
gp_input.nd = 0;
gp_input.nw = 0;
$if not setglobal gp_border                       $setglobal gp_border yes
$if not setglobal gp_borddim                      $setglobal gp_borddim ''
$if "%gp_borddim%" == "all"                       $setglobal gp_borddim ''
$if "%gp_borddim%" == "four"                      $setglobal gp_borddim ''
$if "%gp_borddim%" == "two"                       $setglobal gp_borddim '3'
$if "%gp_borddim%" == "x"                         $setglobal gp_borddim '1'
$if "%gp_borddim%" == "y"                         $setglobal gp_borddim '2'
$if "%gp_borddim%" == "zero"                      $setglobal gp_border no
$if "%gp_borddim%" == "no"                        $setglobal gp_border no
$if %gp_border%    == "yes"                       put 'set border',' %gp_borddim%'/;
$if %gp_border%    == "no"                        put 'unset border'/;
$if %gp_border%    == "0"                         put 'unset border'/;

* Key
$if     "%gp_key%" == "yes"                       $setglobal gp_key 'top left'
$if not setglobal gp_key                          put 'set key top left'/;
$if     "%gp_key%" == "no"                        put 'unset key'/;
$if not setglobal gp_key                          $goto gpxyzlabel_pointsz
$if     "%gp_key%" == "no"                        $goto gpxyzlabel_pointsz
put 'set key %gp_key% ';

$if not setglobal gp_keyoption                    $goto gpxyzlabel_keytitle
$if "%gp_keyoption%" == "no"                      $goto gpxyzlabel_keytitle
put '%gp_keyoption% ';

$label gpxyzlabel_keytitle
$if not setglobal gp_keytitle                     $goto gpxyzlabel_key_box
$if "%gp_keytitle%" == "no"                       $goto gpxyzlabel_key_box
put 'title "%gp_keytitle%" '

$label gpxyzlabel_key_box
$if not setglobal gp_keybox                       put /;
$if "%gp_keybox%" == "no"                         put /;
$if not setglobal gp_keybox                       $goto gpxyzlabel_pointsz
$if "%gp_keybox%" == "no"                         $goto gpxyzlabel_pointsz
put 'box' /;

* Point size
$label gpxyzlabel_pointsz
$if setglobal gp_pointsz                          $setglobal gp_pointsize "%gp_pointsz%"
$if not setglobal gp_pointsize                    $goto gpxyzlabel_after_pointsz
$if "%gp_pointsize%" == "no"                      $goto gpxyzlabel_after_pointsz
put 'set pointsize %gp_pointsize%' /;
$label gpxyzlabel_after_pointsz

* User defined options
$if not setglobal gp_option_1                     $goto gpxyzlabel_after_user_option_1
$if "%gp_option_1%" == "no"                       $goto gpxyzlabel_after_user_option_1
$if "%gp_option_1%" == ""                         $goto gpxyzlabel_after_user_option_1
put "%gp_option_1%" /;
$label gpxyzlabel_after_user_option_1

$if not setglobal gp_option_2                     $goto gpxyzlabel_after_user_option_2
$if "%gp_option_2%" == "no"                       $goto gpxyzlabel_after_user_option_2
$if "%gp_option_2%" == ""                         $goto gpxyzlabel_after_user_option_2
put "%gp_option_2%" /;
$label gpxyzlabel_after_user_option_2

$if not setglobal gp_option_3                     $goto gpxyzlabel_after_user_option_3
$if "%gp_option_3%" == "no"                       $goto gpxyzlabel_after_user_option_3
$if "%gp_option_3%" == ""                         $goto gpxyzlabel_after_user_option_3
put "%gp_option_3%" /;
$label gpxyzlabel_after_user_option_3

$if not setglobal gp_option_4                     $goto gpxyzlabel_after_user_option_4
$if "%gp_option_4%" == "no"                       $goto gpxyzlabel_after_user_option_4
$if "%gp_option_4%" == ""                         $goto gpxyzlabel_after_user_option_4
put "%gp_option_4%" /;
$label gpxyzlabel_after_user_option_4

$if not setglobal gp_option_5                     $goto gpxyzlabel_after_user_option_5
$if "%gp_option_5%" == "no"                       $goto gpxyzlabel_after_user_option_5
$if "%gp_option_5%" == ""                         $goto gpxyzlabel_after_user_option_5
put "%gp_option_5%" /;
$label gpxyzlabel_after_user_option_5

$if not setglobal gp_option_6                     $goto gpxyzlabel_after_user_option_6
$if "%gp_option_6%" == "no"                       $goto gpxyzlabel_after_user_option_6
$if "%gp_option_6%" == ""                         $goto gpxyzlabel_after_user_option_6
put "%gp_option_6%" /;
$label gpxyzlabel_after_user_option_6


$if not setglobal gp_ppt                          $goto gpxyzlabel_afterpptlinestyle
$if "%gp_ppt%" == "no"                            $goto gpxyzlabel_afterpptlinestyle

$if not setglobal gp_l1style                      $goto gpxyzlabel_afterpptlinestyle_1
$if "%gp_l1style%"=="no"                          $goto gpxyzlabel_afterpptlinestyle_1

put 'set style line 1 %gp_l1style%' /;

$label gpxyzlabel_afterpptlinestyle_1

$label gpxyzlabel_afterpptlinestyle

* Use up to 16 different styles
$if not setglobal gp_l1style                      $setglobal gp_l1style %gp_style%
$if "%gp_l1style%"=="no"                          $setglobal gp_l1style %gp_style%
$if not setglobal gp_l2style                      $setglobal gp_l2style %gp_style%
$if "%gp_l2style%"=="no"                          $setglobal gp_l2style %gp_style%
$if not setglobal gp_l3style                      $setglobal gp_l3style %gp_style%
$if "%gp_l3style%"=="no"                          $setglobal gp_l3style %gp_style%
$if not setglobal gp_l4style                      $setglobal gp_l4style %gp_style%
$if "%gp_l4style%"=="no"                          $setglobal gp_l4style %gp_style%
$if not setglobal gp_l5style                      $setglobal gp_l5style %gp_style%
$if "%gp_l5style%"=="no"                          $setglobal gp_l5style %gp_style%
$if not setglobal gp_l6style                      $setglobal gp_l6style %gp_style%
$if "%gp_l6style%"=="no"                          $setglobal gp_l6style %gp_style%
$if not setglobal gp_l7style                      $setglobal gp_l7style %gp_style%
$if "%gp_l7style%"=="no"                          $setglobal gp_l7style %gp_style%
$if not setglobal gp_l8style                      $setglobal gp_l8style %gp_style%
$if "%gp_l8style%"=="no"                          $setglobal gp_l8style %gp_style%
$if not setglobal gp_l9style                      $setglobal gp_l9style %gp_style%
$if "%gp_l9style%"=="no"                          $setglobal gp_l9style %gp_style%
$if not setglobal gp_l10style                     $setglobal gp_l10style %gp_style%
$if "%gp_l10style%"=="no"                         $setglobal gp_l10style %gp_style%
$if not setglobal gp_l11style                     $setglobal gp_l11style %gp_style%
$if "%gp_l11style%"=="no"                         $setglobal gp_l11style %gp_style%
$if not setglobal gp_l12style                     $setglobal gp_l12style %gp_style%
$if "%gp_l12style%"=="no"                         $setglobal gp_l12style %gp_style%
$if not setglobal gp_l13style                     $setglobal gp_l13style %gp_style%
$if "%gp_l13style%"=="no"                         $setglobal gp_l13style %gp_style%
$if not setglobal gp_l14style                     $setglobal gp_l14style %gp_style%
$if "%gp_l14style%"=="no"                         $setglobal gp_l14style %gp_style%
$if not setglobal gp_l15style                     $setglobal gp_l15style %gp_style%
$if "%gp_l15style%"=="no"                         $setglobal gp_l15style %gp_style%
$if not setglobal gp_l16style                     $setglobal gp_l16style %gp_style%
$if "%gp_l16style%"=="no"                         $setglobal gp_l16style %gp_style%

gp_input.nd = 0;
gp_input.nw = 6;

* Insert Auto Code 3 produced by make_4_linestyle.gms - begin
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_fixcolorassignment_2d
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_fixcolorassignment_2d

gp_fixlinecolormap(gp_hex_color_name,%gp_fixcolor_set%) = no;
gp_count=0;
LOOP(%gp_fixcolor_set%, gp_count=gp_count+1;
$if not setglobal gp_lc_1                          $goto gpxyzlabel_after_fixed_lc_1_assign
$if "%gp_lc_1%"=="no"                              $goto gpxyzlabel_after_fixed_lc_1_assign
gp_fixlinecolormap("%gp_lc_1%",%gp_fixcolor_set%) $(gp_count eq 1) = yes;
$label gpxyzlabel_after_fixed_lc_1_assign
$if not setglobal gp_lc_2                          $goto gpxyzlabel_after_fixed_lc_2_assign
$if "%gp_lc_2%"=="no"                              $goto gpxyzlabel_after_fixed_lc_2_assign
gp_fixlinecolormap("%gp_lc_2%",%gp_fixcolor_set%) $(gp_count eq 2) = yes;
$label gpxyzlabel_after_fixed_lc_2_assign
$if not setglobal gp_lc_3                          $goto gpxyzlabel_after_fixed_lc_3_assign
$if "%gp_lc_3%"=="no"                              $goto gpxyzlabel_after_fixed_lc_3_assign
gp_fixlinecolormap("%gp_lc_3%",%gp_fixcolor_set%) $(gp_count eq 3) = yes;
$label gpxyzlabel_after_fixed_lc_3_assign
$if not setglobal gp_lc_4                          $goto gpxyzlabel_after_fixed_lc_4_assign
$if "%gp_lc_4%"=="no"                              $goto gpxyzlabel_after_fixed_lc_4_assign
gp_fixlinecolormap("%gp_lc_4%",%gp_fixcolor_set%) $(gp_count eq 4) = yes;
$label gpxyzlabel_after_fixed_lc_4_assign
$if not setglobal gp_lc_5                          $goto gpxyzlabel_after_fixed_lc_5_assign
$if "%gp_lc_5%"=="no"                              $goto gpxyzlabel_after_fixed_lc_5_assign
gp_fixlinecolormap("%gp_lc_5%",%gp_fixcolor_set%) $(gp_count eq 5) = yes;
$label gpxyzlabel_after_fixed_lc_5_assign
$if not setglobal gp_lc_6                          $goto gpxyzlabel_after_fixed_lc_6_assign
$if "%gp_lc_6%"=="no"                              $goto gpxyzlabel_after_fixed_lc_6_assign
gp_fixlinecolormap("%gp_lc_6%",%gp_fixcolor_set%) $(gp_count eq 6) = yes;
$label gpxyzlabel_after_fixed_lc_6_assign
$if not setglobal gp_lc_7                          $goto gpxyzlabel_after_fixed_lc_7_assign
$if "%gp_lc_7%"=="no"                              $goto gpxyzlabel_after_fixed_lc_7_assign
gp_fixlinecolormap("%gp_lc_7%",%gp_fixcolor_set%) $(gp_count eq 7) = yes;
$label gpxyzlabel_after_fixed_lc_7_assign
$if not setglobal gp_lc_8                          $goto gpxyzlabel_after_fixed_lc_8_assign
$if "%gp_lc_8%"=="no"                              $goto gpxyzlabel_after_fixed_lc_8_assign
gp_fixlinecolormap("%gp_lc_8%",%gp_fixcolor_set%) $(gp_count eq 8) = yes;
$label gpxyzlabel_after_fixed_lc_8_assign
$if not setglobal gp_lc_9                          $goto gpxyzlabel_after_fixed_lc_9_assign
$if "%gp_lc_9%"=="no"                              $goto gpxyzlabel_after_fixed_lc_9_assign
gp_fixlinecolormap("%gp_lc_9%",%gp_fixcolor_set%) $(gp_count eq 9) = yes;
$label gpxyzlabel_after_fixed_lc_9_assign
$if not setglobal gp_lc_10                         $goto gpxyzlabel_after_fixed_lc_10_assign
$if "%gp_lc_10%"=="no"                             $goto gpxyzlabel_after_fixed_lc_10_assign
gp_fixlinecolormap("%gp_lc_10%",%gp_fixcolor_set%) $(gp_count eq 10) = yes;
$label gpxyzlabel_after_fixed_lc_10_assign
$if not setglobal gp_lc_11                         $goto gpxyzlabel_after_fixed_lc_11_assign
$if "%gp_lc_11%"=="no"                             $goto gpxyzlabel_after_fixed_lc_11_assign
gp_fixlinecolormap("%gp_lc_11%",%gp_fixcolor_set%) $(gp_count eq 11) = yes;
$label gpxyzlabel_after_fixed_lc_11_assign
$if not setglobal gp_lc_12                         $goto gpxyzlabel_after_fixed_lc_12_assign
$if "%gp_lc_12%"=="no"                             $goto gpxyzlabel_after_fixed_lc_12_assign
gp_fixlinecolormap("%gp_lc_12%",%gp_fixcolor_set%) $(gp_count eq 12) = yes;
$label gpxyzlabel_after_fixed_lc_12_assign
$if not setglobal gp_lc_13                         $goto gpxyzlabel_after_fixed_lc_13_assign
$if "%gp_lc_13%"=="no"                             $goto gpxyzlabel_after_fixed_lc_13_assign
gp_fixlinecolormap("%gp_lc_13%",%gp_fixcolor_set%) $(gp_count eq 13) = yes;
$label gpxyzlabel_after_fixed_lc_13_assign
$if not setglobal gp_lc_14                         $goto gpxyzlabel_after_fixed_lc_14_assign
$if "%gp_lc_14%"=="no"                             $goto gpxyzlabel_after_fixed_lc_14_assign
gp_fixlinecolormap("%gp_lc_14%",%gp_fixcolor_set%) $(gp_count eq 14) = yes;
$label gpxyzlabel_after_fixed_lc_14_assign
$if not setglobal gp_lc_15                         $goto gpxyzlabel_after_fixed_lc_15_assign
$if "%gp_lc_15%"=="no"                             $goto gpxyzlabel_after_fixed_lc_15_assign
gp_fixlinecolormap("%gp_lc_15%",%gp_fixcolor_set%) $(gp_count eq 15) = yes;
$label gpxyzlabel_after_fixed_lc_15_assign
$if not setglobal gp_lc_16                         $goto gpxyzlabel_after_fixed_lc_16_assign
$if "%gp_lc_16%"=="no"                             $goto gpxyzlabel_after_fixed_lc_16_assign
gp_fixlinecolormap("%gp_lc_16%",%gp_fixcolor_set%) $(gp_count eq 16) = yes;
$label gpxyzlabel_after_fixed_lc_16_assign
$if not setglobal gp_lc_17                         $goto gpxyzlabel_after_fixed_lc_17_assign
$if "%gp_lc_17%"=="no"                             $goto gpxyzlabel_after_fixed_lc_17_assign
gp_fixlinecolormap("%gp_lc_17%",%gp_fixcolor_set%) $(gp_count eq 17) = yes;
$label gpxyzlabel_after_fixed_lc_17_assign
$if not setglobal gp_lc_18                         $goto gpxyzlabel_after_fixed_lc_18_assign
$if "%gp_lc_18%"=="no"                             $goto gpxyzlabel_after_fixed_lc_18_assign
gp_fixlinecolormap("%gp_lc_18%",%gp_fixcolor_set%) $(gp_count eq 18) = yes;
$label gpxyzlabel_after_fixed_lc_18_assign
$if not setglobal gp_lc_19                         $goto gpxyzlabel_after_fixed_lc_19_assign
$if "%gp_lc_19%"=="no"                             $goto gpxyzlabel_after_fixed_lc_19_assign
gp_fixlinecolormap("%gp_lc_19%",%gp_fixcolor_set%) $(gp_count eq 19) = yes;
$label gpxyzlabel_after_fixed_lc_19_assign
$if not setglobal gp_lc_20                         $goto gpxyzlabel_after_fixed_lc_20_assign
$if "%gp_lc_20%"=="no"                             $goto gpxyzlabel_after_fixed_lc_20_assign
gp_fixlinecolormap("%gp_lc_20%",%gp_fixcolor_set%) $(gp_count eq 20) = yes;
$label gpxyzlabel_after_fixed_lc_20_assign
);
$label gpxyzlabel_after_fixcolorassignment_2d
* Insert Auto Code 3 produced by make_4_linestyle.gms - end



* +++++++++++++++++++++++ *
* Section Plot Statements *
* +++++++++++++++++++++++ *

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


* Test whether there is any function plot?
$if     setglobal gp_functionplot_1    $setglobal gp_functionplot_any yes
$if not setglobal gp_functionplot_1    $setglobal gp_functionplot_any no
$if "%gp_functionplot_1%"=="no"        $setglobal gp_functionplot_any no

$if     setglobal gp_functionplot_2    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_3    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_4    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_5    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_6    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_7    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_8    $setglobal gp_functionplot_any yes
$if     setglobal gp_functionplot_9    $setglobal gp_functionplot_any yes

$if "%gp_parametric%"=="yes"           Put "set parametric" /;
$if "%gp_parametric%"=="no"            Put "unset parametric" /;

$if not setglobal gp_samples           $goto gpxyzlabel_aftersampleswriting
$if "%gp_samples%"=="no"               $goto gpxyzlabel_aftersampleswriting
put "set samples %gp_samples%" /;
$label gpxyzlabel_aftersampleswriting

* uwe
$if not setglobal gp_fixcolor_set     $goto gpxyzlabel_after_fixcolorassignment
$if "%gp_fixcolor_set%" == "no"       $goto gpxyzlabel_after_fixcolorassignment
gp_count = 0;
LOOP(%gp_fixcolor_set%,
 gp_count = gp_count + 1;
 LOOP(%gp_scen% $SAMEAS(%gp_fixcolor_set%,%gp_scen%),

IF(gp_count eq 1, gp_xyz_fixed_col("%gp_lc_1%",%gp_scen%) = yes;);
IF(gp_count eq 2, gp_xyz_fixed_col("%gp_lc_2%",%gp_scen%) = yes;);
IF(gp_count eq 3, gp_xyz_fixed_col("%gp_lc_3%",%gp_scen%) = yes;);
IF(gp_count eq 4, gp_xyz_fixed_col("%gp_lc_4%",%gp_scen%) = yes;);
IF(gp_count eq 5, gp_xyz_fixed_col("%gp_lc_5%",%gp_scen%) = yes;);
IF(gp_count eq 6, gp_xyz_fixed_col("%gp_lc_6%",%gp_scen%) = yes;);
IF(gp_count eq 7, gp_xyz_fixed_col("%gp_lc_7%",%gp_scen%) = yes;);
IF(gp_count eq 8, gp_xyz_fixed_col("%gp_lc_8%",%gp_scen%) = yes;);
IF(gp_count eq 9, gp_xyz_fixed_col("%gp_lc_9%",%gp_scen%) = yes;);
IF(gp_count eq 10, gp_xyz_fixed_col("%gp_lc_10%",%gp_scen%) = yes;);
IF(gp_count eq 11, gp_xyz_fixed_col("%gp_lc_11%",%gp_scen%) = yes;);
IF(gp_count eq 12, gp_xyz_fixed_col("%gp_lc_12%",%gp_scen%) = yes;);
IF(gp_count eq 13, gp_xyz_fixed_col("%gp_lc_13%",%gp_scen%) = yes;);
IF(gp_count eq 14, gp_xyz_fixed_col("%gp_lc_14%",%gp_scen%) = yes;);
IF(gp_count eq 15, gp_xyz_fixed_col("%gp_lc_15%",%gp_scen%) = yes;);
IF(gp_count eq 16, gp_xyz_fixed_col("%gp_lc_16%",%gp_scen%) = yes;);
IF(gp_count eq 17, gp_xyz_fixed_col("%gp_lc_17%",%gp_scen%) = yes;);
IF(gp_count eq 18, gp_xyz_fixed_col("%gp_lc_18%",%gp_scen%) = yes;);
IF(gp_count eq 19, gp_xyz_fixed_col("%gp_lc_19%",%gp_scen%) = yes;);
IF(gp_count eq 20, gp_xyz_fixed_col("%gp_lc_20%",%gp_scen%) = yes;);
IF(gp_count eq 21, gp_xyz_fixed_col("%gp_lc_21%",%gp_scen%) = yes;);
IF(gp_count eq 22, gp_xyz_fixed_col("%gp_lc_22%",%gp_scen%) = yes;);
IF(gp_count eq 23, gp_xyz_fixed_col("%gp_lc_23%",%gp_scen%) = yes;);
IF(gp_count eq 24, gp_xyz_fixed_col("%gp_lc_24%",%gp_scen%) = yes;);
IF(gp_count eq 25, gp_xyz_fixed_col("%gp_lc_25%",%gp_scen%) = yes;);
IF(gp_count eq 26, gp_xyz_fixed_col("%gp_lc_26%",%gp_scen%) = yes;);
IF(gp_count eq 27, gp_xyz_fixed_col("%gp_lc_27%",%gp_scen%) = yes;);
IF(gp_count eq 28, gp_xyz_fixed_col("%gp_lc_28%",%gp_scen%) = yes;);
IF(gp_count eq 29, gp_xyz_fixed_col("%gp_lc_29%",%gp_scen%) = yes;);
IF(gp_count eq 30, gp_xyz_fixed_col("%gp_lc_30%",%gp_scen%) = yes;);
IF(gp_count eq 31, gp_xyz_fixed_col("%gp_lc_31%",%gp_scen%) = yes;);
IF(gp_count eq 32, gp_xyz_fixed_col("%gp_lc_32%",%gp_scen%) = yes;);
IF(gp_count eq 33, gp_xyz_fixed_col("%gp_lc_33%",%gp_scen%) = yes;);
IF(gp_count eq 34, gp_xyz_fixed_col("%gp_lc_34%",%gp_scen%) = yes;);
IF(gp_count eq 35, gp_xyz_fixed_col("%gp_lc_35%",%gp_scen%) = yes;);
IF(gp_count eq 36, gp_xyz_fixed_col("%gp_lc_36%",%gp_scen%) = yes;);
IF(gp_count eq 37, gp_xyz_fixed_col("%gp_lc_37%",%gp_scen%) = yes;);
IF(gp_count eq 38, gp_xyz_fixed_col("%gp_lc_38%",%gp_scen%) = yes;);
IF(gp_count eq 39, gp_xyz_fixed_col("%gp_lc_39%",%gp_scen%) = yes;);
IF(gp_count eq 40, gp_xyz_fixed_col("%gp_lc_40%",%gp_scen%) = yes;);
     ););
$label gpxyzlabel_after_fixcolorassignment



* Direct to histograms, spiderplots, 2D or 3D plots
$if a%1==afunction                     $goto gpxyzlabel_plotstatement_2dgraph
$if "%gp_style%" == "spiderplot"       $goto gpxyzlabel_plotstatement_spiderplot
$if dimension 1 %1                     $goto gpxyzlabel_plotstatement_1dgraph
$if dimension 2 %1                     $goto gpxyzlabel_plotstatement_histogram
$if a%2 == a                           $goto gpxyzlabel_plotstatement_newhistogram
$if dimension 4 %1                     $goto gpxyzlabel_plotstatement_3dgraph
$label gpxyzlabel_plotstatement_2dgraph

* 2D plots
put 'plot ';

$if not setglobal gp_functionplot_1    $goto gpxyzlabel_afterfunctionplot1
$if "%gp_functionplot_1%"=="no"        $goto gpxyzlabel_afterfunctionplot1
 put  '%gp_functionplot_1%';
$label gpxyzlabel_afterfunctionplot1

$if not setglobal gp_functionplot_2    $goto gpxyzlabel_afterfunctionplot2
$if "%gp_functionplot_2%"=="no"        $goto gpxyzlabel_afterfunctionplot2
 put  ',\' / '%gp_functionplot_2%';
$label gpxyzlabel_afterfunctionplot2

$if not setglobal gp_functionplot_3    $goto gpxyzlabel_afterfunctionplot3
$if "%gp_functionplot_3%"=="no"        $goto gpxyzlabel_afterfunctionplot3
 put  ',\' / '%gp_functionplot_3%';
$label gpxyzlabel_afterfunctionplot3

$if not setglobal gp_functionplot_4    $goto gpxyzlabel_afterfunctionplot4
$if "%gp_functionplot_4%"=="no"        $goto gpxyzlabel_afterfunctionplot4
 put  ',\' / '%gp_functionplot_4%';
$label gpxyzlabel_afterfunctionplot4

$if not setglobal gp_functionplot_5    $goto gpxyzlabel_afterfunctionplot5
$if "%gp_functionplot_5%"=="no"        $goto gpxyzlabel_afterfunctionplot5
 put  ',\' / '%gp_functionplot_5%';
$label gpxyzlabel_afterfunctionplot5

$if not setglobal gp_functionplot_6    $goto gpxyzlabel_afterfunctionplot6
$if "%gp_functionplot_6%"=="no"        $goto gpxyzlabel_afterfunctionplot6
 put  ',\' / '%gp_functionplot_6%';
$label gpxyzlabel_afterfunctionplot6

$if not setglobal gp_functionplot_7    $goto gpxyzlabel_afterfunctionplot7
$if "%gp_functionplot_7%"=="no"        $goto gpxyzlabel_afterfunctionplot7
 put  ',\' / '%gp_functionplot_7%';
$label gpxyzlabel_afterfunctionplot7

$if not setglobal gp_functionplot_8    $goto gpxyzlabel_afterfunctionplot8
$if "%gp_functionplot_8%"=="no"        $goto gpxyzlabel_afterfunctionplot8
 put  ',\' / '%gp_functionplot_8%';
$label gpxyzlabel_afterfunctionplot8

$if not setglobal gp_functionplot_9    $goto gpxyzlabel_afterfunctionplot9
$if "%gp_functionplot_9%"=="no"        $goto gpxyzlabel_afterfunctionplot9
 put  ',\' / '%gp_functionplot_9%';
$label gpxyzlabel_afterfunctionplot9



$if a%1==afunction                     putclose;
$if a%1==afunction                     $goto gpxyzlabel_rungnupl
$if "%gp_functionplot_any%"=="yes"     Put ",";


gp_count=1;
loop(%gp_scen%,
  if (gp_count gt 1, put ',';);
  file.nw = 0

  put  '\'/' "gnuplot%gp_multiplot_count%.dat" index ',(gp_count-1):0:0;
  put ' using 1:2';

* filled curves
$if not "%gp_style%"=="filledcurves"               $goto gpxyzlabel_after_fillcurvecheck
$if a%4==a                                         $goto gpxyzlabel_after_fillcurvecheck
 put ':3';
$label gpxyzlabel_after_fillcurvecheck

* Insert Auto Code 4 produced by make_345678_linestyle.gms - begin
$if "%gp_l1style%"=="no"                           $goto gpxyzlabel_l_1_errorstyle
$if "%gp_l1style%"=="xerrorlines"                  If(gp_count eq 1, put ':3:4 ';);
$if "%gp_l1style%"=="yerrorlines"                  If(gp_count eq 1, put ':3:4 ';);
$if "%gp_l1style%"=="xerrorbars"                   If(gp_count eq 1, put ':3:4 ';);
$if "%gp_l1style%"=="yerrorbars"                   If(gp_count eq 1, put ':3:4 ';);
$if "%gp_l1style%"=="candlesticks"                 If(gp_count eq 1, put ':3:4:5 ';);
$if "%gp_l1style%"=="xyerrorlines"                 If(gp_count eq 1, put ':3:4:5:6 ';);
$if "%gp_l1style%"=="xyerrorbars"                  If(gp_count eq 1, put ':3:4:5:6 ';);
$if "%gp_l1style%"=="boxxyerrorbars"               If(gp_count eq 1, put ':3:4:5:6 ';);
$if "%gp_l1style%"=="circles"                      If(gp_count eq 1 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l1style%"=="circles"                      If(gp_count eq 1 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l1style%"=="circles"                      If(gp_count eq 1 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l1style%"=="circles"                      If(gp_count eq 1 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_1_errorstyle

$if "%gp_l2style%"=="no"                           $goto gpxyzlabel_l_2_errorstyle
$if "%gp_l2style%"=="xerrorlines"                  If(gp_count eq 2, put ':3:4 ';);
$if "%gp_l2style%"=="yerrorlines"                  If(gp_count eq 2, put ':3:4 ';);
$if "%gp_l2style%"=="xerrorbars"                   If(gp_count eq 2, put ':3:4 ';);
$if "%gp_l2style%"=="yerrorbars"                   If(gp_count eq 2, put ':3:4 ';);
$if "%gp_l2style%"=="candlesticks"                 If(gp_count eq 2, put ':3:4:5 ';);
$if "%gp_l2style%"=="xyerrorlines"                 If(gp_count eq 2, put ':3:4:5:6 ';);
$if "%gp_l2style%"=="xyerrorbars"                  If(gp_count eq 2, put ':3:4:5:6 ';);
$if "%gp_l2style%"=="boxxyerrorbars"               If(gp_count eq 2, put ':3:4:5:6 ';);
$if "%gp_l2style%"=="circles"                      If(gp_count eq 2 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l2style%"=="circles"                      If(gp_count eq 2 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l2style%"=="circles"                      If(gp_count eq 2 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l2style%"=="circles"                      If(gp_count eq 2 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_2_errorstyle

$if "%gp_l3style%"=="no"                           $goto gpxyzlabel_l_3_errorstyle
$if "%gp_l3style%"=="xerrorlines"                  If(gp_count eq 3, put ':3:4 ';);
$if "%gp_l3style%"=="yerrorlines"                  If(gp_count eq 3, put ':3:4 ';);
$if "%gp_l3style%"=="xerrorbars"                   If(gp_count eq 3, put ':3:4 ';);
$if "%gp_l3style%"=="yerrorbars"                   If(gp_count eq 3, put ':3:4 ';);
$if "%gp_l3style%"=="candlesticks"                 If(gp_count eq 3, put ':3:4:5 ';);
$if "%gp_l3style%"=="xyerrorlines"                 If(gp_count eq 3, put ':3:4:5:6 ';);
$if "%gp_l3style%"=="xyerrorbars"                  If(gp_count eq 3, put ':3:4:5:6 ';);
$if "%gp_l3style%"=="boxxyerrorbars"               If(gp_count eq 3, put ':3:4:5:6 ';);
$if "%gp_l3style%"=="circles"                      If(gp_count eq 3 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l3style%"=="circles"                      If(gp_count eq 3 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l3style%"=="circles"                      If(gp_count eq 3 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l3style%"=="circles"                      If(gp_count eq 3 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_3_errorstyle

$if "%gp_l4style%"=="no"                           $goto gpxyzlabel_l_4_errorstyle
$if "%gp_l4style%"=="xerrorlines"                  If(gp_count eq 4, put ':3:4 ';);
$if "%gp_l4style%"=="yerrorlines"                  If(gp_count eq 4, put ':3:4 ';);
$if "%gp_l4style%"=="xerrorbars"                   If(gp_count eq 4, put ':3:4 ';);
$if "%gp_l4style%"=="yerrorbars"                   If(gp_count eq 4, put ':3:4 ';);
$if "%gp_l4style%"=="candlesticks"                 If(gp_count eq 4, put ':3:4:5 ';);
$if "%gp_l4style%"=="xyerrorlines"                 If(gp_count eq 4, put ':3:4:5:6 ';);
$if "%gp_l4style%"=="xyerrorbars"                  If(gp_count eq 4, put ':3:4:5:6 ';);
$if "%gp_l4style%"=="boxxyerrorbars"               If(gp_count eq 4, put ':3:4:5:6 ';);
$if "%gp_l4style%"=="circles"                      If(gp_count eq 4 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l4style%"=="circles"                      If(gp_count eq 4 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l4style%"=="circles"                      If(gp_count eq 4 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l4style%"=="circles"                      If(gp_count eq 4 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_4_errorstyle

$if "%gp_l5style%"=="no"                           $goto gpxyzlabel_l_5_errorstyle
$if "%gp_l5style%"=="xerrorlines"                  If(gp_count eq 5, put ':3:4 ';);
$if "%gp_l5style%"=="yerrorlines"                  If(gp_count eq 5, put ':3:4 ';);
$if "%gp_l5style%"=="xerrorbars"                   If(gp_count eq 5, put ':3:4 ';);
$if "%gp_l5style%"=="yerrorbars"                   If(gp_count eq 5, put ':3:4 ';);
$if "%gp_l5style%"=="candlesticks"                 If(gp_count eq 5, put ':3:4:5 ';);
$if "%gp_l5style%"=="xyerrorlines"                 If(gp_count eq 5, put ':3:4:5:6 ';);
$if "%gp_l5style%"=="xyerrorbars"                  If(gp_count eq 5, put ':3:4:5:6 ';);
$if "%gp_l5style%"=="boxxyerrorbars"               If(gp_count eq 5, put ':3:4:5:6 ';);
$if "%gp_l5style%"=="circles"                      If(gp_count eq 5 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l5style%"=="circles"                      If(gp_count eq 5 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l5style%"=="circles"                      If(gp_count eq 5 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l5style%"=="circles"                      If(gp_count eq 5 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_5_errorstyle

$if "%gp_l6style%"=="no"                           $goto gpxyzlabel_l_6_errorstyle
$if "%gp_l6style%"=="xerrorlines"                  If(gp_count eq 6, put ':3:4 ';);
$if "%gp_l6style%"=="yerrorlines"                  If(gp_count eq 6, put ':3:4 ';);
$if "%gp_l6style%"=="xerrorbars"                   If(gp_count eq 6, put ':3:4 ';);
$if "%gp_l6style%"=="yerrorbars"                   If(gp_count eq 6, put ':3:4 ';);
$if "%gp_l6style%"=="candlesticks"                 If(gp_count eq 6, put ':3:4:5 ';);
$if "%gp_l6style%"=="xyerrorlines"                 If(gp_count eq 6, put ':3:4:5:6 ';);
$if "%gp_l6style%"=="xyerrorbars"                  If(gp_count eq 6, put ':3:4:5:6 ';);
$if "%gp_l6style%"=="boxxyerrorbars"               If(gp_count eq 6, put ':3:4:5:6 ';);
$if "%gp_l6style%"=="circles"                      If(gp_count eq 6 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l6style%"=="circles"                      If(gp_count eq 6 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l6style%"=="circles"                      If(gp_count eq 6 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l6style%"=="circles"                      If(gp_count eq 6 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_6_errorstyle

$if "%gp_l7style%"=="no"                           $goto gpxyzlabel_l_7_errorstyle
$if "%gp_l7style%"=="xerrorlines"                  If(gp_count eq 7, put ':3:4 ';);
$if "%gp_l7style%"=="yerrorlines"                  If(gp_count eq 7, put ':3:4 ';);
$if "%gp_l7style%"=="xerrorbars"                   If(gp_count eq 7, put ':3:4 ';);
$if "%gp_l7style%"=="yerrorbars"                   If(gp_count eq 7, put ':3:4 ';);
$if "%gp_l7style%"=="candlesticks"                 If(gp_count eq 7, put ':3:4:5 ';);
$if "%gp_l7style%"=="xyerrorlines"                 If(gp_count eq 7, put ':3:4:5:6 ';);
$if "%gp_l7style%"=="xyerrorbars"                  If(gp_count eq 7, put ':3:4:5:6 ';);
$if "%gp_l7style%"=="boxxyerrorbars"               If(gp_count eq 7, put ':3:4:5:6 ';);
$if "%gp_l7style%"=="circles"                      If(gp_count eq 7 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l7style%"=="circles"                      If(gp_count eq 7 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l7style%"=="circles"                      If(gp_count eq 7 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l7style%"=="circles"                      If(gp_count eq 7 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_7_errorstyle

$if "%gp_l8style%"=="no"                           $goto gpxyzlabel_l_8_errorstyle
$if "%gp_l8style%"=="xerrorlines"                  If(gp_count eq 8, put ':3:4 ';);
$if "%gp_l8style%"=="yerrorlines"                  If(gp_count eq 8, put ':3:4 ';);
$if "%gp_l8style%"=="xerrorbars"                   If(gp_count eq 8, put ':3:4 ';);
$if "%gp_l8style%"=="yerrorbars"                   If(gp_count eq 8, put ':3:4 ';);
$if "%gp_l8style%"=="candlesticks"                 If(gp_count eq 8, put ':3:4:5 ';);
$if "%gp_l8style%"=="xyerrorlines"                 If(gp_count eq 8, put ':3:4:5:6 ';);
$if "%gp_l8style%"=="xyerrorbars"                  If(gp_count eq 8, put ':3:4:5:6 ';);
$if "%gp_l8style%"=="boxxyerrorbars"               If(gp_count eq 8, put ':3:4:5:6 ';);
$if "%gp_l8style%"=="circles"                      If(gp_count eq 8 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l8style%"=="circles"                      If(gp_count eq 8 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l8style%"=="circles"                      If(gp_count eq 8 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l8style%"=="circles"                      If(gp_count eq 8 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_8_errorstyle

$if "%gp_l9style%"=="no"                           $goto gpxyzlabel_l_9_errorstyle
$if "%gp_l9style%"=="xerrorlines"                  If(gp_count eq 9, put ':3:4 ';);
$if "%gp_l9style%"=="yerrorlines"                  If(gp_count eq 9, put ':3:4 ';);
$if "%gp_l9style%"=="xerrorbars"                   If(gp_count eq 9, put ':3:4 ';);
$if "%gp_l9style%"=="yerrorbars"                   If(gp_count eq 9, put ':3:4 ';);
$if "%gp_l9style%"=="candlesticks"                 If(gp_count eq 9, put ':3:4:5 ';);
$if "%gp_l9style%"=="xyerrorlines"                 If(gp_count eq 9, put ':3:4:5:6 ';);
$if "%gp_l9style%"=="xyerrorbars"                  If(gp_count eq 9, put ':3:4:5:6 ';);
$if "%gp_l9style%"=="boxxyerrorbars"               If(gp_count eq 9, put ':3:4:5:6 ';);
$if "%gp_l9style%"=="circles"                      If(gp_count eq 9 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l9style%"=="circles"                      If(gp_count eq 9 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l9style%"=="circles"                      If(gp_count eq 9 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l9style%"=="circles"                      If(gp_count eq 9 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_9_errorstyle

$if "%gp_l10style%"=="no"                          $goto gpxyzlabel_l_10_errorstyle
$if "%gp_l10style%"=="xerrorlines"                 If(gp_count eq 10, put ':3:4 ';);
$if "%gp_l10style%"=="yerrorlines"                 If(gp_count eq 10, put ':3:4 ';);
$if "%gp_l10style%"=="xerrorbars"                  If(gp_count eq 10, put ':3:4 ';);
$if "%gp_l10style%"=="yerrorbars"                  If(gp_count eq 10, put ':3:4 ';);
$if "%gp_l10style%"=="candlesticks"                If(gp_count eq 10, put ':3:4:5 ';);
$if "%gp_l10style%"=="xyerrorlines"                If(gp_count eq 10, put ':3:4:5:6 ';);
$if "%gp_l10style%"=="xyerrorbars"                 If(gp_count eq 10, put ':3:4:5:6 ';);
$if "%gp_l10style%"=="boxxyerrorbars"              If(gp_count eq 10, put ':3:4:5:6 ';);
$if "%gp_l10style%"=="circles"                     If(gp_count eq 10 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l10style%"=="circles"                     If(gp_count eq 10 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l10style%"=="circles"                     If(gp_count eq 10 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l10style%"=="circles"                     If(gp_count eq 10 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_10_errorstyle

$if "%gp_l11style%"=="no"                          $goto gpxyzlabel_l_11_errorstyle
$if "%gp_l11style%"=="xerrorlines"                 If(gp_count eq 11, put ':3:4 ';);
$if "%gp_l11style%"=="yerrorlines"                 If(gp_count eq 11, put ':3:4 ';);
$if "%gp_l11style%"=="xerrorbars"                  If(gp_count eq 11, put ':3:4 ';);
$if "%gp_l11style%"=="yerrorbars"                  If(gp_count eq 11, put ':3:4 ';);
$if "%gp_l11style%"=="candlesticks"                If(gp_count eq 11, put ':3:4:5 ';);
$if "%gp_l11style%"=="xyerrorlines"                If(gp_count eq 11, put ':3:4:5:6 ';);
$if "%gp_l11style%"=="xyerrorbars"                 If(gp_count eq 11, put ':3:4:5:6 ';);
$if "%gp_l11style%"=="boxxyerrorbars"              If(gp_count eq 11, put ':3:4:5:6 ';);
$if "%gp_l11style%"=="circles"                     If(gp_count eq 11 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l11style%"=="circles"                     If(gp_count eq 11 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l11style%"=="circles"                     If(gp_count eq 11 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l11style%"=="circles"                     If(gp_count eq 11 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_11_errorstyle

$if "%gp_l12style%"=="no"                          $goto gpxyzlabel_l_12_errorstyle
$if "%gp_l12style%"=="xerrorlines"                 If(gp_count eq 12, put ':3:4 ';);
$if "%gp_l12style%"=="yerrorlines"                 If(gp_count eq 12, put ':3:4 ';);
$if "%gp_l12style%"=="xerrorbars"                  If(gp_count eq 12, put ':3:4 ';);
$if "%gp_l12style%"=="yerrorbars"                  If(gp_count eq 12, put ':3:4 ';);
$if "%gp_l12style%"=="candlesticks"                If(gp_count eq 12, put ':3:4:5 ';);
$if "%gp_l12style%"=="xyerrorlines"                If(gp_count eq 12, put ':3:4:5:6 ';);
$if "%gp_l12style%"=="xyerrorbars"                 If(gp_count eq 12, put ':3:4:5:6 ';);
$if "%gp_l12style%"=="boxxyerrorbars"              If(gp_count eq 12, put ':3:4:5:6 ';);
$if "%gp_l12style%"=="circles"                     If(gp_count eq 12 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l12style%"=="circles"                     If(gp_count eq 12 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l12style%"=="circles"                     If(gp_count eq 12 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l12style%"=="circles"                     If(gp_count eq 12 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_12_errorstyle

$if "%gp_l13style%"=="no"                          $goto gpxyzlabel_l_13_errorstyle
$if "%gp_l13style%"=="xerrorlines"                 If(gp_count eq 13, put ':3:4 ';);
$if "%gp_l13style%"=="yerrorlines"                 If(gp_count eq 13, put ':3:4 ';);
$if "%gp_l13style%"=="xerrorbars"                  If(gp_count eq 13, put ':3:4 ';);
$if "%gp_l13style%"=="yerrorbars"                  If(gp_count eq 13, put ':3:4 ';);
$if "%gp_l13style%"=="candlesticks"                If(gp_count eq 13, put ':3:4:5 ';);
$if "%gp_l13style%"=="xyerrorlines"                If(gp_count eq 13, put ':3:4:5:6 ';);
$if "%gp_l13style%"=="xyerrorbars"                 If(gp_count eq 13, put ':3:4:5:6 ';);
$if "%gp_l13style%"=="boxxyerrorbars"              If(gp_count eq 13, put ':3:4:5:6 ';);
$if "%gp_l13style%"=="circles"                     If(gp_count eq 13 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l13style%"=="circles"                     If(gp_count eq 13 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l13style%"=="circles"                     If(gp_count eq 13 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l13style%"=="circles"                     If(gp_count eq 13 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_13_errorstyle

$if "%gp_l14style%"=="no"                          $goto gpxyzlabel_l_14_errorstyle
$if "%gp_l14style%"=="xerrorlines"                 If(gp_count eq 14, put ':3:4 ';);
$if "%gp_l14style%"=="yerrorlines"                 If(gp_count eq 14, put ':3:4 ';);
$if "%gp_l14style%"=="xerrorbars"                  If(gp_count eq 14, put ':3:4 ';);
$if "%gp_l14style%"=="yerrorbars"                  If(gp_count eq 14, put ':3:4 ';);
$if "%gp_l14style%"=="candlesticks"                If(gp_count eq 14, put ':3:4:5 ';);
$if "%gp_l14style%"=="xyerrorlines"                If(gp_count eq 14, put ':3:4:5:6 ';);
$if "%gp_l14style%"=="xyerrorbars"                 If(gp_count eq 14, put ':3:4:5:6 ';);
$if "%gp_l14style%"=="boxxyerrorbars"              If(gp_count eq 14, put ':3:4:5:6 ';);
$if "%gp_l14style%"=="circles"                     If(gp_count eq 14 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l14style%"=="circles"                     If(gp_count eq 14 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l14style%"=="circles"                     If(gp_count eq 14 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l14style%"=="circles"                     If(gp_count eq 14 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_14_errorstyle

$if "%gp_l15style%"=="no"                          $goto gpxyzlabel_l_15_errorstyle
$if "%gp_l15style%"=="xerrorlines"                 If(gp_count eq 15, put ':3:4 ';);
$if "%gp_l15style%"=="yerrorlines"                 If(gp_count eq 15, put ':3:4 ';);
$if "%gp_l15style%"=="xerrorbars"                  If(gp_count eq 15, put ':3:4 ';);
$if "%gp_l15style%"=="yerrorbars"                  If(gp_count eq 15, put ':3:4 ';);
$if "%gp_l15style%"=="candlesticks"                If(gp_count eq 15, put ':3:4:5 ';);
$if "%gp_l15style%"=="xyerrorlines"                If(gp_count eq 15, put ':3:4:5:6 ';);
$if "%gp_l15style%"=="xyerrorbars"                 If(gp_count eq 15, put ':3:4:5:6 ';);
$if "%gp_l15style%"=="boxxyerrorbars"              If(gp_count eq 15, put ':3:4:5:6 ';);
$if "%gp_l15style%"=="circles"                     If(gp_count eq 15 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l15style%"=="circles"                     If(gp_count eq 15 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l15style%"=="circles"                     If(gp_count eq 15 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l15style%"=="circles"                     If(gp_count eq 15 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_15_errorstyle

$if "%gp_l16style%"=="no"                          $goto gpxyzlabel_l_16_errorstyle
$if "%gp_l16style%"=="xerrorlines"                 If(gp_count eq 16, put ':3:4 ';);
$if "%gp_l16style%"=="yerrorlines"                 If(gp_count eq 16, put ':3:4 ';);
$if "%gp_l16style%"=="xerrorbars"                  If(gp_count eq 16, put ':3:4 ';);
$if "%gp_l16style%"=="yerrorbars"                  If(gp_count eq 16, put ':3:4 ';);
$if "%gp_l16style%"=="candlesticks"                If(gp_count eq 16, put ':3:4:5 ';);
$if "%gp_l16style%"=="xyerrorlines"                If(gp_count eq 16, put ':3:4:5:6 ';);
$if "%gp_l16style%"=="xyerrorbars"                 If(gp_count eq 16, put ':3:4:5:6 ';);
$if "%gp_l16style%"=="boxxyerrorbars"              If(gp_count eq 16, put ':3:4:5:6 ';);
$if "%gp_l16style%"=="circles"                     If(gp_count eq 16 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l16style%"=="circles"                     If(gp_count eq 16 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l16style%"=="circles"                     If(gp_count eq 16 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l16style%"=="circles"                     If(gp_count eq 16 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_16_errorstyle

$if "%gp_l17style%"=="no"                          $goto gpxyzlabel_l_17_errorstyle
$if "%gp_l17style%"=="xerrorlines"                 If(gp_count eq 17, put ':3:4 ';);
$if "%gp_l17style%"=="yerrorlines"                 If(gp_count eq 17, put ':3:4 ';);
$if "%gp_l17style%"=="xerrorbars"                  If(gp_count eq 17, put ':3:4 ';);
$if "%gp_l17style%"=="yerrorbars"                  If(gp_count eq 17, put ':3:4 ';);
$if "%gp_l17style%"=="candlesticks"                If(gp_count eq 17, put ':3:4:5 ';);
$if "%gp_l17style%"=="xyerrorlines"                If(gp_count eq 17, put ':3:4:5:6 ';);
$if "%gp_l17style%"=="xyerrorbars"                 If(gp_count eq 17, put ':3:4:5:6 ';);
$if "%gp_l17style%"=="boxxyerrorbars"              If(gp_count eq 17, put ':3:4:5:6 ';);
$if "%gp_l17style%"=="circles"                     If(gp_count eq 17 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l17style%"=="circles"                     If(gp_count eq 17 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l17style%"=="circles"                     If(gp_count eq 17 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l17style%"=="circles"                     If(gp_count eq 17 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_17_errorstyle

$if "%gp_l18style%"=="no"                          $goto gpxyzlabel_l_18_errorstyle
$if "%gp_l18style%"=="xerrorlines"                 If(gp_count eq 18, put ':3:4 ';);
$if "%gp_l18style%"=="yerrorlines"                 If(gp_count eq 18, put ':3:4 ';);
$if "%gp_l18style%"=="xerrorbars"                  If(gp_count eq 18, put ':3:4 ';);
$if "%gp_l18style%"=="yerrorbars"                  If(gp_count eq 18, put ':3:4 ';);
$if "%gp_l18style%"=="candlesticks"                If(gp_count eq 18, put ':3:4:5 ';);
$if "%gp_l18style%"=="xyerrorlines"                If(gp_count eq 18, put ':3:4:5:6 ';);
$if "%gp_l18style%"=="xyerrorbars"                 If(gp_count eq 18, put ':3:4:5:6 ';);
$if "%gp_l18style%"=="boxxyerrorbars"              If(gp_count eq 18, put ':3:4:5:6 ';);
$if "%gp_l18style%"=="circles"                     If(gp_count eq 18 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l18style%"=="circles"                     If(gp_count eq 18 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l18style%"=="circles"                     If(gp_count eq 18 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l18style%"=="circles"                     If(gp_count eq 18 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_18_errorstyle

$if "%gp_l19style%"=="no"                          $goto gpxyzlabel_l_19_errorstyle
$if "%gp_l19style%"=="xerrorlines"                 If(gp_count eq 19, put ':3:4 ';);
$if "%gp_l19style%"=="yerrorlines"                 If(gp_count eq 19, put ':3:4 ';);
$if "%gp_l19style%"=="xerrorbars"                  If(gp_count eq 19, put ':3:4 ';);
$if "%gp_l19style%"=="yerrorbars"                  If(gp_count eq 19, put ':3:4 ';);
$if "%gp_l19style%"=="candlesticks"                If(gp_count eq 19, put ':3:4:5 ';);
$if "%gp_l19style%"=="xyerrorlines"                If(gp_count eq 19, put ':3:4:5:6 ';);
$if "%gp_l19style%"=="xyerrorbars"                 If(gp_count eq 19, put ':3:4:5:6 ';);
$if "%gp_l19style%"=="boxxyerrorbars"              If(gp_count eq 19, put ':3:4:5:6 ';);
$if "%gp_l19style%"=="circles"                     If(gp_count eq 19 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l19style%"=="circles"                     If(gp_count eq 19 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l19style%"=="circles"                     If(gp_count eq 19 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l19style%"=="circles"                     If(gp_count eq 19 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_19_errorstyle

$if "%gp_l20style%"=="no"                          $goto gpxyzlabel_l_20_errorstyle
$if "%gp_l20style%"=="xerrorlines"                 If(gp_count eq 20, put ':3:4 ';);
$if "%gp_l20style%"=="yerrorlines"                 If(gp_count eq 20, put ':3:4 ';);
$if "%gp_l20style%"=="xerrorbars"                  If(gp_count eq 20, put ':3:4 ';);
$if "%gp_l20style%"=="yerrorbars"                  If(gp_count eq 20, put ':3:4 ';);
$if "%gp_l20style%"=="candlesticks"                If(gp_count eq 20, put ':3:4:5 ';);
$if "%gp_l20style%"=="xyerrorlines"                If(gp_count eq 20, put ':3:4:5:6 ';);
$if "%gp_l20style%"=="xyerrorbars"                 If(gp_count eq 20, put ':3:4:5:6 ';);
$if "%gp_l20style%"=="boxxyerrorbars"              If(gp_count eq 20, put ':3:4:5:6 ';);
$if "%gp_l20style%"=="circles"                     If(gp_count eq 20 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) eq 0, put ':3 ';);
$if "%gp_l20style%"=="circles"                     If(gp_count eq 20 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) eq 0, put ':3:4 ';);
$if "%gp_l20style%"=="circles"                     If(gp_count eq 20 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ne 0),1) ne 0 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) eq 0, put ':3:4:5 ';);
$if "%gp_l20style%"=="circles"                     If(gp_count eq 20 and sum(%gp_obsv_1% $(%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ne 0),1) ne 0, put ':3:4:5:6 ';);
$label gpxyzlabel_l_20_errorstyle
* Insert Auto Code 4 produced by make_345678_linestyle.gms - end





* Insert Auto Code 5 produced by make_4_linestyle.gms - begin
$if not setglobal gp_l1axes                        $goto gpxyzlabel_after_1_axes
$if "%gp_l1axes%"=="no"                            $goto gpxyzlabel_after_1_axes
If(gp_count eq 1, put ' axes %gp_l1axes%';);
$label gpxyzlabel_after_1_axes
$if not setglobal gp_l2axes                        $goto gpxyzlabel_after_2_axes
$if "%gp_l2axes%"=="no"                            $goto gpxyzlabel_after_2_axes
If(gp_count eq 2, put ' axes %gp_l2axes%';);
$label gpxyzlabel_after_2_axes
$if not setglobal gp_l3axes                        $goto gpxyzlabel_after_3_axes
$if "%gp_l3axes%"=="no"                            $goto gpxyzlabel_after_3_axes
If(gp_count eq 3, put ' axes %gp_l3axes%';);
$label gpxyzlabel_after_3_axes
$if not setglobal gp_l4axes                        $goto gpxyzlabel_after_4_axes
$if "%gp_l4axes%"=="no"                            $goto gpxyzlabel_after_4_axes
If(gp_count eq 4, put ' axes %gp_l4axes%';);
$label gpxyzlabel_after_4_axes
$if not setglobal gp_l5axes                        $goto gpxyzlabel_after_5_axes
$if "%gp_l5axes%"=="no"                            $goto gpxyzlabel_after_5_axes
If(gp_count eq 5, put ' axes %gp_l5axes%';);
$label gpxyzlabel_after_5_axes
$if not setglobal gp_l6axes                        $goto gpxyzlabel_after_6_axes
$if "%gp_l6axes%"=="no"                            $goto gpxyzlabel_after_6_axes
If(gp_count eq 6, put ' axes %gp_l6axes%';);
$label gpxyzlabel_after_6_axes
$if not setglobal gp_l7axes                        $goto gpxyzlabel_after_7_axes
$if "%gp_l7axes%"=="no"                            $goto gpxyzlabel_after_7_axes
If(gp_count eq 7, put ' axes %gp_l7axes%';);
$label gpxyzlabel_after_7_axes
$if not setglobal gp_l8axes                        $goto gpxyzlabel_after_8_axes
$if "%gp_l8axes%"=="no"                            $goto gpxyzlabel_after_8_axes
If(gp_count eq 8, put ' axes %gp_l8axes%';);
$label gpxyzlabel_after_8_axes
$if not setglobal gp_l9axes                        $goto gpxyzlabel_after_9_axes
$if "%gp_l9axes%"=="no"                            $goto gpxyzlabel_after_9_axes
If(gp_count eq 9, put ' axes %gp_l9axes%';);
$label gpxyzlabel_after_9_axes
$if not setglobal gp_l10axes                       $goto gpxyzlabel_after_10_axes
$if "%gp_l10axes%"=="no"                           $goto gpxyzlabel_after_10_axes
If(gp_count eq 10, put ' axes %gp_l10axes%';);
$label gpxyzlabel_after_10_axes
$if not setglobal gp_l11axes                       $goto gpxyzlabel_after_11_axes
$if "%gp_l11axes%"=="no"                           $goto gpxyzlabel_after_11_axes
If(gp_count eq 11, put ' axes %gp_l11axes%';);
$label gpxyzlabel_after_11_axes
$if not setglobal gp_l12axes                       $goto gpxyzlabel_after_12_axes
$if "%gp_l12axes%"=="no"                           $goto gpxyzlabel_after_12_axes
If(gp_count eq 12, put ' axes %gp_l12axes%';);
$label gpxyzlabel_after_12_axes
$if not setglobal gp_l13axes                       $goto gpxyzlabel_after_13_axes
$if "%gp_l13axes%"=="no"                           $goto gpxyzlabel_after_13_axes
If(gp_count eq 13, put ' axes %gp_l13axes%';);
$label gpxyzlabel_after_13_axes
$if not setglobal gp_l14axes                       $goto gpxyzlabel_after_14_axes
$if "%gp_l14axes%"=="no"                           $goto gpxyzlabel_after_14_axes
If(gp_count eq 14, put ' axes %gp_l14axes%';);
$label gpxyzlabel_after_14_axes
$if not setglobal gp_l15axes                       $goto gpxyzlabel_after_15_axes
$if "%gp_l15axes%"=="no"                           $goto gpxyzlabel_after_15_axes
If(gp_count eq 15, put ' axes %gp_l15axes%';);
$label gpxyzlabel_after_15_axes
$if not setglobal gp_l16axes                       $goto gpxyzlabel_after_16_axes
$if "%gp_l16axes%"=="no"                           $goto gpxyzlabel_after_16_axes
If(gp_count eq 16, put ' axes %gp_l16axes%';);
$label gpxyzlabel_after_16_axes
$if not setglobal gp_l17axes                       $goto gpxyzlabel_after_17_axes
$if "%gp_l17axes%"=="no"                           $goto gpxyzlabel_after_17_axes
If(gp_count eq 17, put ' axes %gp_l17axes%';);
$label gpxyzlabel_after_17_axes
$if not setglobal gp_l18axes                       $goto gpxyzlabel_after_18_axes
$if "%gp_l18axes%"=="no"                           $goto gpxyzlabel_after_18_axes
If(gp_count eq 18, put ' axes %gp_l18axes%';);
$label gpxyzlabel_after_18_axes
$if not setglobal gp_l19axes                       $goto gpxyzlabel_after_19_axes
$if "%gp_l19axes%"=="no"                           $goto gpxyzlabel_after_19_axes
If(gp_count eq 19, put ' axes %gp_l19axes%';);
$label gpxyzlabel_after_19_axes
$if not setglobal gp_l20axes                       $goto gpxyzlabel_after_20_axes
$if "%gp_l20axes%"=="no"                           $goto gpxyzlabel_after_20_axes
If(gp_count eq 20, put ' axes %gp_l20axes%';);
$label gpxyzlabel_after_20_axes
* Insert Auto Code 5 produced by make_4_linestyle.gms - end

IF(no_gp_legend(%gp_scen%),  put ' title ""';
 ELSE put ' title "',%gp_scen%.tl,'"';);

* Insert Auto Code 6 produced by make_4_linestyle.gms - begin
$if not setglobal gp_l1style                       $goto gpxyzlabel_l_1_style
$if "%gp_l1style%"=="no"                           $goto gpxyzlabel_l_1_style
If(gp_count eq 1, put " with %gp_l1style%";);
$if not "%gp_l1style%" == "boxes"                  $goto gpxyzlabel_l_1_style
$if  "%gp_color%" == "no"                          If(gp_count eq 1, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 1, put " lt -1";);
$label gpxyzlabel_l_1_style
$if not setglobal gp_l2style                       $goto gpxyzlabel_l_2_style
$if "%gp_l2style%"=="no"                           $goto gpxyzlabel_l_2_style
If(gp_count eq 2, put " with %gp_l2style%";);
$if not "%gp_l2style%" == "boxes"                  $goto gpxyzlabel_l_2_style
$if  "%gp_color%" == "no"                          If(gp_count eq 2, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 2, put " lt -1";);
$label gpxyzlabel_l_2_style
$if not setglobal gp_l3style                       $goto gpxyzlabel_l_3_style
$if "%gp_l3style%"=="no"                           $goto gpxyzlabel_l_3_style
If(gp_count eq 3, put " with %gp_l3style%";);
$if not "%gp_l3style%" == "boxes"                  $goto gpxyzlabel_l_3_style
$if  "%gp_color%" == "no"                          If(gp_count eq 3, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 3, put " lt -1";);
$label gpxyzlabel_l_3_style
$if not setglobal gp_l4style                       $goto gpxyzlabel_l_4_style
$if "%gp_l4style%"=="no"                           $goto gpxyzlabel_l_4_style
If(gp_count eq 4, put " with %gp_l4style%";);
$if not "%gp_l4style%" == "boxes"                  $goto gpxyzlabel_l_4_style
$if  "%gp_color%" == "no"                          If(gp_count eq 4, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 4, put " lt -1";);
$label gpxyzlabel_l_4_style
$if not setglobal gp_l5style                       $goto gpxyzlabel_l_5_style
$if "%gp_l5style%"=="no"                           $goto gpxyzlabel_l_5_style
If(gp_count eq 5, put " with %gp_l5style%";);
$if not "%gp_l5style%" == "boxes"                  $goto gpxyzlabel_l_5_style
$if  "%gp_color%" == "no"                          If(gp_count eq 5, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 5, put " lt -1";);
$label gpxyzlabel_l_5_style
$if not setglobal gp_l6style                       $goto gpxyzlabel_l_6_style
$if "%gp_l6style%"=="no"                           $goto gpxyzlabel_l_6_style
If(gp_count eq 6, put " with %gp_l6style%";);
$if not "%gp_l6style%" == "boxes"                  $goto gpxyzlabel_l_6_style
$if  "%gp_color%" == "no"                          If(gp_count eq 6, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 6, put " lt -1";);
$label gpxyzlabel_l_6_style
$if not setglobal gp_l7style                       $goto gpxyzlabel_l_7_style
$if "%gp_l7style%"=="no"                           $goto gpxyzlabel_l_7_style
If(gp_count eq 7, put " with %gp_l7style%";);
$if not "%gp_l7style%" == "boxes"                  $goto gpxyzlabel_l_7_style
$if  "%gp_color%" == "no"                          If(gp_count eq 7, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 7, put " lt -1";);
$label gpxyzlabel_l_7_style
$if not setglobal gp_l8style                       $goto gpxyzlabel_l_8_style
$if "%gp_l8style%"=="no"                           $goto gpxyzlabel_l_8_style
If(gp_count eq 8, put " with %gp_l8style%";);
$if not "%gp_l8style%" == "boxes"                  $goto gpxyzlabel_l_8_style
$if  "%gp_color%" == "no"                          If(gp_count eq 8, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 8, put " lt -1";);
$label gpxyzlabel_l_8_style
$if not setglobal gp_l9style                       $goto gpxyzlabel_l_9_style
$if "%gp_l9style%"=="no"                           $goto gpxyzlabel_l_9_style
If(gp_count eq 9, put " with %gp_l9style%";);
$if not "%gp_l9style%" == "boxes"                  $goto gpxyzlabel_l_9_style
$if  "%gp_color%" == "no"                          If(gp_count eq 9, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 9, put " lt -1";);
$label gpxyzlabel_l_9_style
$if not setglobal gp_l10style                      $goto gpxyzlabel_l_10_style
$if "%gp_l10style%"=="no"                          $goto gpxyzlabel_l_10_style
If(gp_count eq 10, put " with %gp_l10style%";);
$if not "%gp_l10style%" == "boxes"                 $goto gpxyzlabel_l_10_style
$if  "%gp_color%" == "no"                          If(gp_count eq 10, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 10, put " lt -1";);
$label gpxyzlabel_l_10_style
$if not setglobal gp_l11style                      $goto gpxyzlabel_l_11_style
$if "%gp_l11style%"=="no"                          $goto gpxyzlabel_l_11_style
If(gp_count eq 11, put " with %gp_l11style%";);
$if not "%gp_l11style%" == "boxes"                 $goto gpxyzlabel_l_11_style
$if  "%gp_color%" == "no"                          If(gp_count eq 11, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 11, put " lt -1";);
$label gpxyzlabel_l_11_style
$if not setglobal gp_l12style                      $goto gpxyzlabel_l_12_style
$if "%gp_l12style%"=="no"                          $goto gpxyzlabel_l_12_style
If(gp_count eq 12, put " with %gp_l12style%";);
$if not "%gp_l12style%" == "boxes"                 $goto gpxyzlabel_l_12_style
$if  "%gp_color%" == "no"                          If(gp_count eq 12, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 12, put " lt -1";);
$label gpxyzlabel_l_12_style
$if not setglobal gp_l13style                      $goto gpxyzlabel_l_13_style
$if "%gp_l13style%"=="no"                          $goto gpxyzlabel_l_13_style
If(gp_count eq 13, put " with %gp_l13style%";);
$if not "%gp_l13style%" == "boxes"                 $goto gpxyzlabel_l_13_style
$if  "%gp_color%" == "no"                          If(gp_count eq 13, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 13, put " lt -1";);
$label gpxyzlabel_l_13_style
$if not setglobal gp_l14style                      $goto gpxyzlabel_l_14_style
$if "%gp_l14style%"=="no"                          $goto gpxyzlabel_l_14_style
If(gp_count eq 14, put " with %gp_l14style%";);
$if not "%gp_l14style%" == "boxes"                 $goto gpxyzlabel_l_14_style
$if  "%gp_color%" == "no"                          If(gp_count eq 14, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 14, put " lt -1";);
$label gpxyzlabel_l_14_style
$if not setglobal gp_l15style                      $goto gpxyzlabel_l_15_style
$if "%gp_l15style%"=="no"                          $goto gpxyzlabel_l_15_style
If(gp_count eq 15, put " with %gp_l15style%";);
$if not "%gp_l15style%" == "boxes"                 $goto gpxyzlabel_l_15_style
$if  "%gp_color%" == "no"                          If(gp_count eq 15, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 15, put " lt -1";);
$label gpxyzlabel_l_15_style
$if not setglobal gp_l16style                      $goto gpxyzlabel_l_16_style
$if "%gp_l16style%"=="no"                          $goto gpxyzlabel_l_16_style
If(gp_count eq 16, put " with %gp_l16style%";);
$if not "%gp_l16style%" == "boxes"                 $goto gpxyzlabel_l_16_style
$if  "%gp_color%" == "no"                          If(gp_count eq 16, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 16, put " lt -1";);
$label gpxyzlabel_l_16_style
$if not setglobal gp_l17style                      $goto gpxyzlabel_l_17_style
$if "%gp_l17style%"=="no"                          $goto gpxyzlabel_l_17_style
If(gp_count eq 17, put " with %gp_l17style%";);
$if not "%gp_l17style%" == "boxes"                 $goto gpxyzlabel_l_17_style
$if  "%gp_color%" == "no"                          If(gp_count eq 17, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 17, put " lt -1";);
$label gpxyzlabel_l_17_style
$if not setglobal gp_l18style                      $goto gpxyzlabel_l_18_style
$if "%gp_l18style%"=="no"                          $goto gpxyzlabel_l_18_style
If(gp_count eq 18, put " with %gp_l18style%";);
$if not "%gp_l18style%" == "boxes"                 $goto gpxyzlabel_l_18_style
$if  "%gp_color%" == "no"                          If(gp_count eq 18, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 18, put " lt -1";);
$label gpxyzlabel_l_18_style
$if not setglobal gp_l19style                      $goto gpxyzlabel_l_19_style
$if "%gp_l19style%"=="no"                          $goto gpxyzlabel_l_19_style
If(gp_count eq 19, put " with %gp_l19style%";);
$if not "%gp_l19style%" == "boxes"                 $goto gpxyzlabel_l_19_style
$if  "%gp_color%" == "no"                          If(gp_count eq 19, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 19, put " lt -1";);
$label gpxyzlabel_l_19_style
$if not setglobal gp_l20style                      $goto gpxyzlabel_l_20_style
$if "%gp_l20style%"=="no"                          $goto gpxyzlabel_l_20_style
If(gp_count eq 20, put " with %gp_l20style%";);
$if not "%gp_l20style%" == "boxes"                 $goto gpxyzlabel_l_20_style
$if  "%gp_color%" == "no"                          If(gp_count eq 20, put " lt -1";);
$if  "%gp_color%" == "monochrome"                  If(gp_count eq 20, put " lt -1";);
$label gpxyzlabel_l_20_style
* Insert Auto Code 6 produced by make_4_linestyle.gms - end



* Insert Auto Code 7 produced by make_4_linestyle.gms - begin
If(gp_count eq 1,
$if not setglobal gp_lc_1                          $goto gpxyzlabel_after_lc_1_assign
$if "%gp_lc_1%"=="no"                              $goto gpxyzlabel_after_lc_1_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_1_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_1_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_1_normalassign
$label gpxyzlabel_after_lc_1_fixedassign
gp_xyz_ind_col("%gp_lc_1%") = yes;
$label gpxyzlabel_after_lc_1_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_1%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_1_assign
$if not setglobal gp_lw_1                          $goto gpxyzlabel_after_lw_1_assign
$if "%gp_lw_1%"=="no"                              $goto gpxyzlabel_after_lw_1_assign
put " lw %gp_lw_1%";
$goto gpxyzlabel_after_lwidth_general_assign_1
$label gpxyzlabel_after_lw_1_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_1
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_1
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_1
);

If(gp_count eq 2,
$if not setglobal gp_lc_2                          $goto gpxyzlabel_after_lc_2_assign
$if "%gp_lc_2%"=="no"                              $goto gpxyzlabel_after_lc_2_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_2_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_2_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_2_normalassign
$label gpxyzlabel_after_lc_2_fixedassign
gp_xyz_ind_col("%gp_lc_2%") = yes;
$label gpxyzlabel_after_lc_2_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_2%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_2_assign
$if not setglobal gp_lw_2                          $goto gpxyzlabel_after_lw_2_assign
$if "%gp_lw_2%"=="no"                              $goto gpxyzlabel_after_lw_2_assign
put " lw %gp_lw_2%";
$goto gpxyzlabel_after_lwidth_general_assign_2
$label gpxyzlabel_after_lw_2_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_2
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_2
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_2
);

If(gp_count eq 3,
$if not setglobal gp_lc_3                          $goto gpxyzlabel_after_lc_3_assign
$if "%gp_lc_3%"=="no"                              $goto gpxyzlabel_after_lc_3_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_3_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_3_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_3_normalassign
$label gpxyzlabel_after_lc_3_fixedassign
gp_xyz_ind_col("%gp_lc_3%") = yes;
$label gpxyzlabel_after_lc_3_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_3%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_3_assign
$if not setglobal gp_lw_3                          $goto gpxyzlabel_after_lw_3_assign
$if "%gp_lw_3%"=="no"                              $goto gpxyzlabel_after_lw_3_assign
put " lw %gp_lw_3%";
$goto gpxyzlabel_after_lwidth_general_assign_3
$label gpxyzlabel_after_lw_3_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_3
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_3
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_3
);

If(gp_count eq 4,
$if not setglobal gp_lc_4                          $goto gpxyzlabel_after_lc_4_assign
$if "%gp_lc_4%"=="no"                              $goto gpxyzlabel_after_lc_4_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_4_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_4_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_4_normalassign
$label gpxyzlabel_after_lc_4_fixedassign
gp_xyz_ind_col("%gp_lc_4%") = yes;
$label gpxyzlabel_after_lc_4_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_4%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_4_assign
$if not setglobal gp_lw_4                          $goto gpxyzlabel_after_lw_4_assign
$if "%gp_lw_4%"=="no"                              $goto gpxyzlabel_after_lw_4_assign
put " lw %gp_lw_4%";
$goto gpxyzlabel_after_lwidth_general_assign_4
$label gpxyzlabel_after_lw_4_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_4
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_4
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_4
);

If(gp_count eq 5,
$if not setglobal gp_lc_5                          $goto gpxyzlabel_after_lc_5_assign
$if "%gp_lc_5%"=="no"                              $goto gpxyzlabel_after_lc_5_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_5_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_5_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_5_normalassign
$label gpxyzlabel_after_lc_5_fixedassign
gp_xyz_ind_col("%gp_lc_5%") = yes;
$label gpxyzlabel_after_lc_5_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_5%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_5_assign
$if not setglobal gp_lw_5                          $goto gpxyzlabel_after_lw_5_assign
$if "%gp_lw_5%"=="no"                              $goto gpxyzlabel_after_lw_5_assign
put " lw %gp_lw_5%";
$goto gpxyzlabel_after_lwidth_general_assign_5
$label gpxyzlabel_after_lw_5_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_5
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_5
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_5
);

If(gp_count eq 6,
$if not setglobal gp_lc_6                          $goto gpxyzlabel_after_lc_6_assign
$if "%gp_lc_6%"=="no"                              $goto gpxyzlabel_after_lc_6_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_6_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_6_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_6_normalassign
$label gpxyzlabel_after_lc_6_fixedassign
gp_xyz_ind_col("%gp_lc_6%") = yes;
$label gpxyzlabel_after_lc_6_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_6%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_6_assign
$if not setglobal gp_lw_6                          $goto gpxyzlabel_after_lw_6_assign
$if "%gp_lw_6%"=="no"                              $goto gpxyzlabel_after_lw_6_assign
put " lw %gp_lw_6%";
$goto gpxyzlabel_after_lwidth_general_assign_6
$label gpxyzlabel_after_lw_6_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_6
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_6
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_6
);

If(gp_count eq 7,
$if not setglobal gp_lc_7                          $goto gpxyzlabel_after_lc_7_assign
$if "%gp_lc_7%"=="no"                              $goto gpxyzlabel_after_lc_7_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_7_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_7_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_7_normalassign
$label gpxyzlabel_after_lc_7_fixedassign
gp_xyz_ind_col("%gp_lc_7%") = yes;
$label gpxyzlabel_after_lc_7_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_7%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_7_assign
$if not setglobal gp_lw_7                          $goto gpxyzlabel_after_lw_7_assign
$if "%gp_lw_7%"=="no"                              $goto gpxyzlabel_after_lw_7_assign
put " lw %gp_lw_7%";
$goto gpxyzlabel_after_lwidth_general_assign_7
$label gpxyzlabel_after_lw_7_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_7
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_7
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_7
);

If(gp_count eq 8,
$if not setglobal gp_lc_8                          $goto gpxyzlabel_after_lc_8_assign
$if "%gp_lc_8%"=="no"                              $goto gpxyzlabel_after_lc_8_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_8_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_8_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_8_normalassign
$label gpxyzlabel_after_lc_8_fixedassign
gp_xyz_ind_col("%gp_lc_8%") = yes;
$label gpxyzlabel_after_lc_8_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_8%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_8_assign
$if not setglobal gp_lw_8                          $goto gpxyzlabel_after_lw_8_assign
$if "%gp_lw_8%"=="no"                              $goto gpxyzlabel_after_lw_8_assign
put " lw %gp_lw_8%";
$goto gpxyzlabel_after_lwidth_general_assign_8
$label gpxyzlabel_after_lw_8_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_8
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_8
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_8
);

If(gp_count eq 9,
$if not setglobal gp_lc_9                          $goto gpxyzlabel_after_lc_9_assign
$if "%gp_lc_9%"=="no"                              $goto gpxyzlabel_after_lc_9_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_9_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_9_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_9_normalassign
$label gpxyzlabel_after_lc_9_fixedassign
gp_xyz_ind_col("%gp_lc_9%") = yes;
$label gpxyzlabel_after_lc_9_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_9%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_9_assign
$if not setglobal gp_lw_9                          $goto gpxyzlabel_after_lw_9_assign
$if "%gp_lw_9%"=="no"                              $goto gpxyzlabel_after_lw_9_assign
put " lw %gp_lw_9%";
$goto gpxyzlabel_after_lwidth_general_assign_9
$label gpxyzlabel_after_lw_9_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_9
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_9
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_9
);

If(gp_count eq 10,
$if not setglobal gp_lc_10                         $goto gpxyzlabel_after_lc_10_assign
$if "%gp_lc_10%"=="no"                             $goto gpxyzlabel_after_lc_10_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_10_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_10_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_10_normalassign
$label gpxyzlabel_after_lc_10_fixedassign
gp_xyz_ind_col("%gp_lc_10%") = yes;
$label gpxyzlabel_after_lc_10_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_10%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_10_assign
$if not setglobal gp_lw_10                         $goto gpxyzlabel_after_lw_10_assign
$if "%gp_lw_10%"=="no"                             $goto gpxyzlabel_after_lw_10_assign
put " lw %gp_lw_10%";
$goto gpxyzlabel_after_lwidth_general_assign_10
$label gpxyzlabel_after_lw_10_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_10
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_10
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_10
);

If(gp_count eq 11,
$if not setglobal gp_lc_11                         $goto gpxyzlabel_after_lc_11_assign
$if "%gp_lc_11%"=="no"                             $goto gpxyzlabel_after_lc_11_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_11_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_11_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_11_normalassign
$label gpxyzlabel_after_lc_11_fixedassign
gp_xyz_ind_col("%gp_lc_11%") = yes;
$label gpxyzlabel_after_lc_11_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_11%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_11_assign
$if not setglobal gp_lw_11                         $goto gpxyzlabel_after_lw_11_assign
$if "%gp_lw_11%"=="no"                             $goto gpxyzlabel_after_lw_11_assign
put " lw %gp_lw_11%";
$goto gpxyzlabel_after_lwidth_general_assign_11
$label gpxyzlabel_after_lw_11_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_11
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_11
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_11
);

If(gp_count eq 12,
$if not setglobal gp_lc_12                         $goto gpxyzlabel_after_lc_12_assign
$if "%gp_lc_12%"=="no"                             $goto gpxyzlabel_after_lc_12_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_12_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_12_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_12_normalassign
$label gpxyzlabel_after_lc_12_fixedassign
gp_xyz_ind_col("%gp_lc_12%") = yes;
$label gpxyzlabel_after_lc_12_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_12%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_12_assign
$if not setglobal gp_lw_12                         $goto gpxyzlabel_after_lw_12_assign
$if "%gp_lw_12%"=="no"                             $goto gpxyzlabel_after_lw_12_assign
put " lw %gp_lw_12%";
$goto gpxyzlabel_after_lwidth_general_assign_12
$label gpxyzlabel_after_lw_12_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_12
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_12
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_12
);

If(gp_count eq 13,
$if not setglobal gp_lc_13                         $goto gpxyzlabel_after_lc_13_assign
$if "%gp_lc_13%"=="no"                             $goto gpxyzlabel_after_lc_13_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_13_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_13_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_13_normalassign
$label gpxyzlabel_after_lc_13_fixedassign
gp_xyz_ind_col("%gp_lc_13%") = yes;
$label gpxyzlabel_after_lc_13_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_13%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_13_assign
$if not setglobal gp_lw_13                         $goto gpxyzlabel_after_lw_13_assign
$if "%gp_lw_13%"=="no"                             $goto gpxyzlabel_after_lw_13_assign
put " lw %gp_lw_13%";
$goto gpxyzlabel_after_lwidth_general_assign_13
$label gpxyzlabel_after_lw_13_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_13
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_13
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_13
);

If(gp_count eq 14,
$if not setglobal gp_lc_14                         $goto gpxyzlabel_after_lc_14_assign
$if "%gp_lc_14%"=="no"                             $goto gpxyzlabel_after_lc_14_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_14_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_14_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_14_normalassign
$label gpxyzlabel_after_lc_14_fixedassign
gp_xyz_ind_col("%gp_lc_14%") = yes;
$label gpxyzlabel_after_lc_14_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_14%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_14_assign
$if not setglobal gp_lw_14                         $goto gpxyzlabel_after_lw_14_assign
$if "%gp_lw_14%"=="no"                             $goto gpxyzlabel_after_lw_14_assign
put " lw %gp_lw_14%";
$goto gpxyzlabel_after_lwidth_general_assign_14
$label gpxyzlabel_after_lw_14_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_14
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_14
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_14
);

If(gp_count eq 15,
$if not setglobal gp_lc_15                         $goto gpxyzlabel_after_lc_15_assign
$if "%gp_lc_15%"=="no"                             $goto gpxyzlabel_after_lc_15_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_15_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_15_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_15_normalassign
$label gpxyzlabel_after_lc_15_fixedassign
gp_xyz_ind_col("%gp_lc_15%") = yes;
$label gpxyzlabel_after_lc_15_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_15%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_15_assign
$if not setglobal gp_lw_15                         $goto gpxyzlabel_after_lw_15_assign
$if "%gp_lw_15%"=="no"                             $goto gpxyzlabel_after_lw_15_assign
put " lw %gp_lw_15%";
$goto gpxyzlabel_after_lwidth_general_assign_15
$label gpxyzlabel_after_lw_15_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_15
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_15
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_15
);

If(gp_count eq 16,
$if not setglobal gp_lc_16                         $goto gpxyzlabel_after_lc_16_assign
$if "%gp_lc_16%"=="no"                             $goto gpxyzlabel_after_lc_16_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_16_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_16_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_16_normalassign
$label gpxyzlabel_after_lc_16_fixedassign
gp_xyz_ind_col("%gp_lc_16%") = yes;
$label gpxyzlabel_after_lc_16_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_16%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_16_assign
$if not setglobal gp_lw_16                         $goto gpxyzlabel_after_lw_16_assign
$if "%gp_lw_16%"=="no"                             $goto gpxyzlabel_after_lw_16_assign
put " lw %gp_lw_16%";
$goto gpxyzlabel_after_lwidth_general_assign_16
$label gpxyzlabel_after_lw_16_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_16
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_16
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_16
);

If(gp_count eq 17,
$if not setglobal gp_lc_17                         $goto gpxyzlabel_after_lc_17_assign
$if "%gp_lc_17%"=="no"                             $goto gpxyzlabel_after_lc_17_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_17_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_17_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_17_normalassign
$label gpxyzlabel_after_lc_17_fixedassign
gp_xyz_ind_col("%gp_lc_17%") = yes;
$label gpxyzlabel_after_lc_17_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_17%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_17_assign
$if not setglobal gp_lw_17                         $goto gpxyzlabel_after_lw_17_assign
$if "%gp_lw_17%"=="no"                             $goto gpxyzlabel_after_lw_17_assign
put " lw %gp_lw_17%";
$goto gpxyzlabel_after_lwidth_general_assign_17
$label gpxyzlabel_after_lw_17_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_17
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_17
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_17
);

If(gp_count eq 18,
$if not setglobal gp_lc_18                         $goto gpxyzlabel_after_lc_18_assign
$if "%gp_lc_18%"=="no"                             $goto gpxyzlabel_after_lc_18_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_18_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_18_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_18_normalassign
$label gpxyzlabel_after_lc_18_fixedassign
gp_xyz_ind_col("%gp_lc_18%") = yes;
$label gpxyzlabel_after_lc_18_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_18%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_18_assign
$if not setglobal gp_lw_18                         $goto gpxyzlabel_after_lw_18_assign
$if "%gp_lw_18%"=="no"                             $goto gpxyzlabel_after_lw_18_assign
put " lw %gp_lw_18%";
$goto gpxyzlabel_after_lwidth_general_assign_18
$label gpxyzlabel_after_lw_18_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_18
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_18
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_18
);

If(gp_count eq 19,
$if not setglobal gp_lc_19                         $goto gpxyzlabel_after_lc_19_assign
$if "%gp_lc_19%"=="no"                             $goto gpxyzlabel_after_lc_19_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_19_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_19_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_19_normalassign
$label gpxyzlabel_after_lc_19_fixedassign
gp_xyz_ind_col("%gp_lc_19%") = yes;
$label gpxyzlabel_after_lc_19_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_19%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_19_assign
$if not setglobal gp_lw_19                         $goto gpxyzlabel_after_lw_19_assign
$if "%gp_lw_19%"=="no"                             $goto gpxyzlabel_after_lw_19_assign
put " lw %gp_lw_19%";
$goto gpxyzlabel_after_lwidth_general_assign_19
$label gpxyzlabel_after_lw_19_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_19
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_19
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_19
);

If(gp_count eq 20,
$if not setglobal gp_lc_20                         $goto gpxyzlabel_after_lc_20_assign
$if "%gp_lc_20%"=="no"                             $goto gpxyzlabel_after_lc_20_assign
put " lc rgb ";
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_after_lc_20_fixedassign
$if "%gp_fixcolor_set%"=="no"                      $goto gpxyzlabel_after_lc_20_fixedassign
gp_xyz_ind_col(gp_hex_color_name) $gp_fixlinecolormap(gp_hex_color_name,%gp_scen%) = yes;
$goto gpxyzlabel_after_lc_20_normalassign
$label gpxyzlabel_after_lc_20_fixedassign
gp_xyz_ind_col("%gp_lc_20%") = yes;
$label gpxyzlabel_after_lc_20_normalassign
LOOP(gp_hex_color_name $ gp_xyz_ind_col(gp_hex_color_name),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"';  );
gp_xyz_ind_col("%gp_lc_20%") = no;
gp_xyz_ind_col(gp_hex_color_name) = no;
$label gpxyzlabel_after_lc_20_assign
$if not setglobal gp_lw_20                         $goto gpxyzlabel_after_lw_20_assign
$if "%gp_lw_20%"=="no"                             $goto gpxyzlabel_after_lw_20_assign
put " lw %gp_lw_20%";
$goto gpxyzlabel_after_lwidth_general_assign_20
$label gpxyzlabel_after_lw_20_assign
$if not setglobal gp_lwidth                        $goto gpxyzlabel_after_lwidth_general_assign_20
$if "%gp_lwidth%"=="no"                            $goto gpxyzlabel_after_lwidth_general_assign_20
put " lw %gp_lwidth%";
$label gpxyzlabel_after_lwidth_general_assign_20
);
* Insert Auto Code 7 produced by make_4_linestyle.gms - end

 gp_input.nw = 6;
 gp_count = gp_count + 1;
   ); put /;

$goto gpxyzlabel_write_data_file

* 1D Plots
$label gpxyzlabel_plotstatement_1dgraph

gp_count=1;

put 'plot \' / '   "gnuplot%gp_multiplot_count%.dat" index 0 using 1:2 notitle with %gp_style% '  ;

$goto  gpxyzlabel_write_data_file


* Segment 3D plots

$label gpxyzlabel_plotstatement_3dgraph

gp_count=1;
put 'splot ';

loop(%gp_planes%,
  if (gp_count gt 1, put ',';);
  gp_input.nw = 0

  put  '\'/' "gnuplot%gp_multiplot_count%.dat" index ',(gp_count-1):0:0,
        ' using 1:2:3';

  put ' title "',%gp_planes%.tl,'"';


  gp_count = gp_count + 1;

);
put /;

$goto gpxyzlabel_write_data_file


* Segment Spiderplot
$label gpxyzlabel_plotstatement_spiderplot

*  sssss

PUT "set spiderplot" /;

* default spider options
$if not setglobal gp_fill               $setglobal gp_fill transparent solid 0.2 noborder
$if not setglobal gp_spider_tics        $setglobal gp_spider_tics axis in scale 1,0.5 nomirror norotate  autojustify norangelimit autofreq  font ",9"
$if not setglobal gp_spider_range       $setglobal gp_spider_range automax_equ
$if not setglobal gp_spider_label       $setglobal gp_spider_label   font "" textcolor lt -1 norotate

$if not setglobal gp_spiderplot_style1  $goto gpxyzlabel_after_spiderstyle_op1
$if "%gp_spiderplot_style1%" == "no"    $goto gpxyzlabel_after_spiderstyle_op1
PUT "set style spiderplot %gp_spiderplot_style1%" /;
$label gpxyzlabel_after_spiderstyle_op1

$if not setglobal gp_spiderplot_style2  $goto gpxyzlabel_after_spiderstyle_op2
$if "%gp_spiderplot_style2%" == "no"    $goto gpxyzlabel_after_spiderstyle_op2
PUT "set style spiderplot %gp_spiderplot_style2%" /;
$label gpxyzlabel_after_spiderstyle_op2

$if not setglobal gp_spiderplot_style3  $goto gpxyzlabel_after_spiderstyle_op3
$if "%gp_spiderplot_style3%" == "no"    $goto gpxyzlabel_after_spiderstyle_op3
PUT "set style spiderplot %gp_spiderplot_style3%" /;
$label gpxyzlabel_after_spiderstyle_op3


* set paxis <axisno> label <label-options> is relevant to spiderplots but ignored otherwise
gp_input.nw = 0;
gp_input.nd = 0;
gp_count=0;

loop(%gp_obsv_1%,
 gp_count=gp_count+1;

 PUT 'set paxis ',gp_count,' label "',%gp_obsv_1%.Tl,'" %gp_spider_label%' /;
 PUT 'set paxis ',gp_count,' tics %gp_spider_tics%' /;

    );

gp_count = 1;
* Write array to gnuplot.inp
Loop(%gp_scen%,
  Put "array Array",gp_count,"[",card(%gp_obsv_1%),"] = ["; gp_count=gp_count+1; gp_count_2 = 1;
  LOOP(%gp_obsv_1%, Put %1(%gp_scen%,%gp_obsv_1%); If(gp_count_2 lt card(%gp_obsv_1%), put ",";);
   gp_count_2=gp_count_2+1; ); PUT "]" /; );

* Write plot statement

$if not setglobal gp_key                         $setglobal gp_key top right

$if not setglobal gp_key_style                   $setglobal gp_key_style  spiderplot
$if "%gp_key_style%" == "no"                     $setglobal gp_key_style  spiderplot

$if "%gp_key_style%" == "boxes"                  $setglobal gp_key_color_adjective  fc
$if "%gp_key_style%" == "spiderplot"             $setglobal gp_key_color_adjective  lc
$if not setglobal  gp_key_color_adjective        $setglobal gp_key_color_adjective  lc


* Insert Auto Code Spider produced by make_345678_linestyle.gms - begin

$if not setglobal gp_spider_range             $setglobal gp_spider_range automax_ijk
$if not "%gp_spider_range%" == "automax_ijk"  $goto gpxyzlabel_after_spider_automax_ijk

gp_count=0;
LOOP(%gp_obsv_1%,
gp_count=gp_count+1;
IF(gp_count=1,
$if not setglobal gp_paxis_max_1 PUT "set paxis 1 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_1%" == "no"   PUT "set paxis 1 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=2,
$if not setglobal gp_paxis_max_2 PUT "set paxis 2 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_2%" == "no"   PUT "set paxis 2 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=3,
$if not setglobal gp_paxis_max_3 PUT "set paxis 3 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_3%" == "no"   PUT "set paxis 3 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=4,
$if not setglobal gp_paxis_max_4 PUT "set paxis 4 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_4%" == "no"   PUT "set paxis 4 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=5,
$if not setglobal gp_paxis_max_5 PUT "set paxis 5 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_5%" == "no"   PUT "set paxis 5 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=6,
$if not setglobal gp_paxis_max_6 PUT "set paxis 6 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_6%" == "no"   PUT "set paxis 6 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=7,
$if not setglobal gp_paxis_max_7 PUT "set paxis 7 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_7%" == "no"   PUT "set paxis 7 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=8,
$if not setglobal gp_paxis_max_8 PUT "set paxis 8 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_8%" == "no"   PUT "set paxis 8 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
IF(gp_count=9,
$if not setglobal gp_paxis_max_9 PUT "set paxis 9 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
$if "%gp_paxis_max_9%" == "no"   PUT "set paxis 9 range [0:", (10*ceil(gp_spider_max(%gp_obsv_1%)/10))," ]"/;
);
);

$goto gpxyzlabel_after_spider_range_assign

$label gpxyzlabel_after_spider_automax_ijk
$if not "%gp_spider_range%" == "automax_equ"  $goto gpxyzlabel_after_spider_automax_equ

gp_count=0;
LOOP(%gp_obsv_1%,
gp_count=gp_count+1;
IF(gp_count=1,
$if not setglobal gp_paxis_max_1 PUT "set paxis 1 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_1%" == "no"   PUT "set paxis 1 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=2,
$if not setglobal gp_paxis_max_2 PUT "set paxis 2 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_2%" == "no"   PUT "set paxis 2 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=3,
$if not setglobal gp_paxis_max_3 PUT "set paxis 3 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_3%" == "no"   PUT "set paxis 3 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=4,
$if not setglobal gp_paxis_max_4 PUT "set paxis 4 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_4%" == "no"   PUT "set paxis 4 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=5,
$if not setglobal gp_paxis_max_5 PUT "set paxis 5 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_5%" == "no"   PUT "set paxis 5 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=6,
$if not setglobal gp_paxis_max_6 PUT "set paxis 6 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_6%" == "no"   PUT "set paxis 6 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=7,
$if not setglobal gp_paxis_max_7 PUT "set paxis 7 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_7%" == "no"   PUT "set paxis 7 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=8,
$if not setglobal gp_paxis_max_8 PUT "set paxis 8 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_8%" == "no"   PUT "set paxis 8 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
IF(gp_count=9,
$if not setglobal gp_paxis_max_9 PUT "set paxis 9 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
$if "%gp_paxis_max_9%" == "no"   PUT "set paxis 9 range [0:", (10*ceil(gp_ymax)/10)," ]"/;
);
);

$goto gpxyzlabel_after_spider_range_assign

$label gpxyzlabel_after_spider_automax_equ

gp_count=0;
LOOP(%gp_obsv_1%,
gp_count=gp_count+1;
IF(gp_count=1,
$if not setglobal gp_paxis_max_1 PUT "set paxis 1 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_1%" == "no"   PUT "set paxis 1 range [0:%gp_spider_range%]"/;
);
IF(gp_count=2,
$if not setglobal gp_paxis_max_2 PUT "set paxis 2 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_2%" == "no"   PUT "set paxis 2 range [0:%gp_spider_range%]"/;
);
IF(gp_count=3,
$if not setglobal gp_paxis_max_3 PUT "set paxis 3 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_3%" == "no"   PUT "set paxis 3 range [0:%gp_spider_range%]"/;
);
IF(gp_count=4,
$if not setglobal gp_paxis_max_4 PUT "set paxis 4 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_4%" == "no"   PUT "set paxis 4 range [0:%gp_spider_range%]"/;
);
IF(gp_count=5,
$if not setglobal gp_paxis_max_5 PUT "set paxis 5 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_5%" == "no"   PUT "set paxis 5 range [0:%gp_spider_range%]"/;
);
IF(gp_count=6,
$if not setglobal gp_paxis_max_6 PUT "set paxis 6 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_6%" == "no"   PUT "set paxis 6 range [0:%gp_spider_range%]"/;
);
IF(gp_count=7,
$if not setglobal gp_paxis_max_7 PUT "set paxis 7 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_7%" == "no"   PUT "set paxis 7 range [0:%gp_spider_range%]"/;
);
IF(gp_count=8,
$if not setglobal gp_paxis_max_8 PUT "set paxis 8 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_8%" == "no"   PUT "set paxis 8 range [0:%gp_spider_range%]"/;
);
IF(gp_count=9,
$if not setglobal gp_paxis_max_9 PUT "set paxis 9 range [0:%gp_spider_range%]"/;
$if "%gp_paxis_max_9%" == "no"   PUT "set paxis 9 range [0:%gp_spider_range%]"/;
);
);

$label gpxyzlabel_after_spider_range_assign

$if not setglobal gp_lw_1      $setglobal gp_lw_1  %gp_lwidth%
$if not setglobal gp_lw_2      $setglobal gp_lw_2  %gp_lwidth%
$if not setglobal gp_lw_3      $setglobal gp_lw_3  %gp_lwidth%
$if not setglobal gp_lw_4      $setglobal gp_lw_4  %gp_lwidth%
$if not setglobal gp_lw_5      $setglobal gp_lw_5  %gp_lwidth%
$if not setglobal gp_lw_6      $setglobal gp_lw_6  %gp_lwidth%
$if not setglobal gp_lw_7      $setglobal gp_lw_7  %gp_lwidth%
$if not setglobal gp_lw_8      $setglobal gp_lw_8  %gp_lwidth%
$if not setglobal gp_lw_9      $setglobal gp_lw_9  %gp_lwidth%


gp_count = 0;
LOOP(%gp_scen%,
 gp_count=gp_count+1;
 IF(gp_count eq 1, PUT "plot "; ELSE PUT " newspiderplot , "; );

$if "%gp_key%" == "no"     $goto gpxyzlabel_after_spider_legend

IF(gp_count eq 1,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_1                          $goto gpxyzlabel_after_lc_1_spiderkey
$if     "%gp_lc_1%" == "no"                        $goto gpxyzlabel_after_lc_1_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_1%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_1%") = no;
$label gpxyzlabel_after_lc_1_spiderkey
   PUT " lw %gp_lw_1% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 2,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_2                          $goto gpxyzlabel_after_lc_2_spiderkey
$if     "%gp_lc_2%" == "no"                        $goto gpxyzlabel_after_lc_2_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_2%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_2%") = no;
$label gpxyzlabel_after_lc_2_spiderkey
   PUT " lw %gp_lw_2% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 3,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_3                          $goto gpxyzlabel_after_lc_3_spiderkey
$if     "%gp_lc_3%" == "no"                        $goto gpxyzlabel_after_lc_3_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_3%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_3%") = no;
$label gpxyzlabel_after_lc_3_spiderkey
   PUT " lw %gp_lw_3% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 4,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_4                          $goto gpxyzlabel_after_lc_4_spiderkey
$if     "%gp_lc_4%" == "no"                        $goto gpxyzlabel_after_lc_4_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_4%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_4%") = no;
$label gpxyzlabel_after_lc_4_spiderkey
   PUT " lw %gp_lw_4% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 5,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_5                          $goto gpxyzlabel_after_lc_5_spiderkey
$if     "%gp_lc_5%" == "no"                        $goto gpxyzlabel_after_lc_5_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_5%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_5%") = no;
$label gpxyzlabel_after_lc_5_spiderkey
   PUT " lw %gp_lw_5% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 6,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_6                          $goto gpxyzlabel_after_lc_6_spiderkey
$if     "%gp_lc_6%" == "no"                        $goto gpxyzlabel_after_lc_6_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_6%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_6%") = no;
$label gpxyzlabel_after_lc_6_spiderkey
   PUT " lw %gp_lw_6% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 7,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_7                          $goto gpxyzlabel_after_lc_7_spiderkey
$if     "%gp_lc_7%" == "no"                        $goto gpxyzlabel_after_lc_7_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_7%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_7%") = no;
$label gpxyzlabel_after_lc_7_spiderkey
   PUT " lw %gp_lw_7% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 8,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_8                          $goto gpxyzlabel_after_lc_8_spiderkey
$if     "%gp_lc_8%" == "no"                        $goto gpxyzlabel_after_lc_8_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_8%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_8%") = no;
$label gpxyzlabel_after_lc_8_spiderkey
   PUT " lw %gp_lw_8% title ",'"',%gp_scen%.tl,'"'; );

IF(gp_count eq 9,
  PUT "keyentry with %gp_key_style%";
$if not setglobal gp_lc_9                          $goto gpxyzlabel_after_lc_9_spiderkey
$if     "%gp_lc_9%" == "no"                        $goto gpxyzlabel_after_lc_9_spiderkey
PUT " %gp_key_color_adjective% rgb ";
gp_xyz_ind_col("%gp_lc_9%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_9%") = no;
$label gpxyzlabel_after_lc_9_spiderkey
   PUT " lw %gp_lw_9% title ",'"',%gp_scen%.tl,'"'; );


PUT " , ";

$label gpxyzlabel_after_spider_legend

IF(gp_count eq 1,
  PUT " for [i=1:|Array1|] Array1 using (Array1[i])";
$if not setglobal gp_lc_1                          $goto gpxyzlabel_after_lc_1_spiderplot
$if     "%gp_lc_1%" == "no"                        $goto gpxyzlabel_after_lc_1_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_1%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_1%") = no;
$label gpxyzlabel_after_lc_1_spiderplot
   PUT " lw %gp_lw_1%"; );

IF(gp_count eq 2,
  PUT " for [j=1:|Array2|] Array2 using (Array2[j])";
$if not setglobal gp_lc_2                          $goto gpxyzlabel_after_lc_2_spiderplot
$if     "%gp_lc_2%" == "no"                        $goto gpxyzlabel_after_lc_2_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_2%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_2%") = no;
$label gpxyzlabel_after_lc_2_spiderplot
   PUT " lw %gp_lw_2%"; );

IF(gp_count eq 3,
  PUT " for [k=1:|Array3|] Array3 using (Array3[k])";
$if not setglobal gp_lc_3                          $goto gpxyzlabel_after_lc_3_spiderplot
$if     "%gp_lc_3%" == "no"                        $goto gpxyzlabel_after_lc_3_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_3%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_3%") = no;
$label gpxyzlabel_after_lc_3_spiderplot
   PUT " lw %gp_lw_3%"; );

IF(gp_count eq 4,
  PUT " for [l=1:|Array4|] Array4 using (Array4[l])";
$if not setglobal gp_lc_4                          $goto gpxyzlabel_after_lc_4_spiderplot
$if     "%gp_lc_4%" == "no"                        $goto gpxyzlabel_after_lc_4_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_4%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_4%") = no;
$label gpxyzlabel_after_lc_4_spiderplot
   PUT " lw %gp_lw_4%"; );

IF(gp_count eq 5,
  PUT " for [m=1:|Array5|] Array5 using (Array5[m])";
$if not setglobal gp_lc_5                          $goto gpxyzlabel_after_lc_5_spiderplot
$if     "%gp_lc_5%" == "no"                        $goto gpxyzlabel_after_lc_5_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_5%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_5%") = no;
$label gpxyzlabel_after_lc_5_spiderplot
   PUT " lw %gp_lw_5%"; );

IF(gp_count eq 6,
  PUT " for [n=1:|Array6|] Array6 using (Array6[n])";
$if not setglobal gp_lc_6                          $goto gpxyzlabel_after_lc_6_spiderplot
$if     "%gp_lc_6%" == "no"                        $goto gpxyzlabel_after_lc_6_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_6%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_6%") = no;
$label gpxyzlabel_after_lc_6_spiderplot
   PUT " lw %gp_lw_6%"; );

IF(gp_count eq 7,
  PUT " for [o=1:|Array7|] Array7 using (Array7[o])";
$if not setglobal gp_lc_7                          $goto gpxyzlabel_after_lc_7_spiderplot
$if     "%gp_lc_7%" == "no"                        $goto gpxyzlabel_after_lc_7_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_7%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_7%") = no;
$label gpxyzlabel_after_lc_7_spiderplot
   PUT " lw %gp_lw_7%"; );

IF(gp_count eq 8,
  PUT " for [p=1:|Array8|] Array8 using (Array8[p])";
$if not setglobal gp_lc_8                          $goto gpxyzlabel_after_lc_8_spiderplot
$if     "%gp_lc_8%" == "no"                        $goto gpxyzlabel_after_lc_8_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_8%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_8%") = no;
$label gpxyzlabel_after_lc_8_spiderplot
   PUT " lw %gp_lw_8%"; );

IF(gp_count eq 9,
  PUT " for [q=1:|Array9|] Array9 using (Array9[q])";
$if not setglobal gp_lc_9                          $goto gpxyzlabel_after_lc_9_spiderplot
$if     "%gp_lc_9%" == "no"                        $goto gpxyzlabel_after_lc_9_spiderplot
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_9%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_9%") = no;
$label gpxyzlabel_after_lc_9_spiderplot
   PUT " lw %gp_lw_9%"; );


IF(gp_count gt 1, PUT " notitle";  );
IF(gp_count lt card(%gp_scen%), put " ,";  );

 );


$goto gpxyzlabel_write_data_file
* Insert Auto Code Spider produced by make_345678_linestyle.gms - end











* Segment Normal Histogram Plot
$label gpxyzlabel_plotstatement_histogram

gp_count=1;

put 'plot ';

loop(%gp_scen%,
  gp_input.nw = 0;
  gp_input.nd = 0;

  if (gp_count gt 1, put ',';);
  if (gp_count eq 1, put " 'gnuplot%gp_multiplot_count%.dat' using "; else put " '' u ";);
  put (gp_count+1);

$if not "%gp_hist%" == "columnstacked"             if(gp_count eq 1, put ':xtic(1)';);
$if     "%gp_hist%" == "columnstacked"             if(gp_count eq 1, put ':key(1)';);

* Insert Auto Code 7a produced by make_345678_linestyle.gms - begin
$if not setglobal gp_x1y1                          $goto gpxyzlabel_afterx1y1_hist
$if "%gp_x1y1%" == "no"                            $goto gpxyzlabel_afterx1y1_hist
gpxyz_stoppvalue = 0;
gpxyzset_one("%gp_x1y1%") = yes;
gpxyzset_two("%gp_x1y1%")= yes;
$if declared %gp_x1y1%                             gpxyzset_one(%gp_x1y1%) = yes;
$if declared %gp_x1y1%                             gpxyzset_two(%gp_x1y1%)= yes;
LOOP(gpxyzset_one $ SAMEAS(gpxyzset_one,%gp_scen%),
PUT " axes x1y1 ";
gpxyz_stoppvalue = 1; );
gpxyzset_one("%gp_x1y1%") = no;
gpxyzset_two("%gp_x1y1%")= no;
$if declared %gp_x1y1%                             gpxyzset_one(%gp_x1y1%) = no;
$if declared %gp_x1y1%                             gpxyzset_two(%gp_x1y1%)= no;
$label gpxyzlabel_afterx1y1_hist

$if not setglobal gp_x1y2                          $goto gpxyzlabel_afterx1y2_hist
$if "%gp_x1y2%" == "no"                            $goto gpxyzlabel_afterx1y2_hist
gpxyz_stoppvalue = 0;
gpxyzset_one("%gp_x1y2%") = yes;
gpxyzset_two("%gp_x1y2%")= yes;
$if declared %gp_x1y2%                             gpxyzset_one(%gp_x1y2%) = yes;
$if declared %gp_x1y2%                             gpxyzset_two(%gp_x1y2%)= yes;
LOOP(gpxyzset_one $ SAMEAS(gpxyzset_one,%gp_scen%),
PUT " axes x1y2 ";
gpxyz_stoppvalue = 1; );
gpxyzset_one("%gp_x1y2%") = no;
gpxyzset_two("%gp_x1y2%")= no;
$if declared %gp_x1y2%                             gpxyzset_one(%gp_x1y2%) = no;
$if declared %gp_x1y2%                             gpxyzset_two(%gp_x1y2%)= no;
$label gpxyzlabel_afterx1y2_hist

$if not setglobal gp_x2y1                          $goto gpxyzlabel_afterx2y1_hist
$if "%gp_x2y1%" == "no"                            $goto gpxyzlabel_afterx2y1_hist
gpxyz_stoppvalue = 0;
gpxyzset_one("%gp_x2y1%") = yes;
gpxyzset_two("%gp_x2y1%")= yes;
$if declared %gp_x2y1%                             gpxyzset_one(%gp_x2y1%) = yes;
$if declared %gp_x2y1%                             gpxyzset_two(%gp_x2y1%)= yes;
LOOP(gpxyzset_one $ SAMEAS(gpxyzset_one,%gp_scen%),
PUT " axes x2y1 ";
gpxyz_stoppvalue = 1; );
gpxyzset_one("%gp_x2y1%") = no;
gpxyzset_two("%gp_x2y1%")= no;
$if declared %gp_x2y1%                             gpxyzset_one(%gp_x2y1%) = no;
$if declared %gp_x2y1%                             gpxyzset_two(%gp_x2y1%)= no;
$label gpxyzlabel_afterx2y1_hist

$if not setglobal gp_x2y2                          $goto gpxyzlabel_afterx2y2_hist
$if "%gp_x2y2%" == "no"                            $goto gpxyzlabel_afterx2y2_hist
gpxyz_stoppvalue = 0;
gpxyzset_one("%gp_x2y2%") = yes;
gpxyzset_two("%gp_x2y2%")= yes;
$if declared %gp_x2y2%                             gpxyzset_one(%gp_x2y2%) = yes;
$if declared %gp_x2y2%                             gpxyzset_two(%gp_x2y2%)= yes;
LOOP(gpxyzset_one $ SAMEAS(gpxyzset_one,%gp_scen%),
PUT " axes x2y2 ";
gpxyz_stoppvalue = 1; );
gpxyzset_one("%gp_x2y2%") = no;
gpxyzset_two("%gp_x2y2%")= no;
$if declared %gp_x2y2%                             gpxyzset_one(%gp_x2y2%) = no;
$if declared %gp_x2y2%                             gpxyzset_two(%gp_x2y2%)= no;
$label gpxyzlabel_afterx2y2_hist
* Insert Auto Code 7a produced by make_345678_linestyle.gms - end


* Insert Auto Code 7b produced by make_345678_linestyle.gms - begin
IF(gp_count eq 1,
$if not setglobal gp_axes_l1                       $goto gpxyzlabel_after_axes_1_hist
$if "%gp_axes_l1%" == "no"                         $goto gpxyzlabel_after_axes_1_hist
PUT " axes %gp_axes_l1% ";
$label gpxyzlabel_after_axes_1_hist
);
IF(gp_count eq 2,
$if not setglobal gp_axes_l2                       $goto gpxyzlabel_after_axes_2_hist
$if "%gp_axes_l2%" == "no"                         $goto gpxyzlabel_after_axes_2_hist
PUT " axes %gp_axes_l2% ";
$label gpxyzlabel_after_axes_2_hist
);
IF(gp_count eq 3,
$if not setglobal gp_axes_l3                       $goto gpxyzlabel_after_axes_3_hist
$if "%gp_axes_l3%" == "no"                         $goto gpxyzlabel_after_axes_3_hist
PUT " axes %gp_axes_l3% ";
$label gpxyzlabel_after_axes_3_hist
);
IF(gp_count eq 4,
$if not setglobal gp_axes_l4                       $goto gpxyzlabel_after_axes_4_hist
$if "%gp_axes_l4%" == "no"                         $goto gpxyzlabel_after_axes_4_hist
PUT " axes %gp_axes_l4% ";
$label gpxyzlabel_after_axes_4_hist
);
IF(gp_count eq 5,
$if not setglobal gp_axes_l5                       $goto gpxyzlabel_after_axes_5_hist
$if "%gp_axes_l5%" == "no"                         $goto gpxyzlabel_after_axes_5_hist
PUT " axes %gp_axes_l5% ";
$label gpxyzlabel_after_axes_5_hist
);
IF(gp_count eq 6,
$if not setglobal gp_axes_l6                       $goto gpxyzlabel_after_axes_6_hist
$if "%gp_axes_l6%" == "no"                         $goto gpxyzlabel_after_axes_6_hist
PUT " axes %gp_axes_l6% ";
$label gpxyzlabel_after_axes_6_hist
);
IF(gp_count eq 7,
$if not setglobal gp_axes_l7                       $goto gpxyzlabel_after_axes_7_hist
$if "%gp_axes_l7%" == "no"                         $goto gpxyzlabel_after_axes_7_hist
PUT " axes %gp_axes_l7% ";
$label gpxyzlabel_after_axes_7_hist
);
IF(gp_count eq 8,
$if not setglobal gp_axes_l8                       $goto gpxyzlabel_after_axes_8_hist
$if "%gp_axes_l8%" == "no"                         $goto gpxyzlabel_after_axes_8_hist
PUT " axes %gp_axes_l8% ";
$label gpxyzlabel_after_axes_8_hist
);
IF(gp_count eq 9,
$if not setglobal gp_axes_l9                       $goto gpxyzlabel_after_axes_9_hist
$if "%gp_axes_l9%" == "no"                         $goto gpxyzlabel_after_axes_9_hist
PUT " axes %gp_axes_l9% ";
$label gpxyzlabel_after_axes_9_hist
);
IF(gp_count eq 10,
$if not setglobal gp_axes_l10                      $goto gpxyzlabel_after_axes_10_hist
$if "%gp_axes_l10%" == "no"                        $goto gpxyzlabel_after_axes_10_hist
PUT " axes %gp_axes_l10% ";
$label gpxyzlabel_after_axes_10_hist
);
IF(gp_count eq 11,
$if not setglobal gp_axes_l11                      $goto gpxyzlabel_after_axes_11_hist
$if "%gp_axes_l11%" == "no"                        $goto gpxyzlabel_after_axes_11_hist
PUT " axes %gp_axes_l11% ";
$label gpxyzlabel_after_axes_11_hist
);
IF(gp_count eq 12,
$if not setglobal gp_axes_l12                      $goto gpxyzlabel_after_axes_12_hist
$if "%gp_axes_l12%" == "no"                        $goto gpxyzlabel_after_axes_12_hist
PUT " axes %gp_axes_l12% ";
$label gpxyzlabel_after_axes_12_hist
);
IF(gp_count eq 13,
$if not setglobal gp_axes_l13                      $goto gpxyzlabel_after_axes_13_hist
$if "%gp_axes_l13%" == "no"                        $goto gpxyzlabel_after_axes_13_hist
PUT " axes %gp_axes_l13% ";
$label gpxyzlabel_after_axes_13_hist
);
IF(gp_count eq 14,
$if not setglobal gp_axes_l14                      $goto gpxyzlabel_after_axes_14_hist
$if "%gp_axes_l14%" == "no"                        $goto gpxyzlabel_after_axes_14_hist
PUT " axes %gp_axes_l14% ";
$label gpxyzlabel_after_axes_14_hist
);
IF(gp_count eq 15,
$if not setglobal gp_axes_l15                      $goto gpxyzlabel_after_axes_15_hist
$if "%gp_axes_l15%" == "no"                        $goto gpxyzlabel_after_axes_15_hist
PUT " axes %gp_axes_l15% ";
$label gpxyzlabel_after_axes_15_hist
);
IF(gp_count eq 16,
$if not setglobal gp_axes_l16                      $goto gpxyzlabel_after_axes_16_hist
$if "%gp_axes_l16%" == "no"                        $goto gpxyzlabel_after_axes_16_hist
PUT " axes %gp_axes_l16% ";
$label gpxyzlabel_after_axes_16_hist
);
IF(gp_count eq 17,
$if not setglobal gp_axes_l17                      $goto gpxyzlabel_after_axes_17_hist
$if "%gp_axes_l17%" == "no"                        $goto gpxyzlabel_after_axes_17_hist
PUT " axes %gp_axes_l17% ";
$label gpxyzlabel_after_axes_17_hist
);
IF(gp_count eq 18,
$if not setglobal gp_axes_l18                      $goto gpxyzlabel_after_axes_18_hist
$if "%gp_axes_l18%" == "no"                        $goto gpxyzlabel_after_axes_18_hist
PUT " axes %gp_axes_l18% ";
$label gpxyzlabel_after_axes_18_hist
);
IF(gp_count eq 19,
$if not setglobal gp_axes_l19                      $goto gpxyzlabel_after_axes_19_hist
$if "%gp_axes_l19%" == "no"                        $goto gpxyzlabel_after_axes_19_hist
PUT " axes %gp_axes_l19% ";
$label gpxyzlabel_after_axes_19_hist
);
IF(gp_count eq 20,
$if not setglobal gp_axes_l20                      $goto gpxyzlabel_after_axes_20_hist
$if "%gp_axes_l20%" == "no"                        $goto gpxyzlabel_after_axes_20_hist
PUT " axes %gp_axes_l20% ";
$label gpxyzlabel_after_axes_20_hist
);
* Insert Auto Code 7b produced by make_345678_linestyle.gms - end

  put ' ti col';


* Insert Auto Code 8 produced by make_4_linestyle.gms - begin
IF(gp_count eq 1,
$if not setglobal gp_lc_1                          $goto gpxyzlabel_after_lc_1_hist
$if     "%gp_lc_1%" == "no"                        $goto gpxyzlabel_after_lc_1_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_1%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_1%") = no;
$label gpxyzlabel_after_lc_1_hist
 );
IF(gp_count eq 2,
$if not setglobal gp_lc_2                          $goto gpxyzlabel_after_lc_2_hist
$if     "%gp_lc_2%" == "no"                        $goto gpxyzlabel_after_lc_2_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_2%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_2%") = no;
$label gpxyzlabel_after_lc_2_hist
 );
IF(gp_count eq 3,
$if not setglobal gp_lc_3                          $goto gpxyzlabel_after_lc_3_hist
$if     "%gp_lc_3%" == "no"                        $goto gpxyzlabel_after_lc_3_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_3%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_3%") = no;
$label gpxyzlabel_after_lc_3_hist
 );
IF(gp_count eq 4,
$if not setglobal gp_lc_4                          $goto gpxyzlabel_after_lc_4_hist
$if     "%gp_lc_4%" == "no"                        $goto gpxyzlabel_after_lc_4_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_4%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_4%") = no;
$label gpxyzlabel_after_lc_4_hist
 );
IF(gp_count eq 5,
$if not setglobal gp_lc_5                          $goto gpxyzlabel_after_lc_5_hist
$if     "%gp_lc_5%" == "no"                        $goto gpxyzlabel_after_lc_5_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_5%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_5%") = no;
$label gpxyzlabel_after_lc_5_hist
 );
IF(gp_count eq 6,
$if not setglobal gp_lc_6                          $goto gpxyzlabel_after_lc_6_hist
$if     "%gp_lc_6%" == "no"                        $goto gpxyzlabel_after_lc_6_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_6%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_6%") = no;
$label gpxyzlabel_after_lc_6_hist
 );
IF(gp_count eq 7,
$if not setglobal gp_lc_7                          $goto gpxyzlabel_after_lc_7_hist
$if     "%gp_lc_7%" == "no"                        $goto gpxyzlabel_after_lc_7_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_7%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_7%") = no;
$label gpxyzlabel_after_lc_7_hist
 );
IF(gp_count eq 8,
$if not setglobal gp_lc_8                          $goto gpxyzlabel_after_lc_8_hist
$if     "%gp_lc_8%" == "no"                        $goto gpxyzlabel_after_lc_8_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_8%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_8%") = no;
$label gpxyzlabel_after_lc_8_hist
 );
IF(gp_count eq 9,
$if not setglobal gp_lc_9                          $goto gpxyzlabel_after_lc_9_hist
$if     "%gp_lc_9%" == "no"                        $goto gpxyzlabel_after_lc_9_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_9%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_9%") = no;
$label gpxyzlabel_after_lc_9_hist
 );
IF(gp_count eq 10,
$if not setglobal gp_lc_10                         $goto gpxyzlabel_after_lc_10_hist
$if     "%gp_lc_10%" == "no"                       $goto gpxyzlabel_after_lc_10_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_10%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_10%") = no;
$label gpxyzlabel_after_lc_10_hist
 );
IF(gp_count eq 11,
$if not setglobal gp_lc_11                         $goto gpxyzlabel_after_lc_11_hist
$if     "%gp_lc_11%" == "no"                       $goto gpxyzlabel_after_lc_11_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_11%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_11%") = no;
$label gpxyzlabel_after_lc_11_hist
 );
IF(gp_count eq 12,
$if not setglobal gp_lc_12                         $goto gpxyzlabel_after_lc_12_hist
$if     "%gp_lc_12%" == "no"                       $goto gpxyzlabel_after_lc_12_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_12%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_12%") = no;
$label gpxyzlabel_after_lc_12_hist
 );
IF(gp_count eq 13,
$if not setglobal gp_lc_13                         $goto gpxyzlabel_after_lc_13_hist
$if     "%gp_lc_13%" == "no"                       $goto gpxyzlabel_after_lc_13_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_13%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_13%") = no;
$label gpxyzlabel_after_lc_13_hist
 );
IF(gp_count eq 14,
$if not setglobal gp_lc_14                         $goto gpxyzlabel_after_lc_14_hist
$if     "%gp_lc_14%" == "no"                       $goto gpxyzlabel_after_lc_14_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_14%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_14%") = no;
$label gpxyzlabel_after_lc_14_hist
 );
IF(gp_count eq 15,
$if not setglobal gp_lc_15                         $goto gpxyzlabel_after_lc_15_hist
$if     "%gp_lc_15%" == "no"                       $goto gpxyzlabel_after_lc_15_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_15%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_15%") = no;
$label gpxyzlabel_after_lc_15_hist
 );
IF(gp_count eq 16,
$if not setglobal gp_lc_16                         $goto gpxyzlabel_after_lc_16_hist
$if     "%gp_lc_16%" == "no"                       $goto gpxyzlabel_after_lc_16_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_16%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_16%") = no;
$label gpxyzlabel_after_lc_16_hist
 );
IF(gp_count eq 17,
$if not setglobal gp_lc_17                         $goto gpxyzlabel_after_lc_17_hist
$if     "%gp_lc_17%" == "no"                       $goto gpxyzlabel_after_lc_17_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_17%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_17%") = no;
$label gpxyzlabel_after_lc_17_hist
 );
IF(gp_count eq 18,
$if not setglobal gp_lc_18                         $goto gpxyzlabel_after_lc_18_hist
$if     "%gp_lc_18%" == "no"                       $goto gpxyzlabel_after_lc_18_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_18%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_18%") = no;
$label gpxyzlabel_after_lc_18_hist
 );
IF(gp_count eq 19,
$if not setglobal gp_lc_19                         $goto gpxyzlabel_after_lc_19_hist
$if     "%gp_lc_19%" == "no"                       $goto gpxyzlabel_after_lc_19_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_19%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_19%") = no;
$label gpxyzlabel_after_lc_19_hist
 );
IF(gp_count eq 20,
$if not setglobal gp_lc_20                         $goto gpxyzlabel_after_lc_20_hist
$if     "%gp_lc_20%" == "no"                       $goto gpxyzlabel_after_lc_20_hist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_20%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_20%") = no;
$label gpxyzlabel_after_lc_20_hist
 );
* Insert Auto Code 8 produced by make_4_linestyle.gms - end


*$if  "%gp_color%" == "monochrome"     put ' ';

  gp_count = gp_count + 1;

    );

$goto gpxyzlabel_write_data_file



* Segment New Histogram Plot
$label gpxyzlabel_plotstatement_newhistogram

*put 'set xtics (';
*gp_count_2 = 1; loop(%gp__col3%, gp_count=1; loop(%gp_scen%,
*  gp_input.nw = 0; gp_input.nd = 3; gp_input.lw=0;
*  put '"',%gp__col3%.TL,'" ',(gp_count+1+(gp_count_2-1)*card(%gp_scen%));
*  if(...., put ", "; else put ")" /;
*  gp_count = gp_count + 1; ); gp_count_2 = gp_count_2 + 1; );


** $if     "%gp_hist%" == "columnstacked" ---> need ti col everywhere


$if not setglobal gp_newhistogramgap               $setglobal gp_newhistogramgap 1
$if "%gp_newhistogramgap%" == "no"                 $setglobal gp_newhistogramgap 1

$if not setglobal gp_movenewhistogramlabels        $setglobal gp_movenewhistogramlabels 0
$if "%gp_movenewhistogramlabels%" == "no"          $setglobal gp_movenewhistogramlabels 0
$if     "%gp_hist%" == "columnstacked"             $setglobal gp_movenewhistogramlabels 0

put 'plot ';

gp_count_2 = 1;
loop(%gp__col3%,
gp_count=1;
loop(%gp_scen%,
  gp_input.nw = 0;
  gp_input.nd = 0;

  if(gp_count_2 gt 1 and gp_count eq 1, put '     ';);
  if(gp_count eq 1, put ' newhistogram ';);
$if "%gp_xlabel%"== "no" if(gp_count eq 1 and gp_count_2 eq 1, put '"',%gp__col3%.TL,'"';);
$if "%gp_xlabel%"== "no" if(gp_count eq 1 and gp_count_2 gt 1, put '"'; LOOP(gp_hun_100_set $(ord(gp_hun_100_set) le %gp_movenewhistogramlabels%),put " ";);put %gp__col3%.TL,'"';);
$if not setglobal gp_xlabel if(gp_count eq 1 and gp_count_2 eq 1, put '"',%gp__col3%.TL,'"';);
$if not setglobal gp_xlabel if(gp_count eq 1 and gp_count_2 gt 1, put '"'; LOOP(gp_hun_100_set $(ord(gp_hun_100_set) le %gp_movenewhistogramlabels%),put " ";);put %gp__col3%.TL,'"';);

$if not setglobal gp_xlabel $goto after_put_newhist_xlabel
$if "%gp_xlabel%" == "no"   $goto after_put_newhist_xlabel
  if(gp_count eq 1, put '"%gp_xlabel%"';);
$label after_put_newhist_xlabel

$if not setglobal gp_xlabeloffset                 $goto gpxyzlabel_after_newhist_xlabeloffset
$if "%gp_xlabeloffset%" == "no"                   $goto gpxyzlabel_after_newhist_xlabeloffset

if(gp_count eq 1, PUT " offset %gp_xlabeloffset% ";);

$label gpxyzlabel_after_newhist_xlabeloffset

$if not "%gp_hist%" == "columnstacked"  $goto gpxyzlabel_after_xposition
gp_input.nd = 3;
  if(gp_count eq 1, put ' lt 1 at ', ((gp_count_2-1)*card(%gp_scen%)+(gp_count_2-1)*%gp_newhistogramgap%););
gp_input.nd = 0;
$label gpxyzlabel_after_xposition

*  if(gp_count_2 gt 1 and gp_count eq 1, put ' lt 1';);
  if(gp_count gt 1, put ' ,';);
  if(gp_count eq 1, put ", 'gnuplot%gp_multiplot_count%.dat' using "; else put " '' u ";);
  put (gp_count+1+(gp_count_2-1)*card(%gp_scen%));

* new Uwe
$if not setglobal gp_nohistogram_boxlabel            $goto after_xticlabels_histogram
$if "%setglobal gp_nohistogram_boxlabel%" == "no"    $goto after_xticlabels_histogram
$if not "%gp_hist%" == "columnstacked"  if (gp_count eq 1, put ':xticlabels(1)';);
$label after_xticlabels_histogram
$if     "%gp_hist%" == "columnstacked"  if (gp_count_2 eq 1 and gp_count eq 1, put ':key(1)';);

$if not "%gp_hist%" == "columnstacked"  if(gp_count_2 eq 1, put ' ti col'; else put ' ti "" ';);
$if     "%gp_hist%" == "columnstacked"  if(gp_count_2 eq 1, put ' ti col'; else put ' ti col ';);

* Insert Auto Code 8b produced by make_345678_linestyle.gms - begin
IF(gp_count eq 1,
$if not setglobal gp_axes_l1                       $goto gpxyzlabel_after_axes_1_newhist
$if "%gp_axes_l1%" == "no"                         $goto gpxyzlabel_after_axes_1_newhist
PUT " axes %gp_axes_l1% ";
$label gpxyzlabel_after_axes_1_newhist
);
IF(gp_count eq 2,
$if not setglobal gp_axes_l2                       $goto gpxyzlabel_after_axes_2_newhist
$if "%gp_axes_l2%" == "no"                         $goto gpxyzlabel_after_axes_2_newhist
PUT " axes %gp_axes_l2% ";
$label gpxyzlabel_after_axes_2_newhist
);
IF(gp_count eq 3,
$if not setglobal gp_axes_l3                       $goto gpxyzlabel_after_axes_3_newhist
$if "%gp_axes_l3%" == "no"                         $goto gpxyzlabel_after_axes_3_newhist
PUT " axes %gp_axes_l3% ";
$label gpxyzlabel_after_axes_3_newhist
);
IF(gp_count eq 4,
$if not setglobal gp_axes_l4                       $goto gpxyzlabel_after_axes_4_newhist
$if "%gp_axes_l4%" == "no"                         $goto gpxyzlabel_after_axes_4_newhist
PUT " axes %gp_axes_l4% ";
$label gpxyzlabel_after_axes_4_newhist
);
IF(gp_count eq 5,
$if not setglobal gp_axes_l5                       $goto gpxyzlabel_after_axes_5_newhist
$if "%gp_axes_l5%" == "no"                         $goto gpxyzlabel_after_axes_5_newhist
PUT " axes %gp_axes_l5% ";
$label gpxyzlabel_after_axes_5_newhist
);
IF(gp_count eq 6,
$if not setglobal gp_axes_l6                       $goto gpxyzlabel_after_axes_6_newhist
$if "%gp_axes_l6%" == "no"                         $goto gpxyzlabel_after_axes_6_newhist
PUT " axes %gp_axes_l6% ";
$label gpxyzlabel_after_axes_6_newhist
);
IF(gp_count eq 7,
$if not setglobal gp_axes_l7                       $goto gpxyzlabel_after_axes_7_newhist
$if "%gp_axes_l7%" == "no"                         $goto gpxyzlabel_after_axes_7_newhist
PUT " axes %gp_axes_l7% ";
$label gpxyzlabel_after_axes_7_newhist
);
IF(gp_count eq 8,
$if not setglobal gp_axes_l8                       $goto gpxyzlabel_after_axes_8_newhist
$if "%gp_axes_l8%" == "no"                         $goto gpxyzlabel_after_axes_8_newhist
PUT " axes %gp_axes_l8% ";
$label gpxyzlabel_after_axes_8_newhist
);
IF(gp_count eq 9,
$if not setglobal gp_axes_l9                       $goto gpxyzlabel_after_axes_9_newhist
$if "%gp_axes_l9%" == "no"                         $goto gpxyzlabel_after_axes_9_newhist
PUT " axes %gp_axes_l9% ";
$label gpxyzlabel_after_axes_9_newhist
);
IF(gp_count eq 10,
$if not setglobal gp_axes_l10                      $goto gpxyzlabel_after_axes_10_newhist
$if "%gp_axes_l10%" == "no"                        $goto gpxyzlabel_after_axes_10_newhist
PUT " axes %gp_axes_l10% ";
$label gpxyzlabel_after_axes_10_newhist
);
IF(gp_count eq 11,
$if not setglobal gp_axes_l11                      $goto gpxyzlabel_after_axes_11_newhist
$if "%gp_axes_l11%" == "no"                        $goto gpxyzlabel_after_axes_11_newhist
PUT " axes %gp_axes_l11% ";
$label gpxyzlabel_after_axes_11_newhist
);
IF(gp_count eq 12,
$if not setglobal gp_axes_l12                      $goto gpxyzlabel_after_axes_12_newhist
$if "%gp_axes_l12%" == "no"                        $goto gpxyzlabel_after_axes_12_newhist
PUT " axes %gp_axes_l12% ";
$label gpxyzlabel_after_axes_12_newhist
);
IF(gp_count eq 13,
$if not setglobal gp_axes_l13                      $goto gpxyzlabel_after_axes_13_newhist
$if "%gp_axes_l13%" == "no"                        $goto gpxyzlabel_after_axes_13_newhist
PUT " axes %gp_axes_l13% ";
$label gpxyzlabel_after_axes_13_newhist
);
IF(gp_count eq 14,
$if not setglobal gp_axes_l14                      $goto gpxyzlabel_after_axes_14_newhist
$if "%gp_axes_l14%" == "no"                        $goto gpxyzlabel_after_axes_14_newhist
PUT " axes %gp_axes_l14% ";
$label gpxyzlabel_after_axes_14_newhist
);
IF(gp_count eq 15,
$if not setglobal gp_axes_l15                      $goto gpxyzlabel_after_axes_15_newhist
$if "%gp_axes_l15%" == "no"                        $goto gpxyzlabel_after_axes_15_newhist
PUT " axes %gp_axes_l15% ";
$label gpxyzlabel_after_axes_15_newhist
);
IF(gp_count eq 16,
$if not setglobal gp_axes_l16                      $goto gpxyzlabel_after_axes_16_newhist
$if "%gp_axes_l16%" == "no"                        $goto gpxyzlabel_after_axes_16_newhist
PUT " axes %gp_axes_l16% ";
$label gpxyzlabel_after_axes_16_newhist
);
IF(gp_count eq 17,
$if not setglobal gp_axes_l17                      $goto gpxyzlabel_after_axes_17_newhist
$if "%gp_axes_l17%" == "no"                        $goto gpxyzlabel_after_axes_17_newhist
PUT " axes %gp_axes_l17% ";
$label gpxyzlabel_after_axes_17_newhist
);
IF(gp_count eq 18,
$if not setglobal gp_axes_l18                      $goto gpxyzlabel_after_axes_18_newhist
$if "%gp_axes_l18%" == "no"                        $goto gpxyzlabel_after_axes_18_newhist
PUT " axes %gp_axes_l18% ";
$label gpxyzlabel_after_axes_18_newhist
);
IF(gp_count eq 19,
$if not setglobal gp_axes_l19                      $goto gpxyzlabel_after_axes_19_newhist
$if "%gp_axes_l19%" == "no"                        $goto gpxyzlabel_after_axes_19_newhist
PUT " axes %gp_axes_l19% ";
$label gpxyzlabel_after_axes_19_newhist
);
IF(gp_count eq 20,
$if not setglobal gp_axes_l20                      $goto gpxyzlabel_after_axes_20_newhist
$if "%gp_axes_l20%" == "no"                        $goto gpxyzlabel_after_axes_20_newhist
PUT " axes %gp_axes_l20% ";
$label gpxyzlabel_after_axes_20_newhist
);
* Insert Auto Code 8b produced by make_345678_linestyle.gms - end

$if     "%gp_hist%" == "columnstacked"  $goto gpxyzlabel_afterinserthistlinecolors

* Insert Auto Code 9 produced by make_4_linestyle.gms - begin
IF(gp_count eq 1,
$if not setglobal gp_lc_1                          IF(gp_count_2 gt 1, put " lt 1"; );
$if     "%gp_lc_1%" == "no"                        IF(gp_count_2 gt 1, put " lt 1"; );
$if not setglobal gp_lc_1                          $goto gpxyzlabel_after_lc_1_newhist
$if     "%gp_lc_1%" == "no"                        $goto gpxyzlabel_after_lc_1_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_1%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_1%") = no;
$label gpxyzlabel_after_lc_1_newhist
 );
IF(gp_count eq 2,
$if not setglobal gp_lc_2                          IF(gp_count_2 gt 1, put " lt 2"; );
$if     "%gp_lc_2%" == "no"                        IF(gp_count_2 gt 1, put " lt 2"; );
$if not setglobal gp_lc_2                          $goto gpxyzlabel_after_lc_2_newhist
$if     "%gp_lc_2%" == "no"                        $goto gpxyzlabel_after_lc_2_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_2%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_2%") = no;
$label gpxyzlabel_after_lc_2_newhist
 );
IF(gp_count eq 3,
$if not setglobal gp_lc_3                          IF(gp_count_2 gt 1, put " lt 3"; );
$if     "%gp_lc_3%" == "no"                        IF(gp_count_2 gt 1, put " lt 3"; );
$if not setglobal gp_lc_3                          $goto gpxyzlabel_after_lc_3_newhist
$if     "%gp_lc_3%" == "no"                        $goto gpxyzlabel_after_lc_3_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_3%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_3%") = no;
$label gpxyzlabel_after_lc_3_newhist
 );
IF(gp_count eq 4,
$if not setglobal gp_lc_4                          IF(gp_count_2 gt 1, put " lt 4"; );
$if     "%gp_lc_4%" == "no"                        IF(gp_count_2 gt 1, put " lt 4"; );
$if not setglobal gp_lc_4                          $goto gpxyzlabel_after_lc_4_newhist
$if     "%gp_lc_4%" == "no"                        $goto gpxyzlabel_after_lc_4_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_4%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_4%") = no;
$label gpxyzlabel_after_lc_4_newhist
 );
IF(gp_count eq 5,
$if not setglobal gp_lc_5                          IF(gp_count_2 gt 1, put " lt 5"; );
$if     "%gp_lc_5%" == "no"                        IF(gp_count_2 gt 1, put " lt 5"; );
$if not setglobal gp_lc_5                          $goto gpxyzlabel_after_lc_5_newhist
$if     "%gp_lc_5%" == "no"                        $goto gpxyzlabel_after_lc_5_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_5%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_5%") = no;
$label gpxyzlabel_after_lc_5_newhist
 );
IF(gp_count eq 6,
$if not setglobal gp_lc_6                          IF(gp_count_2 gt 1, put " lt 6"; );
$if     "%gp_lc_6%" == "no"                        IF(gp_count_2 gt 1, put " lt 6"; );
$if not setglobal gp_lc_6                          $goto gpxyzlabel_after_lc_6_newhist
$if     "%gp_lc_6%" == "no"                        $goto gpxyzlabel_after_lc_6_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_6%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_6%") = no;
$label gpxyzlabel_after_lc_6_newhist
 );
IF(gp_count eq 7,
$if not setglobal gp_lc_7                          IF(gp_count_2 gt 1, put " lt 7"; );
$if     "%gp_lc_7%" == "no"                        IF(gp_count_2 gt 1, put " lt 7"; );
$if not setglobal gp_lc_7                          $goto gpxyzlabel_after_lc_7_newhist
$if     "%gp_lc_7%" == "no"                        $goto gpxyzlabel_after_lc_7_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_7%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_7%") = no;
$label gpxyzlabel_after_lc_7_newhist
 );
IF(gp_count eq 8,
$if not setglobal gp_lc_8                          IF(gp_count_2 gt 1, put " lt 8"; );
$if     "%gp_lc_8%" == "no"                        IF(gp_count_2 gt 1, put " lt 8"; );
$if not setglobal gp_lc_8                          $goto gpxyzlabel_after_lc_8_newhist
$if     "%gp_lc_8%" == "no"                        $goto gpxyzlabel_after_lc_8_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_8%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_8%") = no;
$label gpxyzlabel_after_lc_8_newhist
 );
IF(gp_count eq 9,
$if not setglobal gp_lc_9                          IF(gp_count_2 gt 1, put " lt 9"; );
$if     "%gp_lc_9%" == "no"                        IF(gp_count_2 gt 1, put " lt 9"; );
$if not setglobal gp_lc_9                          $goto gpxyzlabel_after_lc_9_newhist
$if     "%gp_lc_9%" == "no"                        $goto gpxyzlabel_after_lc_9_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_9%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_9%") = no;
$label gpxyzlabel_after_lc_9_newhist
 );
IF(gp_count eq 10,
$if not setglobal gp_lc_10                         IF(gp_count_2 gt 1, put " lt 10"; );
$if     "%gp_lc_10%" == "no"                       IF(gp_count_2 gt 1, put " lt 10"; );
$if not setglobal gp_lc_10                         $goto gpxyzlabel_after_lc_10_newhist
$if     "%gp_lc_10%" == "no"                       $goto gpxyzlabel_after_lc_10_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_10%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_10%") = no;
$label gpxyzlabel_after_lc_10_newhist
 );
IF(gp_count eq 11,
$if not setglobal gp_lc_11                         IF(gp_count_2 gt 1, put " lt 11"; );
$if     "%gp_lc_11%" == "no"                       IF(gp_count_2 gt 1, put " lt 11"; );
$if not setglobal gp_lc_11                         $goto gpxyzlabel_after_lc_11_newhist
$if     "%gp_lc_11%" == "no"                       $goto gpxyzlabel_after_lc_11_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_11%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_11%") = no;
$label gpxyzlabel_after_lc_11_newhist
 );
IF(gp_count eq 12,
$if not setglobal gp_lc_12                         IF(gp_count_2 gt 1, put " lt 12"; );
$if     "%gp_lc_12%" == "no"                       IF(gp_count_2 gt 1, put " lt 12"; );
$if not setglobal gp_lc_12                         $goto gpxyzlabel_after_lc_12_newhist
$if     "%gp_lc_12%" == "no"                       $goto gpxyzlabel_after_lc_12_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_12%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_12%") = no;
$label gpxyzlabel_after_lc_12_newhist
 );
IF(gp_count eq 13,
$if not setglobal gp_lc_13                         IF(gp_count_2 gt 1, put " lt 13"; );
$if     "%gp_lc_13%" == "no"                       IF(gp_count_2 gt 1, put " lt 13"; );
$if not setglobal gp_lc_13                         $goto gpxyzlabel_after_lc_13_newhist
$if     "%gp_lc_13%" == "no"                       $goto gpxyzlabel_after_lc_13_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_13%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_13%") = no;
$label gpxyzlabel_after_lc_13_newhist
 );
IF(gp_count eq 14,
$if not setglobal gp_lc_14                         IF(gp_count_2 gt 1, put " lt 14"; );
$if     "%gp_lc_14%" == "no"                       IF(gp_count_2 gt 1, put " lt 14"; );
$if not setglobal gp_lc_14                         $goto gpxyzlabel_after_lc_14_newhist
$if     "%gp_lc_14%" == "no"                       $goto gpxyzlabel_after_lc_14_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_14%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_14%") = no;
$label gpxyzlabel_after_lc_14_newhist
 );
IF(gp_count eq 15,
$if not setglobal gp_lc_15                         IF(gp_count_2 gt 1, put " lt 15"; );
$if     "%gp_lc_15%" == "no"                       IF(gp_count_2 gt 1, put " lt 15"; );
$if not setglobal gp_lc_15                         $goto gpxyzlabel_after_lc_15_newhist
$if     "%gp_lc_15%" == "no"                       $goto gpxyzlabel_after_lc_15_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_15%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_15%") = no;
$label gpxyzlabel_after_lc_15_newhist
 );
IF(gp_count eq 16,
$if not setglobal gp_lc_16                         IF(gp_count_2 gt 1, put " lt 16"; );
$if     "%gp_lc_16%" == "no"                       IF(gp_count_2 gt 1, put " lt 16"; );
$if not setglobal gp_lc_16                         $goto gpxyzlabel_after_lc_16_newhist
$if     "%gp_lc_16%" == "no"                       $goto gpxyzlabel_after_lc_16_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_16%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_16%") = no;
$label gpxyzlabel_after_lc_16_newhist
 );
IF(gp_count eq 17,
$if not setglobal gp_lc_17                         IF(gp_count_2 gt 1, put " lt 17"; );
$if     "%gp_lc_17%" == "no"                       IF(gp_count_2 gt 1, put " lt 17"; );
$if not setglobal gp_lc_17                         $goto gpxyzlabel_after_lc_17_newhist
$if     "%gp_lc_17%" == "no"                       $goto gpxyzlabel_after_lc_17_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_17%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_17%") = no;
$label gpxyzlabel_after_lc_17_newhist
 );
IF(gp_count eq 18,
$if not setglobal gp_lc_18                         IF(gp_count_2 gt 1, put " lt 18"; );
$if     "%gp_lc_18%" == "no"                       IF(gp_count_2 gt 1, put " lt 18"; );
$if not setglobal gp_lc_18                         $goto gpxyzlabel_after_lc_18_newhist
$if     "%gp_lc_18%" == "no"                       $goto gpxyzlabel_after_lc_18_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_18%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_18%") = no;
$label gpxyzlabel_after_lc_18_newhist
 );
IF(gp_count eq 19,
$if not setglobal gp_lc_19                         IF(gp_count_2 gt 1, put " lt 19"; );
$if     "%gp_lc_19%" == "no"                       IF(gp_count_2 gt 1, put " lt 19"; );
$if not setglobal gp_lc_19                         $goto gpxyzlabel_after_lc_19_newhist
$if     "%gp_lc_19%" == "no"                       $goto gpxyzlabel_after_lc_19_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_19%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_19%") = no;
$label gpxyzlabel_after_lc_19_newhist
 );
IF(gp_count eq 20,
$if not setglobal gp_lc_20                         IF(gp_count_2 gt 1, put " lt 20"; );
$if     "%gp_lc_20%" == "no"                       IF(gp_count_2 gt 1, put " lt 20"; );
$if not setglobal gp_lc_20                         $goto gpxyzlabel_after_lc_20_newhist
$if     "%gp_lc_20%" == "no"                       $goto gpxyzlabel_after_lc_20_newhist
PUT " lc rgb ";
gp_xyz_ind_col("%gp_lc_20%") = yes;
gp_xyz_ind_col(gp_hex_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_hex_color_name
 $(gp_xyz_ind_col(gp_hex_color_name) or
   gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%)),
 put '"#',gp_hex_color_name.te(gp_hex_color_name),'"'; );
gp_xyz_ind_col("%gp_lc_20%") = no;
$label gpxyzlabel_after_lc_20_newhist
 );
* Insert Auto Code 9 produced by make_4_linestyle.gms - end

$label gpxyzlabel_afterinserthistlinecolors

  gp_count = gp_count + 1;

    );

 if(card(%gp__col3%) gt gp_count_2, put ', \'; );
 put /;
 gp_count_2 = gp_count_2 + 1;

  );

$label gpxyzlabel_write_data_file

putclose;


*__________________________________________
*
*       Gnuplot.dat - Contains Gnuplot Data
*__________________________________________
*

*       permit user to specify an alternative value for NA:
$if     setglobal gp_na                            gp_na = %gp_na%;

*       permit user to suppress (0,0) observations
gp_supzer=0;
$if setglobal gp_supzero                           gp_supzer=1;
$if "%gp_supzero%"=="no"                           gp_supzer=0;
* histograms should not have data suppressed
$if a%2==a                                         gp_supzer=0;

gp_00(%gp_scen%) = 0;
gp_xy(%gp_scen%) = 0;
gp__0(%gp_scen%) = inf;

%gp_data_string%.pw = 32767;
%gp_data_string%.nw = 16;
%gp_data_string%.nd = 8;
%gp_data_string%.nr = 1;
%gp_data_string%.nr = 2;

$if dimension 1 %1                                 $goto gpxyzlabel_put_1D_data
$if dimension 2 %1                                 $goto gpxyzlabel_put_histogram_or_spider_data
$if a%2==a                                         $goto gpxyzlabel_put_newhistogram_data
$if dimension 4 %1                                 $goto gpxyzlabel_put_3D_data

* Segment Put 2D Plot data
loop(%gp_scen%,
  loop(%gp_obsv_1%,
    if(      ((%1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%") eq 0) and
              (%1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%") eq 0)     ),
          gp_00(%gp_scen%) = gp_00(%gp_scen%) + 1;
    else  gp_00(%gp_scen%) = 0;
    );
  gp_xy(%gp_scen%) = gp_xy(%gp_scen%) + 1;
 );
);

$if not setglobal gp_zeroend                       $setglobal gp_zeroend 'no'
$if "%gp_zeroend%"=="yes"                          $goto gpxyzlabel_putdata
gp__0(%gp_scen%) = gp_xy(%gp_scen%)- gp_00(%gp_scen%);
$goto gpxyzlabel_putdata

$label gpxyzlabel_putdata

loop(%gp_scen%,
 gp_count = 0;

  loop(%gp_obsv_1%,
    gp_count = gp_count + 1;
    if(     ((gp_supzer eq 0) and ((gp_count - gp__0(%gp_scen%)) lt 0)
          or (       %1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%") ne 0 or
              mapval(%1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%")) eq mapval(eps))
          or (  %1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%") ne 0      or
              mapval(%1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%")) eq mapval(eps))
             ),
      if (%1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%") eq gp_na,
         put %gp_data_string%, '                ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,"%gp_xxxvalue%") ;
      );
      if (%1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%") eq gp_na,
         put %gp_data_string%, '                ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,"%gp_yyyvalue%") ;
      );
$if a%4==a       $goto gpxyzlabel_line_break_indata
      if (%1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") eq gp_na,
         put %gp_data_string%, '                ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,"%gp__col3%") ;
      );
$if a%5==a       $goto gpxyzlabel_line_break_indata
      if (%1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") eq gp_na,
         put %gp_data_string%, '                ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,"%gp__col4%") ;
      );
$if a%6==a       $goto gpxyzlabel_line_break_indata
      if (%1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") eq gp_na,
         put %gp_data_string%, '                ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,"%gp__col5%") ;
      );
$if a%7==a       $goto gpxyzlabel_line_break_indata
      if (%1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") eq gp_na,
         put %gp_data_string%, '                ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,"%gp__col6%") ;
      );
$goto gpxyzlabel_line_break_indata

$label gpxyzlabel_line_break_indata
     put /;
    );
  );
  put //;
);

$goto gpxyzlabel_write_gnuplot_ini


* Segment Put 1D data
$label  gpxyzlabel_put_1D_data
gp_count = 0;
loop(%gp_scen%,
    gp_count = gp_count + 1;
    if(%1(%gp_scen%) ne 0 or mapval(%1(%gp_scen%) eq mapval(eps)),
      if (%1(%gp_scen%) eq gp_na,
         put %gp_data_string%, '          ';
        else
         put %gp_data_string%, gp_count ;
      );
      if (%1(%gp_scen%) eq gp_na,
         put %gp_data_string%, '          ';
        else
         put %gp_data_string%, %1(%gp_scen%) ;
      );

     put /;
    );
);


$goto  gpxyzlabel_write_gnuplot_ini



* Segment Put 3D data
$label gpxyzlabel_put_3D_data

loop(%gp_planes%,
  loop(%gp_obsv_1%,

   loop(%gp_obsv_2%,
      put %gp_data_string%, %1(%gp_planes%,%gp_obsv_1%,%gp_obsv_2%,"%gp_xxxvalue%"),"  ";
      put %gp_data_string%, %1(%gp_planes%,%gp_obsv_1%,%gp_obsv_2%,"%gp_yyyvalue%"),"  ";
      put %gp_data_string%, %1(%gp_planes%,%gp_obsv_1%,%gp_obsv_2%,"%gp_zzzvalue%"),"  ";
      put /;
      );
  put /;
    );
  put /;
);

display "planes",%gp_planes%,"obsv1",%gp_obsv_1%,"obsv2",%gp_obsv_2%;

$goto gpxyzlabel_write_gnuplot_ini

* Put histogram or spider data

* a) put spider plot data
$label gpxyzlabel_put_histogram_or_spider_data

display "gp_style %gp_style%";

$if not "%gp_style%" == "spiderplot"            $goto after_spiderplot_data

* ddddddddd

%gp_data_string%.tw = 0;
%gp_data_string%.lw = 0;
%gp_data_string%.nw = 16;
%gp_data_string%.nj = 2;
Put %gp_data_string%;


loop(%gp_scen%,
 gp_count = 0;

  loop(%gp_obsv_1%,
    gp_count = gp_count + 1;
    if(     ((gp_supzer eq 0) and ((gp_count - gp__0(%gp_scen%)) lt 0)
          or (       %1(%gp_scen%,%gp_obsv_1%) ne 0 or
              mapval(%1(%gp_scen%,%gp_obsv_1%)) eq mapval(eps))),

      if (%1(%gp_scen%,%gp_obsv_1%) eq gp_na,
         put %gp_data_string%, '          ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%););

       );
     );

 PUT %gp_scen%.TL;

 PUT /;


   );


$goto gpxyzlabel_write_gnuplot_ini


* b) put 2D histogram data
$label after_spiderplot_data

%gp_data_string%.tw = 0;
%gp_data_string%.lw = 0;
Put %gp_data_string%;

Put '"dummy"   ';

loop(%gp_scen%,
 Put '"',%gp_scen%.tl,'"   ';
    );
PUT /;

loop(%gp_obsv_1%,
 gp_count = 0;


* new
$if not setglobal gp_nohistogram_sectionlabel   $goto after_no_sectionlabel
$if "%gp_nohistogram_sectionlabel%" == "no"     $goto after_no_sectionlabel

 put '" "';

$goto after_auto_sectionlabel

$label after_no_sectionlabel

 put '"',%gp_obsv_1%.tl,'"';

$label after_auto_sectionlabel
* end new

  loop(%gp_scen%,
    gp_count = gp_count + 1;
    if(     ((gp_supzer eq 0) and ((gp_count - gp__0(%gp_scen%)) lt 0)
          or (       %1(%gp_scen%,%gp_obsv_1%) ne 0 or
              mapval(%1(%gp_scen%,%gp_obsv_1%)) eq mapval(eps))),

      if (%1(%gp_scen%,%gp_obsv_1%) eq gp_na,
         put %gp_data_string%, '          ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%););

       );
     );

* new
$if not setglobal gp_nohistogram_boxlabel   $goto after_no_boxlabel
$if "%gp_nohistogram_boxlabel%" == "no"     $goto after_no_boxlabel

 put '  "%gp_nohistogram_boxlabel%"';

$label after_no_boxlabel
* end new


 PUT /;

   );


$goto gpxyzlabel_write_gnuplot_ini


* Segment Put New histogram data
$label gpxyzlabel_put_newhistogram_data

%gp_data_string%.tw = 0;
%gp_data_string%.lw = 0;
Put %gp_data_string%;

Put '"dummy"   ';

$if     "%gp_hist%" == "columnstacked"   loop(%gp__col3%,
loop(%gp_scen%,

 Put '"',%gp_scen%.tl,'"   ';
    );
$if     "%gp_hist%" == "columnstacked"   );
PUT /;

loop(%gp_obsv_1%,
 gp_count = 0;
 put '"',%gp_obsv_1%.tl,'"'
  loop(%gp__col3%,
   loop(%gp_scen%,
    gp_count = gp_count + 1;
    if(     ((gp_supzer eq 0) and ((gp_count - gp__0(%gp_scen%)) lt 0)
          or (       %1(%gp_scen%,%gp_obsv_1%,%gp__col3%) ne 0 or
              mapval(%1(%gp_scen%,%gp_obsv_1%,%gp__col3%)) eq mapval(eps))),

      if (%1(%gp_scen%,%gp_obsv_1%,%gp__col3%) eq gp_na,
         put %gp_data_string%, '          ';
        else
         put %gp_data_string%, %1(%gp_scen%,%gp_obsv_1%,%gp__col3%););

       );
     );
   );

 PUT /;


  );


$goto gpxyzlabel_write_gnuplot_ini



$label gpxyzlabel_write_gnuplot_ini

putclose;
$offuni

*                                                                          *
*   Overwrite wgnuplot.ini which resides in the windows system directory   *
*_______________________________________________________________________   *


$if not "%gp_term%"=="windows"                     $goto gpxyzlabel_rungnupl


put  gp_winini;

gp_winini.nd = 0;
gp_winini.nw = 0;

put '[WGNUPLOT]' /;

$if not setglobal gp_graphorigin                   $goto gpxyzlabel_win_customsize
$if "%gp_graphorigin%" == "0"                      $goto gpxyzlabel_win_customsize
$if "%gp_graphorigin%" == "no"                     $goto gpxyzlabel_win_customsize
put 'GraphOrigin= %gp_graphorigin%' /;
$goto gpxyzlabel_win_heightlength

$label gpxyzlabel_win_customsize
put 'GraphOrigin=-4 -4' /;
$goto gpxyzlabel_win_heightlength

$label gpxyzlabel_win_heightlength
$if not setglobal gp_wheight                       $goto gpxyzlabel_win_size
$if not setglobal gp_wlength                       $goto gpxyzlabel_win_size
$if "%gp_wheight%" == "0"                          $goto gpxyzlabel_win_size
$if "%gp_wheight%" == "no"                         $goto gpxyzlabel_win_size
$if "%gp_wlength%" == "0"                          $goto gpxyzlabel_win_size
$if "%gp_wlength%" == "no"                         $goto gpxyzlabel_win_size
put 'GraphSize=%gp_wlength% %gp_wheight%' /;
$goto gpxyzlabel_win_font

$label gpxyzlabel_win_size
put "GraphSize=648 460" /;
$goto gpxyzlabel_win_font

$label gpxyzlabel_win_font
put 'GraphFont=%gp_font%,%gp_fontsize%' /;
$if '%gp_color%' == 'monochrome'                   put 'GraphColor=0' /;
$if '%gp_color%' == 'color'                        put 'GraphColor=1' /;
put 'GraphToTop=1' /;
put 'GraphBackground=255 255 255' /;

$if not setglobal gp_bdwidth                       $setglobal gp_bdwidth '0'
$if "%gp_bdwidth%" == "0"                          $setglobal gp_bdwidth '0'
$if "%gp_bdwidth%" == "no"                         $setglobal gp_bdwidth '0'
put 'Border=0 0 0 -',%gp_bdwidth%,' -',%gp_bdwidth% /;

$if not setglobal gp_axwidth                       $setglobal gp_axwidth '2'
put 'Axis=192 192 192 -',%gp_axwidth%,' -',%gp_axwidth% /;


$ontext
put 'Line1=255 0 0 0 0' /;
put 'Line2=0 255 0 0 1' /;
put 'Line3=0 0 255 0 2' /;
put 'Line4=255 0 255 0 3' /;
put 'Line5=0 0 128 0 4' /;
put 'Line6=128 0 0 0 0' /;
put 'Line7=0 128 128 0 1' /;
put 'Line8=0 0 0 0 2' /;
put 'Line9=128 128 128 0 3' /;
put 'Line10=0 128 64 0 4' /;
put 'Line11=128 128 0 0 0' /;
put 'Line12=128 0 128 0 1' /;
put 'Line13=192 192 192 0 2' /;
put 'Line14=0 255 255 0 3' /;
put 'Line15=255 255 0 0 4' /;
$offtext


* individual colors

$if "%gp_fixcolor_set%" == "no"                    $goto gpxyzlabel_gp_lc_1_lb
$if not setglobal gp_fixcolor_set                  $goto gpxyzlabel_gp_lc_1_lb

*
$if not setglobal gp_greyscale   $goto gpxyzlabel_after_greyscale
$if "%gp_greyscale%" == "no"     $goto gpxyzlabel_after_greyscale

$if not setglobal gp_lc_1        $setglobal gp_lc_1  grey8
$if not setglobal gp_lc_2        $setglobal gp_lc_2  grey16
$if not setglobal gp_lc_3        $setglobal gp_lc_3  grey24
$if not setglobal gp_lc_4        $setglobal gp_lc_4  grey32
$if not setglobal gp_lc_5        $setglobal gp_lc_5  grey40
$if not setglobal gp_lc_6        $setglobal gp_lc_6  grey48
$if not setglobal gp_lc_7        $setglobal gp_lc_7  grey56
$if not setglobal gp_lc_8        $setglobal gp_lc_8  grey64
$if not setglobal gp_lc_9        $setglobal gp_lc_9  grey72
$if not setglobal gp_lc_10       $setglobal gp_lc_10 grey80
$if not setglobal gp_lc_11       $setglobal gp_lc_11 grey88
$if not setglobal gp_lc_12       $setglobal gp_lc_12 grey84
$if not setglobal gp_lc_13       $setglobal gp_lc_13 grey76
$if not setglobal gp_lc_14       $setglobal gp_lc_14 grey68
$if not setglobal gp_lc_15       $setglobal gp_lc_15 grey60
$if not setglobal gp_lc_16       $setglobal gp_lc_16 grey52
$if not setglobal gp_lc_17       $setglobal gp_lc_17 grey44
$if not setglobal gp_lc_18       $setglobal gp_lc_18 grey36
$if not setglobal gp_lc_19       $setglobal gp_lc_19 grey28
$if not setglobal gp_lc_20       $setglobal gp_lc_20 grey20
$if not setglobal gp_lc_21       $setglobal gp_lc_21 grey12
$goto gpxyzlabel_after_colorscale

$label gpxyzlabel_after_greyscale
$if not setglobal gp_lc_1        $setglobal gp_lc_1  Red
$if not setglobal gp_lc_2        $setglobal gp_lc_2  BrightGreen
$if not setglobal gp_lc_3        $setglobal gp_lc_3  Blue
$if not setglobal gp_lc_4        $setglobal gp_lc_4  pink
$if not setglobal gp_lc_5        $setglobal gp_lc_5  NavyBlue
$if not setglobal gp_lc_6        $setglobal gp_lc_6  Brown
$if not setglobal gp_lc_7        $setglobal gp_lc_7  Cyan
$if not setglobal gp_lc_8        $setglobal gp_lc_8  Black
$if not setglobal gp_lc_9        $setglobal gp_lc_9  darkgray
$if not setglobal gp_lc_10       $setglobal gp_lc_10 Green
$if not setglobal gp_lc_11       $setglobal gp_lc_11 Olive
$if not setglobal gp_lc_12       $setglobal gp_lc_12 magenta
$if not setglobal gp_lc_13       $setglobal gp_lc_13 LightGrey
$if not setglobal gp_lc_14       $setglobal gp_lc_14 lightcyan
$if not setglobal gp_lc_15       $setglobal gp_lc_15 Yellow
$if not setglobal gp_lc_16       $setglobal gp_lc_16 chocolate
$if not setglobal gp_lc_17       $setglobal gp_lc_17 coral
$if not setglobal gp_lc_18       $setglobal gp_lc_18 cornflowerblue
$if not setglobal gp_lc_19       $setglobal gp_lc_19 cornsilk
$if not setglobal gp_lc_20       $setglobal gp_lc_20 crimson
$if not setglobal gp_lc_21       $setglobal gp_lc_21 darkblue
$if not setglobal gp_lc_22       $setglobal gp_lc_22 darkcyan
$if not setglobal gp_lc_23       $setglobal gp_lc_23 darkgoldenrod
$if not setglobal gp_lc_24       $setglobal gp_lc_24 darkgray
$if not setglobal gp_lc_25       $setglobal gp_lc_25 darkgreen
$if not setglobal gp_lc_26       $setglobal gp_lc_26 darkkhaki
$if not setglobal gp_lc_27       $setglobal gp_lc_27 darkmagenta
$if not setglobal gp_lc_28       $setglobal gp_lc_28 darkolivegreen
$if not setglobal gp_lc_29       $setglobal gp_lc_29 darkorange
$if not setglobal gp_lc_30       $setglobal gp_lc_30 darkorchid
$if not setglobal gp_lc_31       $setglobal gp_lc_31 darkred
$if not setglobal gp_lc_32       $setglobal gp_lc_32 darksalmon
$if not setglobal gp_lc_33       $setglobal gp_lc_33 darkseagreen
$if not setglobal gp_lc_34       $setglobal gp_lc_34 darkslateblue
$if not setglobal gp_lc_35       $setglobal gp_lc_35 darkslategray
$if not setglobal gp_lc_36       $setglobal gp_lc_36 darkturquoise
$if not setglobal gp_lc_37       $setglobal gp_lc_37 darkviolet
$if not setglobal gp_lc_38       $setglobal gp_lc_38 deeppink
$if not setglobal gp_lc_39       $setglobal gp_lc_39 deepskyblue
$if not setglobal gp_lc_40       $setglobal gp_lc_40 dimgray
$label gpxyzlabel_after_colorscale

$ontext
gp_count = 0;
LOOP(%gp_fixcolor_set%,
 gp_count = gp_count + 1;
 LOOP(%gp_scen% $SAMEAS(%gp_fixcolor_set%,%gp_scen%),

IF(gp_count eq 1, gp_xyz_fixed_col("%gp_lc_1%",%gp_scen%) = yes;);
IF(gp_count eq 2, gp_xyz_fixed_col("%gp_lc_2%",%gp_scen%) = yes;);
IF(gp_count eq 3, gp_xyz_fixed_col("%gp_lc_3%",%gp_scen%) = yes;);
IF(gp_count eq 4, gp_xyz_fixed_col("%gp_lc_4%",%gp_scen%) = yes;);
IF(gp_count eq 5, gp_xyz_fixed_col("%gp_lc_5%",%gp_scen%) = yes;);
IF(gp_count eq 6, gp_xyz_fixed_col("%gp_lc_6%",%gp_scen%) = yes;);
IF(gp_count eq 7, gp_xyz_fixed_col("%gp_lc_7%",%gp_scen%) = yes;);
IF(gp_count eq 8, gp_xyz_fixed_col("%gp_lc_8%",%gp_scen%) = yes;);
IF(gp_count eq 9, gp_xyz_fixed_col("%gp_lc_9%",%gp_scen%) = yes;);
IF(gp_count eq 10, gp_xyz_fixed_col("%gp_lc_10%",%gp_scen%) = yes;);
IF(gp_count eq 11, gp_xyz_fixed_col("%gp_lc_11%",%gp_scen%) = yes;);
IF(gp_count eq 12, gp_xyz_fixed_col("%gp_lc_12%",%gp_scen%) = yes;);
IF(gp_count eq 13, gp_xyz_fixed_col("%gp_lc_13%",%gp_scen%) = yes;);
IF(gp_count eq 14, gp_xyz_fixed_col("%gp_lc_14%",%gp_scen%) = yes;);
IF(gp_count eq 15, gp_xyz_fixed_col("%gp_lc_15%",%gp_scen%) = yes;);
IF(gp_count eq 16, gp_xyz_fixed_col("%gp_lc_16%",%gp_scen%) = yes;);
IF(gp_count eq 17, gp_xyz_fixed_col("%gp_lc_17%",%gp_scen%) = yes;);
IF(gp_count eq 18, gp_xyz_fixed_col("%gp_lc_18%",%gp_scen%) = yes;);
IF(gp_count eq 19, gp_xyz_fixed_col("%gp_lc_19%",%gp_scen%) = yes;);
IF(gp_count eq 20, gp_xyz_fixed_col("%gp_lc_20%",%gp_scen%) = yes;);
IF(gp_count eq 21, gp_xyz_fixed_col("%gp_lc_21%",%gp_scen%) = yes;);
IF(gp_count eq 22, gp_xyz_fixed_col("%gp_lc_22%",%gp_scen%) = yes;);
IF(gp_count eq 23, gp_xyz_fixed_col("%gp_lc_23%",%gp_scen%) = yes;);
IF(gp_count eq 24, gp_xyz_fixed_col("%gp_lc_24%",%gp_scen%) = yes;);
IF(gp_count eq 25, gp_xyz_fixed_col("%gp_lc_25%",%gp_scen%) = yes;);
IF(gp_count eq 26, gp_xyz_fixed_col("%gp_lc_26%",%gp_scen%) = yes;);
IF(gp_count eq 27, gp_xyz_fixed_col("%gp_lc_27%",%gp_scen%) = yes;);
IF(gp_count eq 28, gp_xyz_fixed_col("%gp_lc_28%",%gp_scen%) = yes;);
IF(gp_count eq 29, gp_xyz_fixed_col("%gp_lc_29%",%gp_scen%) = yes;);
IF(gp_count eq 30, gp_xyz_fixed_col("%gp_lc_30%",%gp_scen%) = yes;);
IF(gp_count eq 31, gp_xyz_fixed_col("%gp_lc_31%",%gp_scen%) = yes;);
IF(gp_count eq 32, gp_xyz_fixed_col("%gp_lc_32%",%gp_scen%) = yes;);
IF(gp_count eq 33, gp_xyz_fixed_col("%gp_lc_33%",%gp_scen%) = yes;);
IF(gp_count eq 34, gp_xyz_fixed_col("%gp_lc_34%",%gp_scen%) = yes;);
IF(gp_count eq 35, gp_xyz_fixed_col("%gp_lc_35%",%gp_scen%) = yes;);
IF(gp_count eq 36, gp_xyz_fixed_col("%gp_lc_36%",%gp_scen%) = yes;);
IF(gp_count eq 37, gp_xyz_fixed_col("%gp_lc_37%",%gp_scen%) = yes;);
IF(gp_count eq 38, gp_xyz_fixed_col("%gp_lc_38%",%gp_scen%) = yes;);
IF(gp_count eq 39, gp_xyz_fixed_col("%gp_lc_39%",%gp_scen%) = yes;);
IF(gp_count eq 40, gp_xyz_fixed_col("%gp_lc_40%",%gp_scen%) = yes;);
     ););

$offtext


gp_scencount(%gp_scen%) = 0;
gp_count = 0;
LOOP(%gp_scen%,
 gp_count = gp_count + 1;
 gp_scencount(%gp_scen%) = gp_count; );

$label gpxyzlabel_gp_lc_1_lb
put "Line1=";
$if "%gp_lc_1%"=="no"          put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_1%"=="no"          $goto gpxyzlabel_gp_lc_2_lb
$if "%gp_lc_1%"=="0"           put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_1%"=="0"           $goto gpxyzlabel_gp_lc_2_lb
$if not setglobal gp_lc_1      put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_1      $goto gpxyzlabel_gp_lc_2_lb
$if     setglobal gp_lc_1      gp_xyz_ind_col("%gp_lc_1%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 1), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_1      gp_xyz_ind_col("%gp_lc_1%") = no;
$goto gpxyzlabel_gp_lc_2_lb

$label gpxyzlabel_gp_lc_2_lb
put "Line2=";
$if "%gp_lc_2%"=="no"          put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_2%"=="no"          $goto gpxyzlabel_gp_lc_3_lb
$if "%gp_lc_2%"=="0"           put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_2%"=="0"           $goto gpxyzlabel_gp_lc_3_lb
$if not setglobal gp_lc_2      put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_2      $goto gpxyzlabel_gp_lc_3_lb
$if     setglobal gp_lc_2      gp_xyz_ind_col("%gp_lc_2%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 2), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_2      gp_xyz_ind_col("%gp_lc_2%") = no;
$goto gpxyzlabel_gp_lc_3_lb

$label gpxyzlabel_gp_lc_3_lb
put "Line3=";
$if "%gp_lc_3%"=="no"          put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_3%"=="no"          $goto gpxyzlabel_gp_lc_4_lb
$if "%gp_lc_3%"=="0"           put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_3%"=="0"           $goto gpxyzlabel_gp_lc_4_lb
$if not setglobal gp_lc_3      put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_3      $goto gpxyzlabel_gp_lc_4_lb
$if     setglobal gp_lc_3      gp_xyz_ind_col("%gp_lc_3%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 3), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_3      gp_xyz_ind_col("%gp_lc_3%") = no;
$goto gpxyzlabel_gp_lc_4_lb

$label gpxyzlabel_gp_lc_4_lb
put "Line4=";
$if "%gp_lc_4%"=="no"          put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_4%"=="no"          $goto gpxyzlabel_gp_lc_5_lb
$if "%gp_lc_4%"=="0"           put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_4%"=="0"           $goto gpxyzlabel_gp_lc_5_lb
$if not setglobal gp_lc_4      put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_4      $goto gpxyzlabel_gp_lc_5_lb
$if     setglobal gp_lc_4      gp_xyz_ind_col("%gp_lc_4%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 4), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_4      gp_xyz_ind_col("%gp_lc_4%") = no;
$goto gpxyzlabel_gp_lc_5_lb

$label gpxyzlabel_gp_lc_5_lb
put "Line5=";
$if "%gp_lc_5%"=="no"          put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_5%"=="no"          $goto gpxyzlabel_gp_lc_6_lb
$if "%gp_lc_5%"=="0"           put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_5%"=="0"           $goto gpxyzlabel_gp_lc_6_lb
$if not setglobal gp_lc_5      put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_5      $goto gpxyzlabel_gp_lc_6_lb
$if     setglobal gp_lc_5      gp_xyz_ind_col("%gp_lc_5%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 5), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_5      gp_xyz_ind_col("%gp_lc_5%") = no;
$goto gpxyzlabel_gp_lc_6_lb

$label gpxyzlabel_gp_lc_6_lb
put "Line6=";
$if "%gp_lc_6%"=="no"          put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_6%"=="no"          $goto gpxyzlabel_gp_lc_7_lb
$if "%gp_lc_6%"=="0"           put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_6%"=="0"           $goto gpxyzlabel_gp_lc_7_lb
$if not setglobal gp_lc_6      put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_6      $goto gpxyzlabel_gp_lc_7_lb
$if     setglobal gp_lc_6      gp_xyz_ind_col("%gp_lc_6%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 6), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_6      gp_xyz_ind_col("%gp_lc_6%") = no;
$goto gpxyzlabel_gp_lc_7_lb

$label gpxyzlabel_gp_lc_7_lb
put "Line7=";
$if "%gp_lc_7%"=="no"          put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_7%"=="no"          $goto gpxyzlabel_gp_lc_8_lb
$if "%gp_lc_7%"=="0"           put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_7%"=="0"           $goto gpxyzlabel_gp_lc_8_lb
$if not setglobal gp_lc_7      put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_7      $goto gpxyzlabel_gp_lc_8_lb
$if     setglobal gp_lc_7      gp_xyz_ind_col("%gp_lc_7%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 7), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_7      gp_xyz_ind_col("%gp_lc_7%") = no;
$goto gpxyzlabel_gp_lc_8_lb

$label gpxyzlabel_gp_lc_8_lb
put "Line8=";
$if "%gp_lc_8%"=="no"          put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_8%"=="no"          $goto gpxyzlabel_gp_lc_9_lb
$if "%gp_lc_8%"=="0"           put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_8%"=="0"           $goto gpxyzlabel_gp_lc_9_lb
$if not setglobal gp_lc_8      put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_8      $goto gpxyzlabel_gp_lc_9_lb
$if     setglobal gp_lc_8      gp_xyz_ind_col("%gp_lc_8%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 8), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_8      gp_xyz_ind_col("%gp_lc_8%") = no;
$goto gpxyzlabel_gp_lc_9_lb

$label gpxyzlabel_gp_lc_9_lb
put "Line9=";
$if "%gp_lc_9%"=="no"          put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_9%"=="no"          $goto gpxyzlabel_gp_lc_10_lb
$if "%gp_lc_9%"=="0"           put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_9%"=="0"           $goto gpxyzlabel_gp_lc_10_lb
$if not setglobal gp_lc_9      put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_9      $goto gpxyzlabel_gp_lc_10_lb
$if     setglobal gp_lc_9      gp_xyz_ind_col("%gp_lc_9%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 9), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_9      gp_xyz_ind_col("%gp_lc_9%") = no;
$goto gpxyzlabel_gp_lc_10_lb

$label gpxyzlabel_gp_lc_10_lb
put "Line10=";
$if "%gp_lc_10%"=="no"          put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_10%"=="no"          $goto gpxyzlabel_gp_lc_11_lb
$if "%gp_lc_10%"=="0"           put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_10%"=="0"           $goto gpxyzlabel_gp_lc_11_lb
$if not setglobal gp_lc_10      put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_10      $goto gpxyzlabel_gp_lc_11_lb
$if     setglobal gp_lc_10      gp_xyz_ind_col("%gp_lc_10%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 10), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_10      gp_xyz_ind_col("%gp_lc_10%") = no;
$goto gpxyzlabel_gp_lc_11_lb

$label gpxyzlabel_gp_lc_11_lb
put "Line11=";
$if "%gp_lc_11%"=="no"          put '128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_11%"=="no"          $goto gpxyzlabel_gp_lc_12_lb
$if "%gp_lc_11%"=="0"           put '128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_11%"=="0"           $goto gpxyzlabel_gp_lc_12_lb
$if not setglobal gp_lc_11      put '128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_11      $goto gpxyzlabel_gp_lc_12_lb
$if     setglobal gp_lc_11      gp_xyz_ind_col("%gp_lc_11%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 11), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_11      gp_xyz_ind_col("%gp_lc_11%") = no;
$goto gpxyzlabel_gp_lc_12_lb

$label gpxyzlabel_gp_lc_12_lb
put "Line12=";
$if "%gp_lc_12%"=="no"          put '128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_12%"=="no"          $goto gpxyzlabel_gp_lc_13_lb
$if "%gp_lc_12%"=="0"           put '128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_12%"=="0"           $goto gpxyzlabel_gp_lc_13_lb
$if not setglobal gp_lc_12      put '128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_12      $goto gpxyzlabel_gp_lc_13_lb
$if     setglobal gp_lc_12      gp_xyz_ind_col("%gp_lc_12%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 12), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_12      gp_xyz_ind_col("%gp_lc_12%") = no;
$goto gpxyzlabel_gp_lc_13_lb

$label gpxyzlabel_gp_lc_13_lb
put "Line13=";
$if "%gp_lc_13%"=="no"          put '192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_13%"=="no"          $goto gpxyzlabel_gp_lc_14_lb
$if "%gp_lc_13%"=="0"           put '192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_13%"=="0"           $goto gpxyzlabel_gp_lc_14_lb
$if not setglobal gp_lc_13      put '192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_13      $goto gpxyzlabel_gp_lc_14_lb
$if     setglobal gp_lc_13      gp_xyz_ind_col("%gp_lc_13%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 13), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_13      gp_xyz_ind_col("%gp_lc_13%") = no;
$goto gpxyzlabel_gp_lc_14_lb

$label gpxyzlabel_gp_lc_14_lb
put "Line14=";
$if "%gp_lc_14%"=="no"          put '0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_14%"=="no"          $goto gpxyzlabel_gp_lc_15_lb
$if "%gp_lc_14%"=="0"           put '0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_14%"=="0"           $goto gpxyzlabel_gp_lc_15_lb
$if not setglobal gp_lc_14      put '0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_14      $goto gpxyzlabel_gp_lc_15_lb
$if     setglobal gp_lc_14      gp_xyz_ind_col("%gp_lc_14%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 14), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_14      gp_xyz_ind_col("%gp_lc_14%") = no;
$goto gpxyzlabel_gp_lc_15_lb

$label gpxyzlabel_gp_lc_15_lb
put "Line15=";
$if "%gp_lc_15%"=="no"          put '255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_15%"=="no"          $goto gpxyzlabel_gp_lc_16_lb
$if "%gp_lc_15%"=="0"           put '255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_15%"=="0"           $goto gpxyzlabel_gp_lc_16_lb
$if not setglobal gp_lc_15      put '255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_15      $goto gpxyzlabel_gp_lc_16_lb
$if     setglobal gp_lc_15      gp_xyz_ind_col("%gp_lc_15%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 15), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_15      gp_xyz_ind_col("%gp_lc_15%") = no;
$goto gpxyzlabel_gp_lc_16_lb

$label gpxyzlabel_gp_lc_16_lb
put "Line16=";
$if "%gp_lc_16%"=="no"          put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_16%"=="no"          $goto gpxyzlabel_gp_lc_17_lb
$if "%gp_lc_16%"=="0"           put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_16%"=="0"           $goto gpxyzlabel_gp_lc_17_lb
$if not setglobal gp_lc_16      put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_16      $goto gpxyzlabel_gp_lc_17_lb
$if     setglobal gp_lc_16      gp_xyz_ind_col("%gp_lc_16%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 16), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_16      gp_xyz_ind_col("%gp_lc_16%") = no;
$goto gpxyzlabel_gp_lc_17_lb

$label gpxyzlabel_gp_lc_17_lb
put "Line17=";
$if "%gp_lc_17%"=="no"          put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_17%"=="no"          $goto gpxyzlabel_gp_lc_18_lb
$if "%gp_lc_17%"=="0"           put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_17%"=="0"           $goto gpxyzlabel_gp_lc_18_lb
$if not setglobal gp_lc_17      put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_17      $goto gpxyzlabel_gp_lc_18_lb
$if     setglobal gp_lc_17      gp_xyz_ind_col("%gp_lc_17%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 17), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_17      gp_xyz_ind_col("%gp_lc_17%") = no;
$goto gpxyzlabel_gp_lc_18_lb

$label gpxyzlabel_gp_lc_18_lb
put "Line18=";
$if "%gp_lc_18%"=="no"          put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_18%"=="no"          $goto gpxyzlabel_gp_lc_19_lb
$if "%gp_lc_18%"=="0"           put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_18%"=="0"           $goto gpxyzlabel_gp_lc_19_lb
$if not setglobal gp_lc_18      put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_18      $goto gpxyzlabel_gp_lc_19_lb
$if     setglobal gp_lc_18      gp_xyz_ind_col("%gp_lc_18%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 18), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_18      gp_xyz_ind_col("%gp_lc_18%") = no;
$goto gpxyzlabel_gp_lc_19_lb

$label gpxyzlabel_gp_lc_19_lb
put "Line19=";
$if "%gp_lc_19%"=="no"          put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_19%"=="no"          $goto gpxyzlabel_gp_lc_20_lb
$if "%gp_lc_19%"=="0"           put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_19%"=="0"           $goto gpxyzlabel_gp_lc_20_lb
$if not setglobal gp_lc_19      put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_19      $goto gpxyzlabel_gp_lc_20_lb
$if     setglobal gp_lc_19      gp_xyz_ind_col("%gp_lc_19%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 19), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_19      gp_xyz_ind_col("%gp_lc_19%") = no;
$goto gpxyzlabel_gp_lc_20_lb

$label gpxyzlabel_gp_lc_20_lb
put "Line20=";
$if "%gp_lc_20%"=="no"          put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_20%"=="no"          $goto gpxyzlabel_gp_lc_21_lb
$if "%gp_lc_20%"=="0"           put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_20%"=="0"           $goto gpxyzlabel_gp_lc_21_lb
$if not setglobal gp_lc_20      put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_20      $goto gpxyzlabel_gp_lc_21_lb
$if     setglobal gp_lc_20      gp_xyz_ind_col("%gp_lc_20%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 20), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_20      gp_xyz_ind_col("%gp_lc_20%") = no;
$goto gpxyzlabel_gp_lc_21_lb

$label gpxyzlabel_gp_lc_21_lb
put "Line21=";
$if "%gp_lc_21%"=="no"          put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_21%"=="no"          $goto gpxyzlabel_gp_lc_22_lb
$if "%gp_lc_21%"=="0"           put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_21%"=="0"           $goto gpxyzlabel_gp_lc_22_lb
$if not setglobal gp_lc_21      put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_21      $goto gpxyzlabel_gp_lc_22_lb
$if     setglobal gp_lc_21      gp_xyz_ind_col("%gp_lc_21%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 21), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_21      gp_xyz_ind_col("%gp_lc_21%") = no;
$goto gpxyzlabel_gp_lc_22_lb

$label gpxyzlabel_gp_lc_22_lb
put "Line22=";
$if "%gp_lc_22%"=="no"          put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_22%"=="no"          $goto gpxyzlabel_gp_lc_23_lb
$if "%gp_lc_22%"=="0"           put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_22%"=="0"           $goto gpxyzlabel_gp_lc_23_lb
$if not setglobal gp_lc_22      put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_22      $goto gpxyzlabel_gp_lc_23_lb
$if     setglobal gp_lc_22      gp_xyz_ind_col("%gp_lc_22%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 22), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_22      gp_xyz_ind_col("%gp_lc_22%") = no;
$goto gpxyzlabel_gp_lc_23_lb

$label gpxyzlabel_gp_lc_23_lb
put "Line23=";
$if "%gp_lc_23%"=="no"          put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_23%"=="no"          $goto gpxyzlabel_gp_lc_24_lb
$if "%gp_lc_23%"=="0"           put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_23%"=="0"           $goto gpxyzlabel_gp_lc_24_lb
$if not setglobal gp_lc_23      put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_23      $goto gpxyzlabel_gp_lc_24_lb
$if     setglobal gp_lc_23      gp_xyz_ind_col("%gp_lc_23%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 23), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_23      gp_xyz_ind_col("%gp_lc_23%") = no;
$goto gpxyzlabel_gp_lc_24_lb

$label gpxyzlabel_gp_lc_24_lb
put "Line24=";
$if "%gp_lc_24%"=="no"          put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_24%"=="no"          $goto gpxyzlabel_gp_lc_25_lb
$if "%gp_lc_24%"=="0"           put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_24%"=="0"           $goto gpxyzlabel_gp_lc_25_lb
$if not setglobal gp_lc_24      put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_24      $goto gpxyzlabel_gp_lc_25_lb
$if     setglobal gp_lc_24      gp_xyz_ind_col("%gp_lc_24%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 24), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_24      gp_xyz_ind_col("%gp_lc_24%") = no;
$goto gpxyzlabel_gp_lc_25_lb

$label gpxyzlabel_gp_lc_25_lb
put "Line25=";
$if "%gp_lc_25%"=="no"          put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_25%"=="no"          $goto gpxyzlabel_gp_lc_26_lb
$if "%gp_lc_25%"=="0"           put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_25%"=="0"           $goto gpxyzlabel_gp_lc_26_lb
$if not setglobal gp_lc_25      put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_25      $goto gpxyzlabel_gp_lc_26_lb
$if     setglobal gp_lc_25      gp_xyz_ind_col("%gp_lc_25%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 25), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_25      gp_xyz_ind_col("%gp_lc_25%") = no;
$goto gpxyzlabel_gp_lc_26_lb

$label gpxyzlabel_gp_lc_26_lb
put "Line26=";
$if "%gp_lc_26%"=="no"          put '128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_26%"=="no"          $goto gpxyzlabel_gp_lc_27_lb
$if "%gp_lc_26%"=="0"           put '128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_26%"=="0"           $goto gpxyzlabel_gp_lc_27_lb
$if not setglobal gp_lc_26      put '128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_26      $goto gpxyzlabel_gp_lc_27_lb
$if     setglobal gp_lc_26      gp_xyz_ind_col("%gp_lc_26%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 26), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_26      gp_xyz_ind_col("%gp_lc_26%") = no;
$goto gpxyzlabel_gp_lc_27_lb

$label gpxyzlabel_gp_lc_27_lb
put "Line27=";
$if "%gp_lc_27%"=="no"          put '128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_27%"=="no"          $goto gpxyzlabel_gp_lc_28_lb
$if "%gp_lc_27%"=="0"           put '128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_27%"=="0"           $goto gpxyzlabel_gp_lc_28_lb
$if not setglobal gp_lc_27      put '128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_27      $goto gpxyzlabel_gp_lc_28_lb
$if     setglobal gp_lc_27      gp_xyz_ind_col("%gp_lc_27%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 27), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_27      gp_xyz_ind_col("%gp_lc_27%") = no;
$goto gpxyzlabel_gp_lc_28_lb

$label gpxyzlabel_gp_lc_28_lb
put "Line28=";
$if "%gp_lc_28%"=="no"          put '192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_28%"=="no"          $goto gpxyzlabel_gp_lc_29_lb
$if "%gp_lc_28%"=="0"           put '192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_28%"=="0"           $goto gpxyzlabel_gp_lc_29_lb
$if not setglobal gp_lc_28      put '192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_28      $goto gpxyzlabel_gp_lc_29_lb
$if     setglobal gp_lc_28      gp_xyz_ind_col("%gp_lc_28%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 28), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_28      gp_xyz_ind_col("%gp_lc_28%") = no;
$goto gpxyzlabel_gp_lc_29_lb

$label gpxyzlabel_gp_lc_29_lb
put "Line29=";
$if "%gp_lc_29%"=="no"          put '0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_29%"=="no"          $goto gpxyzlabel_gp_lc_30_lb
$if "%gp_lc_29%"=="0"           put '0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_29%"=="0"           $goto gpxyzlabel_gp_lc_30_lb
$if not setglobal gp_lc_29      put '0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_29      $goto gpxyzlabel_gp_lc_30_lb
$if     setglobal gp_lc_29      gp_xyz_ind_col("%gp_lc_29%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 29), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_29      gp_xyz_ind_col("%gp_lc_29%") = no;
$goto gpxyzlabel_gp_lc_30_lb

$label gpxyzlabel_gp_lc_30_lb
put "Line30=";
$if "%gp_lc_30%"=="no"          put '255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_30%"=="no"          $goto gpxyzlabel_gp_lc_31_lb
$if "%gp_lc_30%"=="0"           put '255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_30%"=="0"           $goto gpxyzlabel_gp_lc_31_lb
$if not setglobal gp_lc_30      put '255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_30      $goto gpxyzlabel_gp_lc_31_lb
$if     setglobal gp_lc_30      gp_xyz_ind_col("%gp_lc_30%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 30), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_30      gp_xyz_ind_col("%gp_lc_30%") = no;
$goto gpxyzlabel_gp_lc_31_lb

$label gpxyzlabel_gp_lc_31_lb
put "Line31=";
$if "%gp_lc_31%"=="no"          put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_31%"=="no"          $goto gpxyzlabel_gp_lc_32_lb
$if "%gp_lc_31%"=="0"           put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_31%"=="0"           $goto gpxyzlabel_gp_lc_32_lb
$if not setglobal gp_lc_31      put '255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_31      $goto gpxyzlabel_gp_lc_32_lb
$if     setglobal gp_lc_31      gp_xyz_ind_col("%gp_lc_31%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 31), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_31      gp_xyz_ind_col("%gp_lc_31%") = no;
$goto gpxyzlabel_gp_lc_32_lb

$label gpxyzlabel_gp_lc_32_lb
put "Line32=";
$if "%gp_lc_32%"=="no"          put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_32%"=="no"          $goto gpxyzlabel_gp_lc_33_lb
$if "%gp_lc_32%"=="0"           put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_32%"=="0"           $goto gpxyzlabel_gp_lc_33_lb
$if not setglobal gp_lc_32      put '0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_32      $goto gpxyzlabel_gp_lc_33_lb
$if     setglobal gp_lc_32      gp_xyz_ind_col("%gp_lc_32%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 32), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_32      gp_xyz_ind_col("%gp_lc_32%") = no;
$goto gpxyzlabel_gp_lc_33_lb

$label gpxyzlabel_gp_lc_33_lb
put "Line33=";
$if "%gp_lc_33%"=="no"          put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_33%"=="no"          $goto gpxyzlabel_gp_lc_34_lb
$if "%gp_lc_33%"=="0"           put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_33%"=="0"           $goto gpxyzlabel_gp_lc_34_lb
$if not setglobal gp_lc_33      put '0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_33      $goto gpxyzlabel_gp_lc_34_lb
$if     setglobal gp_lc_33      gp_xyz_ind_col("%gp_lc_33%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 33), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_33      gp_xyz_ind_col("%gp_lc_33%") = no;
$goto gpxyzlabel_gp_lc_34_lb

$label gpxyzlabel_gp_lc_34_lb
put "Line34=";
$if "%gp_lc_34%"=="no"          put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_34%"=="no"          $goto gpxyzlabel_gp_lc_35_lb
$if "%gp_lc_34%"=="0"           put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_34%"=="0"           $goto gpxyzlabel_gp_lc_35_lb
$if not setglobal gp_lc_34      put '255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_34      $goto gpxyzlabel_gp_lc_35_lb
$if     setglobal gp_lc_34      gp_xyz_ind_col("%gp_lc_34%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 34), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_34      gp_xyz_ind_col("%gp_lc_34%") = no;
$goto gpxyzlabel_gp_lc_35_lb

$label gpxyzlabel_gp_lc_35_lb
put "Line35=";
$if "%gp_lc_35%"=="no"          put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_35%"=="no"          $goto gpxyzlabel_gp_lc_36_lb
$if "%gp_lc_35%"=="0"           put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_35%"=="0"           $goto gpxyzlabel_gp_lc_36_lb
$if not setglobal gp_lc_35      put '0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_35      $goto gpxyzlabel_gp_lc_36_lb
$if     setglobal gp_lc_35      gp_xyz_ind_col("%gp_lc_35%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 35), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_35      gp_xyz_ind_col("%gp_lc_35%") = no;
$goto gpxyzlabel_gp_lc_36_lb

$label gpxyzlabel_gp_lc_36_lb
put "Line36=";
$if "%gp_lc_36%"=="no"          put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_36%"=="no"          $goto gpxyzlabel_gp_lc_37_lb
$if "%gp_lc_36%"=="0"           put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_36%"=="0"           $goto gpxyzlabel_gp_lc_37_lb
$if not setglobal gp_lc_36      put '128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_36      $goto gpxyzlabel_gp_lc_37_lb
$if     setglobal gp_lc_36      gp_xyz_ind_col("%gp_lc_36%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 36), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_36      gp_xyz_ind_col("%gp_lc_36%") = no;
$goto gpxyzlabel_gp_lc_37_lb

$label gpxyzlabel_gp_lc_37_lb
put "Line37=";
$if "%gp_lc_37%"=="no"          put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_37%"=="no"          $goto gpxyzlabel_gp_lc_38_lb
$if "%gp_lc_37%"=="0"           put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_37%"=="0"           $goto gpxyzlabel_gp_lc_38_lb
$if not setglobal gp_lc_37      put '0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_37      $goto gpxyzlabel_gp_lc_38_lb
$if     setglobal gp_lc_37      gp_xyz_ind_col("%gp_lc_37%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 37), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_37      gp_xyz_ind_col("%gp_lc_37%") = no;
$goto gpxyzlabel_gp_lc_38_lb

$label gpxyzlabel_gp_lc_38_lb
put "Line38=";
$if "%gp_lc_38%"=="no"          put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_38%"=="no"          $goto gpxyzlabel_gp_lc_39_lb
$if "%gp_lc_38%"=="0"           put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_38%"=="0"           $goto gpxyzlabel_gp_lc_39_lb
$if not setglobal gp_lc_38      put '0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_38      $goto gpxyzlabel_gp_lc_39_lb
$if     setglobal gp_lc_38      gp_xyz_ind_col("%gp_lc_38%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 38), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_38      gp_xyz_ind_col("%gp_lc_38%") = no;
$goto gpxyzlabel_gp_lc_39_lb

$label gpxyzlabel_gp_lc_39_lb
put "Line39=";
$if "%gp_lc_39%"=="no"          put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_39%"=="no"          $goto gpxyzlabel_gp_lc_40_lb
$if "%gp_lc_39%"=="0"           put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_39%"=="0"           $goto gpxyzlabel_gp_lc_40_lb
$if not setglobal gp_lc_39      put '128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_39      $goto gpxyzlabel_gp_lc_40_lb
$if     setglobal gp_lc_39      gp_xyz_ind_col("%gp_lc_39%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 39), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_39      gp_xyz_ind_col("%gp_lc_39%") = no;
$goto gpxyzlabel_gp_lc_40_lb

$label gpxyzlabel_gp_lc_40_lb
put "Line40=";
$if "%gp_lc_40%"=="no"          put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_40%"=="no"          $goto gpxyzlabel_gp_lc_41_lb
$if "%gp_lc_40%"=="0"           put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if "%gp_lc_40%"=="0"           $goto gpxyzlabel_gp_lc_41_lb
$if not setglobal gp_lc_40      put '0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
$if not setglobal gp_lc_40      $goto gpxyzlabel_gp_lc_41_lb
$if     setglobal gp_lc_40      gp_xyz_ind_col("%gp_lc_40%") = yes;
gp_xyz_ind_col(gp_line_color_name) $sum(gp_xyz_fixed_col,1) = no;
LOOP(gp_line_color_name
 $(gp_xyz_ind_col(gp_line_color_name) or
sum(%gp_scen% $(gp_scencount(%gp_scen%) eq 40), gp_xyz_fixed_col(gp_line_color_name,%gp_scen%))),
 put gp_line_color_name.te(gp_line_color_name);
    );
put ' -',%gp_lwidth%,' -',%gp_lwidth% /;
$if     setglobal gp_lc_40      gp_xyz_ind_col("%gp_lc_40%") = no;
$goto gpxyzlabel_gp_lc_41_lb

$label gpxyzlabel_gp_lc_41_lb

gp_xyz_fixed_col(gp_line_color_name,%gp_scen%) = no;

$goto gpxyzlabel_textopt

$label gpxyzlabel_userwidth
put 'Line1=255 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line2=0 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line3=0 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line4=255 0 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line5=0 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line6=128 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line7=0 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line8=0 0 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line9=128 128 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line10=0 128 64 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line11=128 128 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line12=128 0 128 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line13=192 192 192 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line14=0 255 255 -',%gp_lwidth%,' -',%gp_lwidth% /;
put 'Line15=255 255 0 -',%gp_lwidth%,' -',%gp_lwidth% /;
$goto gpxyzlabel_textopt

$label gpxyzlabel_textopt
put 'TextOrigin=22 22' /;
put 'TextSize=480 321' /;
put 'TextMinimized=0' /;
put 'TextFont=Terminal,9' /;
put 'SysColors=0' /;
putclose;

execute 'if exist "%SysEnv.APPDATA%\wgnuplot.ini" del "%SysEnv.APPDATA%\wgnuplot.ini" >nul';
execute 'copy wgnuplot.ini "%SysEnv.APPDATA%\wgnuplot.ini"';

$goto gpxyzlabel_rungnupl

*_____________________*
*                     *
*       Run Gnuplot   *
*_____________________*
*                     *

$label gpxyzlabel_rungnupl

display "Using terminal: %gp_term%, system: %system.filesys%";

$if not setglobal gp_ppt      $goto gpxyzlabel_after_writing_ppt_file
$if "%gp_ppt%"=="no"          $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("1") = yes;

$if not setglobal gp_ppt_2    $goto gpxyzlabel_after_checking_ppt2
$if not "%gp_ppt_2%"=="2"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt2

$if not setglobal gp_ppt_3    $goto gpxyzlabel_after_checking_ppt3
$if not "%gp_ppt_3%"=="3"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt3

$if not setglobal gp_ppt_4    $goto gpxyzlabel_after_checking_ppt4
$if not "%gp_ppt_4%"=="4"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
ppt_repeat_loop("4") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt4

$if not setglobal gp_ppt_5    $goto gpxyzlabel_after_checking_ppt5
$if not "%gp_ppt_5%"=="5"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
ppt_repeat_loop("4") = yes;
ppt_repeat_loop("5") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt5

$if not setglobal gp_ppt_6    $goto gpxyzlabel_after_checking_ppt6
$if not "%gp_ppt_6%"=="6"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
ppt_repeat_loop("4") = yes;
ppt_repeat_loop("5") = yes;
ppt_repeat_loop("6") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt6

$if not setglobal gp_ppt_7    $goto gpxyzlabel_after_checking_ppt7
$if not "%gp_ppt_7%"=="7"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
ppt_repeat_loop("4") = yes;
ppt_repeat_loop("5") = yes;
ppt_repeat_loop("6") = yes;
ppt_repeat_loop("7") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt7

$if not setglobal gp_ppt_8    $goto gpxyzlabel_after_checking_ppt8
$if not "%gp_ppt_8%"=="8"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
ppt_repeat_loop("4") = yes;
ppt_repeat_loop("5") = yes;
ppt_repeat_loop("6") = yes;
ppt_repeat_loop("7") = yes;
ppt_repeat_loop("8") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt8

$if not setglobal gp_ppt_9    $goto gpxyzlabel_after_checking_ppt9
$if not "%gp_ppt_9%"=="9"     $goto gpxyzlabel_after_writing_ppt_file
ppt_repeat_loop("2") = yes;
ppt_repeat_loop("3") = yes;
ppt_repeat_loop("4") = yes;
ppt_repeat_loop("5") = yes;
ppt_repeat_loop("6") = yes;
ppt_repeat_loop("7") = yes;
ppt_repeat_loop("8") = yes;
ppt_repeat_loop("9") = yes;
$goto gpxyzlabel_after_checking_all_ppt
$label gpxyzlabel_after_checking_ppt9

$label gpxyzlabel_after_checking_all_ppt

* ++++++++++++++++++++++++++ *
* File for Power Point Macro *
* ++++++++++++++++++++++++++ *

PUT  gams_ppt_list;
gams_ppt_list.ap = 1;
gams_ppt_list.nw = 0;
gams_ppt_list.lw = 0;
gams_ppt_list.nd = 0;

$if not setglobal gp_ppt_fontname      $setglobal gp_ppt_fontname Arial
$if not setglobal gp_ppt_fontsize      $setglobal gp_ppt_fontsize 40
$if not setglobal gp_ppt_boldfont      $setglobal gp_ppt_boldfont 0
$if   "%gp_ppt_boldfont%"=="yes"       $setglobal gp_ppt_boldfont 1
$if   "%gp_ppt_boldfont%"=="bold"      $setglobal gp_ppt_boldfont 1
$if   "%gp_ppt_boldfont%"=="no"        $setglobal gp_ppt_boldfont 0
$if   "%gp_ppt_boldfont%"=="normal"    $setglobal gp_ppt_boldfont 0

IF(gpxyzsm_plot_count eq 1,
PUT "%gp_ppt_fontname%" /;
PUT "%gp_ppt_boldfont%" /;
PUT "%gp_ppt_fontsize%" /;
  );

gp_count = 0;
LOOP(ppt_repeat_loop $(gnuplotxyz_ploterror_nodata Lt 0.5),

gp_count = gp_count + 1;

PUT  "%gams.Workdir%%gp_name%_",gpxyzsm_plot_count,"_",ppt_repeat_loop.TL,".%gp_extension%"/;
* Title
$if "%gp_loop1%"   == "no"              $goto gpxyzlabel_noloopppttitle
$if "%gp_loop1%"   == "0"               $goto gpxyzlabel_noloopppttitle
$if     setglobal gp_loop1              $goto gpxyzlabel_ppttitle_loop1

$label gpxyzlabel_noloopppttitle
$if not setglobal gp_title              $goto gpxyzlabel_assign_auto_title_for_ppt
$if "%gp_title%"   == "no"              $goto gpxyzlabel_assign_auto_title_for_ppt
$if "%gp_title%"   == "0"               $goto gpxyzlabel_assign_auto_title_for_ppt
put '%gp_title%';
$goto gpxyzlabel_after_autoppttitle


$label gpxyzlabel_assign_auto_title_for_ppt
$if "%2"==""              put '%1';
$if "%2"==""              $goto gpxyzlabel_skipppttitle
$if not dimension 2 %1    put '%2',' versus ','%3';
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_after_autoppttitle


* Begin powerpoint file loop
* Names for different restart options
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop1
$if not setglobal gp_title                        $setglobal gp_title " "
put "%gp_title% ",%gp_loop1%.te(%gp_loop1%);
$if "%gp_loop2%"   == "no"            $goto gpxyzlabel_no_loop_title_2
$if "%gp_loop2%"   == "0"             $goto gpxyzlabel_no_loop_title_2
$if     setglobal gp_loop2            $goto gpxyzlabel_ppttitle_loop2
$label gpxyzlabel_no_loop_title_2
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop2
put " ",%gp_loop2%.te(%gp_loop2%);
$if "%gp_loop3%"   == "no"            $goto gpxyzlabel_no_loop_title_3
$if "%gp_loop3%"   == "0"             $goto gpxyzlabel_no_loop_title_3
$if     setglobal gp_loop3            $goto gpxyzlabel_ppttitle_loop3
$label gpxyzlabel_no_loop_title_3
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop3
put " ",%gp_loop3%.te(%gp_loop3%);
$if "%gp_loop4%"   == "no"            $goto gpxyzlabel_no_loop_title_4
$if "%gp_loop4%"   == "0"             $goto gpxyzlabel_no_loop_title_4
$if     setglobal gp_loop4            $goto gpxyzlabel_ppttitle_loop4
$label gpxyzlabel_no_loop_title_4
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop4
put " ",%gp_loop4%.te(%gp_loop4%);
$if "%gp_loop5%"   == "no"            $goto gpxyzlabel_no_loop_title_5
$if "%gp_loop5%"   == "0"             $goto gpxyzlabel_no_loop_title_5
$if     setglobal gp_loop5            $goto gpxyzlabel_ppttitle_loop5
$label gpxyzlabel_no_loop_title_5
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop5
put " ",%gp_loop5%.te(%gp_loop5%);
$if "%gp_loop6%"   == "no"            $goto gpxyzlabel_no_loop_title_6
$if "%gp_loop6%"   == "0"             $goto gpxyzlabel_no_loop_title_6
$if     setglobal gp_loop6            $goto gpxyzlabel_ppttitle_loop6
$label gpxyzlabel_no_loop_title_6
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop6
put " ",%gp_loop6%.te(%gp_loop6%);
$if "%gp_loop7%"   == "no"            $goto gpxyzlabel_no_loop_title_7
$if "%gp_loop7%"   == "0"             $goto gpxyzlabel_no_loop_title_7
$if     setglobal gp_loop7            $goto gpxyzlabel_ppttitle_loop7
$label gpxyzlabel_no_loop_title_7
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop7
put " ",%gp_loop7%.te(%gp_loop7%);
$if "%gp_loop8%"   == "no"            $goto gpxyzlabel_no_loop_title_8
$if "%gp_loop8%"   == "0"             $goto gpxyzlabel_no_loop_title_8
$if     setglobal gp_loop8            $goto gpxyzlabel_ppttitle_loop8
$label gpxyzlabel_no_loop_title_8
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop8
put " ",%gp_loop8%.te(%gp_loop8%);
$if "%gp_loop9%"   == "no"            $goto gpxyzlabel_no_loop_title_9
$if "%gp_loop9%"   == "0"             $goto gpxyzlabel_no_loop_title_9
$if     setglobal gp_loop9            $goto gpxyzlabel_ppttitle_loop9
$label gpxyzlabel_no_loop_title_9
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

$label gpxyzlabel_ppttitle_loop9
put " ",%gp_loop9%.te(%gp_loop9%);
$if setglobal gp_ppt_1_name  If(gp_count eq 1, put "%gp_ppt_1_name%"; );
$if setglobal gp_ppt_2_name  If(gp_count eq 2, put "%gp_ppt_2_name%"; );
$if setglobal gp_ppt_3_name  If(gp_count eq 3, put "%gp_ppt_3_name%"; );
$if setglobal gp_ppt_4_name  If(gp_count eq 4, put "%gp_ppt_4_name%"; );
$if setglobal gp_ppt_5_name  If(gp_count eq 5, put "%gp_ppt_5_name%"; );
$if setglobal gp_ppt_6_name  If(gp_count eq 6, put "%gp_ppt_6_name%"; );
$if setglobal gp_ppt_7_name  If(gp_count eq 7, put "%gp_ppt_7_name%"; );
$if setglobal gp_ppt_8_name  If(gp_count eq 8, put "%gp_ppt_8_name%"; );
$if setglobal gp_ppt_9_name  If(gp_count eq 9, put "%gp_ppt_9_name%"; );
put /;
$goto gpxyzlabel_skipppttitle

* End powerpoint file loop



$label gpxyzlabel_skipppttitle

    );
PUTCLOSE;

$label gpxyzlabel_after_writing_ppt_file

$if not setglobal gp_multiplot                         $goto gpxyzlabel_after_multiplot_execute_check
$if '%gp_multiplot%' == 'no'                           $goto gpxyzlabel_after_multiplot_execute_check
$if setglobal gp_multiplot                             $goto gpxyzlabel_finishup
$label gpxyzlabel_after_multiplot_execute_check


* ++++++++++++
* Run gnuplot
* ++++++++++++

$if not setglobal gp_sleep                $setglobal gp_sleep 1

* text window for manual replotting and error finding
$if not setglobal gp_addtextwindow        $setglobal gp_addtextwindow ""
$if "%gp_addtextwindow%"=="no"            $setglobal gp_addtextwindow ""
$if "%gp_addtextwindow%"==""              $goto gpxyzlabel_after_addtextwindow
$if     setglobal gp_addtextwindow        $setglobal gp_addtextwindow "-"
$label gpxyzlabel_after_addtextwindow

$if not "%gp_term%"=="windows"            $goto gpxyzlabel_after_gpwindows_execution
IF(gnuplotxyz_ploterror_nodata Lt 0.5,
execute 'shellexecute wgnuplot.exe -persist gnuplot.inp %gp_addtextwindow%';
);
$goto gpxyzlabel_finishup
$label gpxyzlabel_after_gpwindows_execution

$if not "%gp_term%"=="wxt"                $goto gpxyzlabel_after_gpwxt_execution
IF(gnuplotxyz_ploterror_nodata Lt 0.5,
execute 'shellexecute wgnuplot -persist gnuplot.inp %gp_addtextwindow%';
);
$goto gpxyzlabel_finishup
$label gpxyzlabel_after_gpwxt_execution

IF(gnuplotxyz_ploterror_nodata Lt 0.5,
execute 'gnuplot gnuplot.inp';
);

$goto gpxyzlabel_finishup

$label gpxyzlabel_finishup

$if not setglobal gp_keepname     $setglobal gp_keepname no
$if not "%gp_keepname%" == "no"   $goto gpxyz_after_keepname_check
$dropglobal gp_name
$label gpxyz_after_keepname_check

$if not setglobal gp_fixcolor_set $goto gpxyz_after_gp_fixcolor_reset
$if "%gp_fixcolor_set%" == "no"   $goto gpxyz_after_gp_fixcolor_reset
gp_fixlinecolormap(gp_hex_color_name,%gp_fixcolor_set%) = no;
gp_xyz_fixed_col(gp_hex_color_name,%gp_scen%) = no;
$label gpxyz_after_gp_fixcolor_reset


uu___3("%2")=no;
uu___3("%3")=no;
uu___2(u__2)=no;
uu___1(u__1)=no;
$if not setglobal gp_sleep  $goto after_artificial_sleep
$if "%gp_sleep%"=="0"       $goto after_artificial_sleep
$if "%gp_sleep%"=="no"      $goto after_artificial_sleep
execute "sleep %gp_sleep%";
$label after_artificial_sleep

$offuni

$setglobal gp_l1style "no"
$setglobal gp_l2style "no"
$setglobal gp_l3style "no"
$setglobal gp_l4style "no"
$setglobal gp_l5style "no"
$setglobal gp_l6style "no"
$setglobal gp_l7style "no"
$setglobal gp_l8style "no"
$setglobal gp_l9style "no"
$setglobal gp_l10style "no"
$setglobal gp_l11style "no"
$setglobal gp_l12style "no"
$setglobal gp_l13style "no"
$setglobal gp_l14style "no"
$setglobal gp_l15style "no"
$setglobal gp_l16style "no"

allu2(u__1,u__2) = no;
allu3(u__1,u__2,u__3) = no;
allu4(u__1,u__2,u__3,u__4) = no;

uu___1(u__1)=no;
uu___2(u__2)=no;
uu___3(u__3)=no;
uu___4(u__4)=no;

*$setglobal gp_style no

* end of loop (only if more than 4 dimensions are present)
$if setglobal gpxyz_internalloopactive    );


$label gpxyzlabel_endofgnupltxyz

$if not setglobal ppt_filename   $setglobal ppt_filename gams_slides.pptx
$if "%1"=="compileppt"  execute "%gams.sysdir%inclib\compileppt.exe  %gams.sysdir%inclib\gams_ppt_list.txt %ppt_filename%"

$label gpxyzlabel_totalendofgnupltxyz
$if "%1" == "multiplot"                           $setglobal gp_multiplot no
