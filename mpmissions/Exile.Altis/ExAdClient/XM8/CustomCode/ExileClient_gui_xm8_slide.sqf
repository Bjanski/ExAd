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
 
private["_toSlideName","_direction","_display","_toSlideControlID","_toSlideControl","_toSlideTitle","_titleControl","_toSlideOpenFunction","_fromSlideControlID","_fromSlideControl","_fromSlideCloseFunction"];
disableSerialization;
_toSlideName = _this select 0;
_direction = _this select 1;

if !(ExileClientXM8CurrentSlide isEqualTo _toSlideName) then
{
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	
	//ExAd Manipulate the source of config data
	_src = if(isClass(configFile >> "CfgXM8" >> _toSlideName))then{configFile}else{missionConfigFile};
	_toSlideControlID = getNumber (_src >> "CfgXM8" >> _toSlideName >> "controlID");
	_toSlideControl = _display displayCtrl _toSlideControlID;
	
	_toSlideTitle = getText (_src >> "CfgXM8" >> _toSlideName >> "title");
	
	_titleControl = _display displayCtrl 4004;
	_titleControl ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>%1</t>", _toSlideTitle]));
	_toSlideOpenFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onOpen", _toSlideName], ""];
	if !(_toSlideOpenFunction isEqualTo "") then
	{
		call _toSlideOpenFunction;
	};
	
	//ExAd Load Apps 
	if(toLower _toSlideName == 'extraapps')then{
		call ExAd_fnc_addApps;
	};
	//ExAd Manipulating the source of config data
	_src2 = if(isClass(configFile >> "CfgXM8" >> ExileClientXM8CurrentSlide))then{configFile}else{missionConfigFile};
	_fromSlideControlID = getNumber(_src2 >> "CfgXM8" >> ExileClientXM8CurrentSlide >> "controlID");
	
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