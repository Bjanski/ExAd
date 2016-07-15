
CHVD_allowNoGrass = true; 	//TRUE||FALSE

CHVD_maxView = 12000; 		//0-12000

CHVD_maxObj = 12000; 		//0-12000


/*/////////////////////////////////////////////////////////////////////////////////////
//////DON'T TOUCH ANYTHING BELLOW THIS HERE	IF YOU DON'T KNOW WHAT YOU ARE DOING //////
/////////////////////////////////////////////////////////////////////////////////////*/

{
	_x call ExAd_fnc_localize;
}forEach 
[
	["STR_chvd_title","View Distance Settings"],["STR_chvd_foot","ON FOOT"],["STR_chvd_car","IN CAR"],["STR_chvd_air","IN AIR"],["STR_chvd_view","VIEW"],["STR_chvd_object","OBJECT"],["STR_chvd_terrain","TERRAIN"],["STR_chvd_sync","Sync object with view"],["STR_chvd_close",""],["STR_chvd_low","Low"],["STR_chvd_standard","Standard"],["STR_chvd_high","High"],["STR_chvd_veryHigh","Very High"]
];

["STR_chvd_title","View Distance Settings"] call ExAd_fnc_localize;

{
    _code = '';
    _function = _x select 0;
    _file = format["ExAdClient\XM8\Apps\CHVD\Functions\%1", _x select 1];

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach
[
	["CHVD_fnc_onCheckedChanged", 	"fn_onCheckedChanged.sqf"],
	["CHVD_fnc_onSliderChange", 	"fn_onSliderChange.sqf"],
	["CHVD_fnc_onLBSelChanged", 	"fn_onLBSelChanged.sqf"],
	["CHVD_fnc_onEBinput", 			"fn_onEBinput.sqf"],
	["CHVD_fnc_onEBterrainInput", 	"fn_onEBterrainInput.sqf"],
	["CHVD_fnc_selTerrainQuality", 	"fn_selTerrainQuality.sqf"],
	["CHVD_fnc_updateTerrain", 		"fn_updateTerrain.sqf"],
	["CHVD_fnc_updateSettings", 	"fn_updateSettings.sqf"]
];


[] spawn {
	CHVD_scriptRunning = true;
	//Wait for mission init, in case there are variables defined some place else
	waitUntil {time > 0 && !isNil "ExileClientPlayerIsSpawned"};
	
	//Define variables, load from profileNamespace
	CHVD_allowNoGrass = if (isNil "CHVD_allowNoGrass") then {true} else {CHVD_allowNoGrass};
	CHVD_maxView = if (isNil "CHVD_maxView") then {12000} else {CHVD_maxView};
	CHVD_maxObj = if (isNil "CHVD_maxObj") then {12000} else {CHVD_maxObj};

	CHVD_footSyncObj = profileNamespace getVariable ["CHVD_footSyncObj",false];
	CHVD_carSyncObj = profileNamespace getVariable ["CHVD_carSyncObj",false];
	CHVD_airSyncObj = profileNamespace getVariable ["CHVD_airSyncObj",false];

	CHVD_foot = (profileNamespace getVariable ["CHVD_foot",viewDistance]) min CHVD_maxView;
	CHVD_car = (profileNamespace getVariable ["CHVD_car",viewDistance]) min CHVD_maxView;
	CHVD_air = (profileNamespace getVariable ["CHVD_air",viewDistance]) min CHVD_maxView;

	CHVD_footObj = (profileNamespace getVariable ["CHVD_footObj",viewDistance]) min CHVD_maxObj;
	CHVD_carObj = (profileNamespace getVariable ["CHVD_carObj",viewDistance]) min CHVD_maxObj;
	CHVD_airObj = (profileNamespace getVariable ["CHVD_airObj",viewDistance]) min CHVD_maxObj;

	CHVD_footTerrain = if (CHVD_allowNoGrass) then {profileNamespace getVariable ["CHVD_footTerrain",25]} else {(profileNamespace getVariable ["CHVD_footTerrain",25]) min 48.99 max 3.125};
	CHVD_carTerrain = if (CHVD_allowNoGrass) then {profileNamespace getVariable ["CHVD_carTerrain",25]} else {(profileNamespace getVariable ["CHVD_carTerrain",25]) min 48.99 max 3.125};
	CHVD_airTerrain = if (CHVD_allowNoGrass) then {profileNamespace getVariable ["CHVD_airTerrain",25]} else {(profileNamespace getVariable ["CHVD_airTerrain",25]) min 48.99 max 3.125};

	//Begin initialization
	waitUntil {!isNull player};
	waitUntil {!isNull findDisplay 46};

	//Detect when to change setting type
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			[nil, false] call CHVD_fnc_updateSettings;
			_currentVehicle = vehicle player;
			waitUntil {_currentVehicle != vehicle player};
		};
	};	
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			waitUntil {UAVControl (getConnectedUAV player) select 1 != ""};
			[nil, true] call CHVD_fnc_updateSettings;
			waitUntil {UAVControl (getConnectedUAV player) select 1 == ""};
			[nil, false] call CHVD_fnc_updateSettings;
		};
	};
};
