// Extracted from A3 Contact DLC Mission (Missions/Intro1.Enoch/Scripts/fakeMap.sqf)

disableserialization;

_display = finddisplay 12;

//--- Set background
(_display displayctrl 510) ctrlsettextcolor [0.05,0.05,0.05,1];

//--- Hide compass
(_display displayctrl 102) ctrlSetModelScale 0;

//--- Create controls
_ctrlGroup = _display displayctrl 270982;
_ctrlGroup ctrlenable false;
ctrlposition _ctrlGroup params ["_posX","_posY","_posW","_posH"];

//--- Map picture
_ctrlMap = _display ctrlcreate ["RscPicture",-1,_ctrlGroup];
_ctrlMap ctrlsettext "\a3\Missions_F_Contact\Data\Img\intro1\mapIcons\intro1_sketched_map_co.paa";
_ctrlMap ctrlsetposition [0,0,_posW,_posH];
_ctrlMap ctrlcommit 0;

{
	_x params ["_pos","_size","_text"];
	_ctrlText = _display ctrlcreate ["RscStructuredText",-1,_ctrlGroup];
	_ctrlText ctrlsetposition [0,0,1,1];
	_ctrlText ctrlcommit 0;
	_ctrlText ctrlsetstructuredtext parsetext format ["<t font='Caveat' shadow='0' color='#cc000000' size='%2' align='center'>%1</t>",localize _text,_size];
	_textW = ctrltextwidth _ctrltext * 1.2;
	_textH = ctrltextheight _ctrltext;
	_ctrlText ctrlsetposition [_posW * (_pos # 0) - _textW / 2,_posH * (_pos # 1) - _textH / 2,_textW,_textH];
	//_ctrlText ctrlsetbackgroundcolor [1,0,1,0.5];
	_ctrlText ctrlcommit 0;
} foreach [
	[	[0.252, 0.220],	2,	"STR_MOVE_N"],
	[	[0.615, 0.710],	1,	"str_a3_c_campaign_callsign_amber"],
	[	[0.277, 0.485],	1,	"str_a3_c_intro1_marker_gauntlet"],
	[	[0.375, 0.580],	1,	"str_a3_c_intro1_marker_alabama"],
	[	[0.515, 0.505],	1,	"str_a3_c_intro1_marker_louisiana"],
	[	[0.630, 0.287],	1,	"str_a3_c_intro1_marker_dakota"],
	[	[0.380, 0.470],	1,	"str_a3_namesound_veh_vehicle_ugv_s"],
	[	[0.625, 0.545],	1,	"str_a3_namesound_veh_vehicle_ugv_s"],
	[	[0.520, 0.465],	1,	"str_a3_c_cfgfactionclasses_ind_e_f0"],
	[	[0.380, 0.300],	1.2,	"str_a3_cfgvehicles_land_factory_main_f0"],
	[	[0.280, 0.666],	2,	"str_cfg_markers_start"]
];