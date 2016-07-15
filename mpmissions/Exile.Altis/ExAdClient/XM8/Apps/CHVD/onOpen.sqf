_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
{
	([_display,"ExAd_CHVD",_x select 0] call ExAd_fnc_getAppCtrl) ctrlSetText format["%1", _x select 1];
} forEach 
[
	["editFootView", str round CHVD_foot],
	["editFootObj", str round CHVD_footObj],
	["editCarView", str round CHVD_car],
	["editCarObj", str round CHVD_carObj],
	["editAirView", str round CHVD_air],
	["editAirObj", str round CHVD_airObj],
	["strTxtFootTerrainEdit", str CHVD_footTerrain],
	["strTxtCarTerrainEdit", str CHVD_carTerrain],
	["strTxtAirTerrainEdit", str CHVD_airTerrain]
];

{	
	private["_ctrl"];
	_ctrl = [_display,"ExAd_CHVD",_x select 0] call ExAd_fnc_getAppCtrl;
	_ctrl sliderSetRange [0, _x select 2];
	_ctrl sliderSetSpeed [500, 500];
	_ctrl sliderSetPosition (_x select 1);
} forEach 
[
	["sliderFootView", CHVD_foot, CHVD_maxView], 
	["sliderFootObj", CHVD_footObj, CHVD_maxObj],
	["sliderCarView", CHVD_car, CHVD_maxView], 
	["sliderCarObj", CHVD_carObj, CHVD_maxObj],
	["sliderAirView", CHVD_air, CHVD_maxView], 
	["sliderAirObj", CHVD_airObj, CHVD_maxObj]
];

{
	([_display,"ExAd_CHVD",_x select 0] call ExAd_fnc_getAppCtrl) cbSetChecked (_x select 1);
} forEach 
[
	["cbFootSyncObj",CHVD_footSyncObj],
	["cbCarSyncObj",CHVD_carSyncObj],
	["cbAirSyncObj",CHVD_airSyncObj]
];

{
	_ctrl = [_display,"ExAd_CHVD",_x select 0] call ExAd_fnc_getAppCtrl;
	if (CHVD_allowNoGrass) then {
		_ctrl lbAdd STR_chvd_low;
	};
	_ctrl lbAdd STR_chvd_standard;
	_ctrl lbAdd STR_chvd_high;
	_ctrl lbAdd STR_chvd_veryHigh;
	
	_sel = [_x select 1] call CHVD_fnc_selTerrainQuality;
	if (CHVD_allowNoGrass) then {
		_ctrl lbSetCurSel _sel;
	} else {
		_ctrl lbSetCurSel (_sel - 1);
	};
} forEach 
[
	["xListFootTerrain",CHVD_footTerrain],
	["xListCarTerrain",CHVD_carTerrain],
	["xListAirTerrain",CHVD_airTerrain]
];

//Edit eventHandlers 
_sliderFootView = [_display,"ExAd_CHVD","sliderFootView"] call ExAd_fnc_getAppCtrl;
_editFootView = [_display,"ExAd_CHVD","editFootView"] call ExAd_fnc_getAppCtrl;
_sliderFootObj = [_display,"ExAd_CHVD","sliderFootObj"] call ExAd_fnc_getAppCtrl;
_editFootObj = [_display,"ExAd_CHVD","editFootObj"] call ExAd_fnc_getAppCtrl;
_cbFootSyncObj = [_display,"ExAd_CHVD","cbFootSyncObj"] call ExAd_fnc_getAppCtrl;

_editFootView ctrlSetEventHandler ["KeyDown", format["['CHVD_foot', %1, _this select 0, 'CHVD_footObj', %2, %3, 'CHVD_footSyncObj'] call CHVD_fnc_onEBinput",ctrlIDC _sliderFootView, ctrlIDC _sliderFootObj, ctrlIDC _editFootObj]];

_editFootObj ctrlSetEventHandler ["KeyDown", format["['CHVD_footObj', %1, _this select 0] call CHVD_fnc_onEBinput", ctrlIDC _sliderFootObj]];

_cbFootSyncObj ctrlSetEventHandler ["CheckedChanged", format["[_this select 1, 'CHVD_footSyncObj', %1, %2, %3, 'CHVD_footObj'] call CHVD_fnc_onCheckedChanged", ctrlIDC _sliderFootObj, ctrlIDC _editFootObj, ctrlIDC _sliderFootView]];

_sliderFootView ctrlSetEventHandler ["SliderPosChanged", format["['CHVD_foot', _this select 0, _this select 1, %1, 'CHVD_footObj', %2, %3, 'CHVD_footSyncObj'] call CHVD_fnc_onSliderChange", ctrlIDC _editFootView, ctrlIDC _sliderFootObj, ctrlIDC _editFootObj]]; 

_sliderFootObj ctrlSetEventHandler ["SliderPosChanged", format["['CHVD_footObj', _this select 0, _this select 1, %1] call CHVD_fnc_onSliderChange", ctrlIDC _editFootObj]]; 


_sliderCarView = [_display,"ExAd_CHVD","sliderCarView"] call ExAd_fnc_getAppCtrl;
_editCarView = [_display,"ExAd_CHVD","editCarView"] call ExAd_fnc_getAppCtrl;
_sliderCarObj = [_display,"ExAd_CHVD","sliderCarObj"] call ExAd_fnc_getAppCtrl;
_editCarObj = [_display,"ExAd_CHVD","editCarObj"] call ExAd_fnc_getAppCtrl;
_cbCarSyncObj = [_display,"ExAd_CHVD","cbCarSyncObj"] call ExAd_fnc_getAppCtrl;

_editCarView ctrlSetEventHandler ["KeyDown", format["['CHVD_car', %1, _this select 0, 'CHVD_carObj', %2, %3, 'CHVD_carSyncObj'] call CHVD_fnc_onEBinput",ctrlIDC _sliderCarView, ctrlIDC _sliderCarObj, ctrlIDC _editCarObj]];

_editCarObj ctrlSetEventHandler ["KeyDown", format["['CHVD_carObj', %1, _this select 0] call CHVD_fnc_onEBinput", ctrlIDC _sliderCarObj]];

_cbCarSyncObj ctrlSetEventHandler ["CheckedChanged", format["[_this select 1, 'CHVD_carSyncObj', %1, %2, %3, 'CHVD_carObj'] call CHVD_fnc_onCheckedChanged", ctrlIDC _sliderCarObj, ctrlIDC _editCarObj, ctrlIDC _sliderCarView]];

_sliderCarView ctrlSetEventHandler ["SliderPosChanged", format["['CHVD_car', _this select 0, _this select 1, %1, 'CHVD_carObj', %2, %3, 'CHVD_carSyncObj'] call CHVD_fnc_onSliderChange", ctrlIDC _editCarView, ctrlIDC _sliderCarObj, ctrlIDC _editCarObj]]; 

_sliderCarObj ctrlSetEventHandler ["SliderPosChanged", format["['CHVD_carObj', _this select 0, _this select 1, %1] call CHVD_fnc_onSliderChange", ctrlIDC _editCarObj]]; 


_sliderAirView = [_display,"ExAd_CHVD","sliderAirView"] call ExAd_fnc_getAppCtrl;
_editAirView = [_display,"ExAd_CHVD","editAirView"] call ExAd_fnc_getAppCtrl;
_sliderAirObj = [_display,"ExAd_CHVD","sliderAirObj"] call ExAd_fnc_getAppCtrl;
_editAirObj = [_display,"ExAd_CHVD","editAirObj"] call ExAd_fnc_getAppCtrl;
_cbAirSyncObj = [_display,"ExAd_CHVD","cbAirSyncObj"] call ExAd_fnc_getAppCtrl;

_editAirView ctrlSetEventHandler ["KeyDown", format["['CHVD_air', %1, _this select 0, 'CHVD_airObj', %2, %3, 'CHVD_airSyncObj'] call CHVD_fnc_onEBinput",ctrlIDC _sliderAirView, ctrlIDC _sliderAirObj, ctrlIDC _editAirObj]];

_editAirObj ctrlSetEventHandler ["KeyDown", format["['CHVD_airObj', %1, _this select 0] call CHVD_fnc_onEBinput", ctrlIDC _sliderAirObj]];

_cbAirSyncObj ctrlSetEventHandler ["CheckedChanged", format["[_this select 1, 'CHVD_airSyncObj', %1, %2, %3, 'CHVD_airObj'] call CHVD_fnc_onCheckedChanged", ctrlIDC _sliderAirObj, ctrlIDC _editAirObj, ctrlIDC _sliderAirView]];

_sliderAirView ctrlSetEventHandler ["SliderPosChanged", format["['CHVD_air', _this select 0, _this select 1, %1, 'CHVD_airObj', %2, %3, 'CHVD_airSyncObj'] call CHVD_fnc_onSliderChange", ctrlIDC _editAirView, ctrlIDC _sliderAirObj, ctrlIDC _editAirObj]]; 

_sliderAirObj ctrlSetEventHandler ["SliderPosChanged", format["['CHVD_airObj', _this select 0, _this select 1, %1] call CHVD_fnc_onSliderChange", ctrlIDC _editAirObj]]; 


{
	_ctrl = [_display,"ExAd_CHVD",_x select 0] call ExAd_fnc_getAppCtrl;
	_handle = _ctrl ctrlSetEventHandler ["LBSelChanged", 
		format ["[_this select 1, '%1', '%2'] call CHVD_fnc_onLBSelChanged", _x select 1, _x select 2]
	];
} forEach 
[
	["xListFootTerrain","CHVD_footTerrain","strTxtFootTerrainEdit"],
	["xListCarTerrain","CHVD_carTerrain","strTxtCarTerrainEdit"],
	["xListAirTerrain","CHVD_airTerrain","strTxtAirTerrainEdit"]
];


_footObj = if(CHVD_footSyncObj)then{false}else{true};
([_display,"ExAd_CHVD","sliderFootObj"] call ExAd_fnc_getAppCtrl) ctrlEnable _footObj;
([_display,"ExAd_CHVD","editFootObj"] call ExAd_fnc_getAppCtrl) ctrlEnable _footObj;

_carObj = if(CHVD_carSyncObj)then{false}else{true};
([_display,"ExAd_CHVD","sliderCarObj"] call ExAd_fnc_getAppCtrl) ctrlEnable _carObj;
([_display,"ExAd_CHVD","editCarObj"] call ExAd_fnc_getAppCtrl) ctrlEnable _carObj;

_airObj = if(CHVD_airSyncObj)then{false}else{true};
([_display,"ExAd_CHVD","sliderAirObj"] call ExAd_fnc_getAppCtrl) ctrlEnable _airObj;
([_display,"ExAd_CHVD","editAirObj"] call ExAd_fnc_getAppCtrl) ctrlEnable _airObj;
