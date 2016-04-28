/*	
	XM8 VG app by Jan Babor
	
	file: XM8_VG\scripts\XM8_VG_init.sqf
	
	This script will be executed once, when player login. It is executed straight from initLocalPlayer.sqf.
	This is best place to compile functions, define global variables and read gonfiguration files used in app.
*/

params ["_pathToAppFolder"];

XM8_VG_mainVGSlideIDCmap = [];

{
	if (isNil _x) then {
		private ["_code"];
		_code = compileFinal (preprocessFileLineNumbers (format (["%1scripts\%2.sqf",_pathToAppFolder,_x])));
		if (isNil "_code") then {_code = compileFinal ""};
		missionNamespace setVariable [_x, _code];
	};
} forEach [
	"XM8_VG_mainVGSlide_onLoad",
	"XM8_VG_checkNearByFlags",
	"XM8_VG_loadContent"
];

call compile preProcessFileLineNumbers format ["%1XM8_VG_config.sqf",_pathToAppFolder];