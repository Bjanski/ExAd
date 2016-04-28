/*	
	XM8 VG app by Jan Babor
	
	Virtual Garage app that works with the ExAd Virtual Garage plugin. 
	
	file: XM8_emptyApp\scripts\XM8_VG_mainVGSlide_onLoad.sqf
	function: XM8_VG_mainVGSlide_onLoad
*/
private ["_makeButton","_makeBackground","_makeStructuredText","_makePicture","_makeList","_getNextIDC","_pW","_pH","_display","_slides","_unloadScript","_error","_thisSlide"];

_makeButton = {
	params ["_parent","_idc","_position","_action","_text","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscButtonMenu",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetEventHandler ["ButtonClick",_action];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_makeBackgroundGUI = {
	params ["_parent","_idc","_position"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscBackgroundGUI", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetBackgroundColor [0,0,0,0.5];
	_ctrl;
};

_makeFrame = {
	params ["_parent","_idc","_position"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscFrame", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_makeStructuredText = {
	params ["_parent","_idc","_position","_text","_font","_size","_color","_align","_shadow"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscStructuredText", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_makePicture = {
	params ["_parent","_idc","_position","_picture","_color","_enable","_keepAspect","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate [(if (_keepAspect) then {"RscPictureKeepAspect"} else {"RscPicture"}), _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetText _picture;
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlEnable _enable;
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_makeList = {
	params ["_parent","_idc","_position","_actionOnSelChanged","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscListBox",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetEventHandler ["LBSelChanged",_actionOnSelChanged];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_makeCheckBox = {
	params ["_parent","_idc","_position","_actionOnSelChanged","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscCheckBox",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetEventHandler ["CheckedChanged",_actionOnSelChanged];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_getNextIDC = {
	params ["_key"];
	private ["_slideClassName","_baseIDC","_result","_map"];
	_slideClassName = "mainVGSlide";
	_map = XM8_VG_mainVGSlideIDCmap;
	_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID");
	_result = _baseIDC + (_map pushBack _key);
	_result;
};

_pW = 0.025;
_pH = 0.04;
_leftCol = 1;
_leftColW = 12.8;
_rightCol = _leftCol + _leftColW + 2;
_rightColW = _leftColW + 3;
_margin = 0.2;

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 VG app, display is null"; systemChat _error; diag_log _error;};
_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 VG app, slides control is null"; systemChat _error; diag_log _error;};

_unloadScript = '
	ExAd_Cur_Flag_NetId = nil;
';
_display displayAddEventHandler ["unload",_unloadScript];

XM8_VG_mainVGSlideIDCmap = [];

_thisSlide = _display ctrlCreate ["RscExileXM8Slide",("mainVGSlide" call _getNextIDC),_slides];

[_thisSlide,("backButton" call _getNextIDC),[27.6 * _pW, 17.7 * _pH, 6 * _pW, 1 * _pH],'["sideApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK",""] call _makeButton;

/*Stored Vehicle Details*/
[_thisSlide,("InfoTitle" call _getNextIDC),[_rightCol * _pW, 2.75 * _pH, _rightColW * _pW, 1 * _pH],"Stored Vehicle Detail","PuristaMedium",1.2,"#ffffff","left",1] call _makeStructuredText;

[_thisSlide,("InfoBgBox" call _getNextIDC),[_rightCol * _pW, 4 * _pH, _rightColW * _pW, 13.5 * _pH]] call _makeBackgroundGUI;

_idcInfoPic = "InfoPic" call _getNextIDC;
[_thisSlide,_idcInfoPic,[(_rightCol + 9) * _pW, 4 * _pH, 6.75 * _pW, 5.5 * _pH],"",[1,1,1,1],false,true,""] call _makePicture;

_idcInfoStr = "InfoVehStr" call _getNextIDC;
[_thisSlide,_idcInfoStr,[(_rightCol + _margin) * _pW, (4 + _margin) * _pH, (_rightColW - 2 * _margin) * _pW, (13.5 - 2 * _margin) * _pH],"","PuristaMedium",0.75,"#ffffff","left",1] call _makeStructuredText;

[_thisSlide,("InfoCBStr" call _getNextIDC),[(_rightCol + _margin + 0.4) * _pW, (16.5 - _margin + 0.25	) * _pH, (_rightColW - 2 * _margin) * _pW, (13.5 - 2 * _margin) * _pH],"Stream friendly UI","PuristaMedium",0.65,"#ffffff","left",1] call _makeStructuredText;

[_thisSlide,("InfoCB" call _getNextIDC),[(_rightCol + _margin) * _pW, (16.5 - _margin + 0.2) * _pH, 0.75 * _pW, 0.75 * _pH],'profileNamespace setVariable["ExAd_StreamFriendlyUI",_this select 1]',"Toogle - Stream friendly UI"] call _makeCheckBox;

/*Stored Vehicles*/
[_thisSlide,("SubTitle1" call _getNextIDC),[_leftCol * _pW, 2.75 * _pH, _leftColW * _pW, 1 * _pH],"Stored","PuristaMedium",1.2,"#ffffff","left",1] call _makeStructuredText;

[_thisSlide,("SubTitle1Cnt" call _getNextIDC),[_leftCol * _pW, 3 * _pH, _leftColW * _pW, 1 * _pH],"","PuristaMedium",1,"#ffffff","right",1] call _makeStructuredText;

_idcStoredVehList = "StoreVehList" call _getNextIDC;
[_thisSlide,_idcStoredVehList,[_leftCol * _pW, 4 * _pH, _leftColW * _pW, 5 * _pH],format["[_this select 0,%1,%2] call XM8_VG_elChanged",_idcInfoPic,_idcInfoStr],""] call _makeList;

[_thisSlide,("fetchButton" call _getNextIDC),[_leftCol*_pW, 9*_pH, _leftColW*_pW, 1*_pH],format["disableUserInput true;['VGLoad', %1] call ExAd_fnc_onBtnClickVG",_idcStoredVehList],"Fetch",""] call _makeButton;

/*Nearby vehicles*/
[_thisSlide,("SubTitle2" call _getNextIDC),[_leftCol * _pW, 10.25 * _pH, _leftColW * _pW, 1 * _pH],"In Radius","PuristaMedium",1.2,"#ffffff","left",1] call _makeStructuredText;

_idcNearVehList = "NearVehicleList" call _getNextIDC;
[_thisSlide,_idcNearVehList,[_leftCol * _pW, 11.5 * _pH, _leftColW * _pW, 5 * _pH],"",""] call _makeList;

[_thisSlide,("storeButton" call _getNextIDC),[_leftCol * _pW, 16.5 * _pH, _leftColW * _pW, 1 * _pH],format["if(call ExAd_fnc_allowVGStore)then{disableUserInput true;['VGStore', %1] call ExAd_fnc_onBtnClickVG}else{['Whoops', ['%2']] call ExileClient_gui_notification_event_addNotification}",_idcNearVehList,localize "STR_ExAd_VIRTUALGARAGE_NOTI_FULL"],"Store",""] call _makeButton;
