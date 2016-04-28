/**
* ExileClient_gui_xm8_show
*
* Exile Mod
* www.exilemod.com
* © 2015 Exile Mod Team
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
 
/* 
	XM8 apps Imporeved by vitaly'mind'chizhikov
	Based on idea XM8 apps by Shix. see http://www.exilemod.com/topic/9040-xm8-apps/?page=1
	Original function from Exile 0.9.6
*/
 
private["_display","_control","_slideControlID","_slideName","_slideTitle","_slideControl","_titleControl","_toSlideOpenFunction","_hideSideApps"];
disableSerialization;
createDialog "RscExileXM8";
ExileClientXM8IsVisible = true;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (ExileClientXM8IsPowerOn) then {
	_control = _display displayCtrl 4002;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;
} else {
	{
		_control = _display displayCtrl _x;
		_control ctrlSetFade 1;
		_control ctrlCommit 0;
	} forEach [4002,4003,4004,4005,4007,4001,4010,4030,4020];
};
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
if (ExileClientXM8CurrentSlide isEqualTo "party") then {
	if (ExileClientPartyID isEqualTo -1) then {
		ExileClientXM8CurrentSlide = "apps";
	};
};

private ["_sliders","_appSlide","_newTerritoryBut","_newTerritoryPic","_sideAppsBut","_sideAppsPic","_newSliderIDC","_newSlider","_buttonBack",
"_makeButtonCtrl","_pW","_pH"];
_pW = 0.025;
_pH = 0.04;
_sliders = _display displayCtrl 4007;
_appSlide = _sliders controlsGroupCtrl 4040;

//Lets create XM8_apps slide manually, as we are unable to change RscExileXM8 directly in config.
_newSliderIDC = getNumber (missionConfigFile >> "CfgXM8" >> "sideApps" >> "controlID");
_newSlider = _display ctrlCreate ["RscExileXM8Slide", _newSliderIDC, _sliders];

//Lets fill our slider with contents. First lets make go back button
_buttonBack = _display ctrlCreate ["RscButtonMenu",_newSliderIDC + 1,_newSlider];
_buttonBack ctrlSetPosition [27.6*_pW,17.7*_pH,6*_pW,1*_pH];
_buttonBack ctrlSetText "GO BACK";
_buttonBack ctrlSetEventHandler ["ButtonClick","['apps', 1] call ExileClient_gui_xm8_slide"];
_buttonBack ctrlCommit 0;

//We hide sideApps in order to be compatible with legacy apps.
_hideSideApps = '
	disableSerialization;
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	_sliders = _display displayCtrl 4007;
	_sideAppsIDC = getNumber (missionConfigFile >> "CfgXM8" >> "sideApps" >> "controlID");
	_appSlide = _display displayCtrl _sideAppsIDC;
	_appSlide ctrlShow false;
	_appSlide ctrlCommit 0;
';

//We make app buttons with this function
_makeButtonCtrl = {
	params ["_idc","_pos","_text","_script","_parent","_pic","_compatible"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscExileXM8AppButton1x1",_idc,_parent];
	_ctrl ctrlSetPosition [_pos select 0,_pos select 1,6 * _pW, 4.8 * _pH];
	_ctrl ctrlSetText _text;
	if (!_compatible) then {
		_ctrl ctrlSetEventHandler ["ButtonClick",_hideSideApps];

	} else {
		_ctrl ctrlSetEventHandler ["ButtonClick",""];
	};
	_ctrl ctrlAddEventHandler ["ButtonClick",format ["call %1",_script]];
	_ctrl ctrlCommit 0;
	
	_ctrl = _display ctrlCreate ["RscPictureKeepAspect",-1,_parent];
	_ctrl ctrlSetText _pic;
	_ctrl ctrlSetPosition [_pos select 0,(_pos select 1) + 0.01,6 * _pW, 2.8 * _pH];
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
};
//Lets try to create 15 buttons, if some buttons in XM8_apps_config are commented, they will be scipped

for "_i" from 1 to 15 do {
	private ["_pos", "_data"];
	if (!isNil (format ["XM8_apps_app%1", _i])) then {
		_data = call compile format ["XM8_apps_app%1", _i];
		_pos = [0,0];
		if (_i in [1,2,3,4,5]) then {
			_pos set [0, (0.4 + ((_i-1) * 6.8)) * _pW];
			_pos set [1, 2 * _pH];
		};
		if (_i in [6,7,8,9,10]) then {
			_pos set [0, (0.4 + (((_i-1) - 5) * 6.8)) * _pW];
			_pos set [1, 7.2 * _pH];
		};
		if (_i in [11,12,13,14,15]) then {
			_pos set [0, (0.4 + (((_i-1) - 10) * 6.8)) * _pW];
			_pos set [1, 12.4 * _pH];
		};
		[(_newSliderIDC + 1 + _i) ,_pos,(_data select 0),str(_data select 2),_newSlider,(_data select 1),(_data select 3)] call _makeButtonCtrl;
	};
};

/* 
We need some space to put XM8_apps button, for that lets cut territory button in half.
In fact we cant re-possition button as it will render picture (textureNoShortcut) incorrectly.
So lets make new 'territory' button, smaller then original one.
We will hide old button in ExileClient_gui_xm8_slide_apps_onOpen and ExileClient_gui_xm8_slide
*/
_newTerritoryBut = _display ctrlCreate ["RscExileXM8AppButton1x1",(_newSliderIDC + 15),_appSlide];
_newTerritoryBut ctrlSetPosition [(23.5 - 3) * _pW,(9.5 - 2) * _pH,6 * _pW, 5 * _pH];
_newTerritoryBut ctrlSetText getText (configFile >> "CfgXM8" >> "territory" >> "title");
_newTerritoryBut ctrlSetEventHandler ["ButtonClick","['territory', 0] call ExileClient_gui_xm8_slide"];
_newTerritoryBut ctrlCommit 0;
_newTerritoryPic = _display ctrlCreate ["RscPictureKeepAspect",(_newSliderIDC + 17),_appSlide];
_newTerritoryPic ctrlSetText "\exile_assets\texture\ui\xm8_app_territory_ca.paa";
_newTerritoryPic ctrlSetPosition [(25 - 3) * _pW,(10 - 2) * _pH,(6 * _pW) * 0.5, (5 * _pH) * 0.5];
_newTerritoryPic ctrlEnable false;
_newTerritoryPic ctrlCommit 0;

//Now lets make New button for XM8_apps inside app slider.
_sideAppsBut = _display ctrlCreate ["RscExileXM8AppButton1x1",(_newSliderIDC + 16),_appSlide];
_sideAppsBut ctrlSetPosition [(30 - 3) * _pW,(9.5 - 2) * _pH,6 * _pW, 5 * _pH];
_sideAppsBut ctrlSetText getText (missionConfigFile >> "CfgXM8" >> "sideApps" >> "title");
_sideAppsBut ctrlSetEventHandler ["ButtonClick","['sideApps', 0] call ExileClient_gui_xm8_slide"];
_sideAppsBut ctrlCommit 0;
_sideAppsPic = _display ctrlCreate ["RscPictureKeepAspect",(_newSliderIDC + 18),_appSlide];
_sideAppsPic ctrlSetText format ["%1%2",XM8_apps_folderPath, "XM8_apps\icons\apps_icon.paa"];
_sideAppsPic ctrlSetPosition [(31.5 - 3) * _pW,(10 - 2) * _pH,(6 * _pW) * 0.5, (5 * _pH) * 0.5];
_sideAppsPic ctrlEnable false;
_sideAppsPic ctrlCommit 0;

{
	//We dont have configured slides, thus we create it via scripting. We do that by executing slide creating scripts.
	_slideOnLoadScript = getText (_x >> "onLoadScript");
	if (!isNil "_slideOnLoadScript") then {
		call compile preprocessFileLineNumbers _slideOnLoadScript;
	};
	
	_slideControlID = getNumber (_x >> "controlID");
	_slideName = configName _x;
	_slideTitle = getText (_x >> "title");
	_slideControl = _display displayCtrl _slideControlID;
	if (_slideName isEqualTo ExileClientXM8CurrentSlide) then {
		_titleControl = _display displayCtrl 4004;
		_titleControl ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>%1</t>", _slideTitle]));
		_slideControl ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
		_slideControl ctrlCommit 0;
		_slideControl ctrlShow true;
		_toSlideOpenFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onOpen", _slideName], ""];
		if !(_toSlideOpenFunction isEqualTo "") then
		{
			call _toSlideOpenFunction;
		};
	} else {
		_slideControl ctrlShow false;
	};
} forEach (("true" configClasses (configFile >> "CfgXM8")) + ("true" configClasses (missionConfigFile >> "CfgXM8")));
/* 
Lets read missionConfigFile as well, as we may have custom slides added.
forEach ("true" configClasses (configFile >> "CfgXM8")); //Original line
*/
ExileXM8ThreadHandle = [10, ExileClient_gui_xm8_thread_update, [], true] call ExileClient_system_thread_addtask;
call ExileClient_gui_xm8_thread_update;
