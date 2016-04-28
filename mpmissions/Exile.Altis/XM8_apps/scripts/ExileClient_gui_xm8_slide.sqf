/**
 * ExileClient_gui_xm8_slide
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * 
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
// XM8 apps Imporeved by vitaly'mind'chizhikov
// Based on idea XM8 apps by Shix. see http://www.exilemod.com/topic/9040-xm8-apps/?page=1
// Original function from Exile 0.9.6

private["_try","_toSlideName","_direction","_display","_toSlideControlID","_toSlideControl","_toSlideTitle","_titleControl","_toSlideOpenFunction","_fromSlideControlID","_fromSlideControl","_fromSlideCloseFunction"];
disableSerialization;
_toSlideName = _this select 0;
_direction = _this select 1;
_display = displayNull;
if !(ExileClientXM8CurrentSlide isEqualTo _toSlideName) then
{
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_toSlideControlID = getNumber (configFile >> "CfgXM8" >> _toSlideName >> "controlID");
	
	//Lets try read MissionConfig, maybe we have custom slide
	_try = (missionConfigFile >> "CfgXM8" >> _toSlideName >> "controlID") call BIS_fnc_getCfgData;
	if (!isNil "_try") then {_toSlideControlID = _try};

	_toSlideControl = _display displayCtrl _toSlideControlID;
	_toSlideTitle = getText (configFile >> "CfgXM8" >> _toSlideName >> "title");
	
	//Lets try read MissionConfig, maybe we have custom slide
	_try = (missionConfigFile >> "CfgXM8" >> _toSlideName >> "title") call BIS_fnc_getCfgData;
	if (!isNil "_try") then {_toSlideTitle = _try};

	_titleControl = _display displayCtrl 4004;
	_titleControl ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>%1</t>", _toSlideTitle]));
	_toSlideOpenFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onOpen", _toSlideName], ""];
	if !(_toSlideOpenFunction isEqualTo "") then
	{
		call _toSlideOpenFunction;
	};
	_fromSlideControlID = getNumber (configFile >> "CfgXM8" >> ExileClientXM8CurrentSlide >> "controlID");
	
	//Lets try read MissionConfig, maybe we have custom slide
	_try = (missionConfigFile >> "CfgXM8" >> ExileClientXM8CurrentSlide >> "controlID") call BIS_fnc_getCfgData;
	if (!isNil "_try") then {_fromSlideControlID = _try};

	_fromSlideControl = _display displayCtrl _fromSlideControlID;
	_fromSlideCloseFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onClose", ExileClientXM8CurrentSlide], ""];
	if !(_fromSlideCloseFunction isEqualTo "") then
	{
		call _fromSlideCloseFunction;
	};
	if (_direction isEqualTo 0) then
	{
		_toSlideControl ctrlSetPosition [(19 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlShow true;
		_toSlideControl ctrlCommit 0;
		_toSlideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlCommit 0.25;
		_fromSlideControl ctrlSetPosition [(-19 * 0.05), (0 * 0.05)];
		_fromSlideControl ctrlCommit 0.25;
	}
	else 
	{
		_toSlideControl ctrlSetPosition [(-19 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlShow true;
		_toSlideControl ctrlCommit 0;
		_toSlideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_toSlideControl ctrlCommit 0.25;
		_fromSlideControl ctrlSetPosition [(19 * 0.05), (0 * 0.05)];
		_fromSlideControl ctrlCommit 0.25;
	};
	ExileClientXM8CurrentSlide = _toSlideName;
};

//Lets hide old territory button, as we already made new one early on in ExileClient_gui_xm8_show.
//Why we make new? Because if button is re-possition it will render picture (textureNoShortcut) incorrectly.
private ["_sliders","_appSlide","_oldTerritoryBut"];
_sliders = _display displayCtrl 4007;
_appSlide = _sliders controlsGroupCtrl 4040;
_oldTerritoryBut = _appSlide controlsGroupCtrl 1113;
_oldTerritoryBut ctrlShow false;
_oldTerritoryBut ctrlSetFade 0;
_oldTerritoryBut ctrlCommit 0;