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
		call ExAd_fnc_loadVGContent;
	}
	else
	{
		throw "You aren't eligible to access this virtual garage!"
	}
}
catch
{
	["ErrorTitleAndText", ["ExAd - Virtual Garage", _exception]] call ExileClient_gui_toaster_addTemplateToast;
	["extraApps", 1] call ExileClient_gui_xm8_slide
}