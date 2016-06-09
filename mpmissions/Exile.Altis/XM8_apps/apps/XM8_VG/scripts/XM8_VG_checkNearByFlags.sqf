/*
function: XM8_VG_checkNearByFlags
file: XM8_VG\scripts\XM8_VG_checkNearByFlags.sqf

XM8 VG By Jan Babor
Part of the ExAd Virtual Garage script
*/
private ["_flags","_flag"];
_flags = nearestObjects [player,["Exile_Construction_Flag_Static"],150];

try
{
	if(count _flags == 0)exitWith{
		throw "No connetion to a Virtual Garage"
	};

	_flag = _flags select 0;
	if((player distance _flag) > (_flag getVariable ["ExileTerritorySize", 50]))exitWith{
		throw "Weak signal, get closer"
	};

	if((([_flag, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) >= ExAd_VG_ACCESS_LEVEL)then{
		ExAdCurFlagNetId = netId _flag;
		["mainVGSlide", 0] call ExileClient_gui_xm8_slide;
		call XM8_VG_loadContent;
	}
	else
	{
		throw "You aren't eligible to access this virtual garage!"
	}
}
catch
{
	["Whoops", [_exception]] call ExileClient_gui_notification_event_addNotification;
	["sideApps", 1] call ExileClient_gui_xm8_slide
}