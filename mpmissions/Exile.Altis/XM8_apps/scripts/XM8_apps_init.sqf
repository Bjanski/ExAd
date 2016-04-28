/*
	Improved XM8 apps by vitaly'mind'chizhikov
	Original idea by Shix.
*/

params ["_pathToFolder"];

//Setting path to app
XM8_apps_folderPath = _pathToFolder;

//Apply config
call compile preprocessFileLineNumbers format ["%1XM8_apps\XM8_apps_config.sqf",_pathToFolder];

//Run init scripts for those apps that made for Improved XM8 apps (not legacy apps)
for "_i" from 1 to 15 do {
	private ["_pos", "_data"];
	if (!isNil (format ["XM8_apps_app%1", _i])) then {
		_data = call compile format ["XM8_apps_app%1", _i];
		if (_data select 3) then {
			_arr = (_data select 4) splitString "\";  
			_arr resize ((count _arr) - 2);
			((_arr joinString "\") + "\") call compile preprocessFileLineNumbers (_data select 4);
		} else {
			
		};
	};
};

