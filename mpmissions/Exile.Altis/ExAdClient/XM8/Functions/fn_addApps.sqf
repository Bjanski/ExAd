/*  
	fn_addApps.sqf

	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/
private["_apps","_idc","_title","_display"];

_apps = getArray(missionConfigFile >> "CfgXM8" >> "extraApps");
if(count _apps == 0)exitWith{false};

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

if(isNil "ExAd_XM8_FIRST_IDC") then {
	private ["_continue","_idc"];
	_continue = true;
	_idc = 5001;
	while{ _continue } do {
		_ctrl = _display displayCtrl _idc; 
		if(ctrlText _ctrl == "")then{
			_continue = false;
			ExAd_XM8_FIRST_IDC = _idc;
		}else{
			_idc = _idc + 1;
		}
	};
};

_idc = ExAd_XM8_FIRST_IDC;

_pW = 0.025; _pH = 0.04;
_slide = ctrlParentControlsGroup (_display displayCtrl _idc);	
_lastPos = [];
{
	private["_ctrl","_pos","_logo","_function"];
	_ctrl = _display displayCtrl _idc;
	
	if(isNull _ctrl)then{
		_ctrl = _display ctrlCreate ["RscExileXM8AppButton1x1",_idc,_slide];
		_xPos = if( (_lastPos select 0) == (30 - 3) * (0.025) ) then { (4 - 3) * (0.025) } else {  (_lastPos select 0) + ( 6.5 * 0.025 ) };
		_yPos = if( (_lastPos select 0) == (30 - 3) * (0.025) ) then {
			//Move Go Back button
			/*
			_goBackIdc = -1;
			_goBackCtrl = _display displayCtrl _goBackIdc;
			_goBackPos = ctrlPosition _goBackCtrl;
			_goBackPos set [2, (_goBackPos select 1) + ( 5.5 * 0.04)];
			_goBackCtrl ctrlSetPosition _pos;
			_goBackCtrl ctrlCommit 0;
			*/
			(_lastPos select 1) + ( 5.5 * 0.04 ) 
		} else {  (_lastPos select 1) };

		_pos = [ _xPos , _yPos, _lastPos select 2, _lastPos select 3];
		_ctrl ctrlSetPosition _pos;
		_ctrl ctrlCommit 0;
	} else {
		_pos = ctrlPosition _ctrl;
	};
		
	_logo = if(isText(missionConfigFile >> "CfgXM8" >> _x >> "logo"))then{getText(missionConfigFile >> "CfgXM8" >> _x >> "logo")}else{"ExAdClient\Core\Img\logo.paa"};	
	[_display,_slide,([_x,format["AppIcon%1",_idc]] call ExAd_fnc_getNextIDC),[(_pos select 0) + 1.5 * _pW, (_pos select 1) + 0.625 * _pH, 3 * _pW, 3 * _pH],_logo,[1,1,1,1],false,true,""] call ExAd_fnc_createPicture;
	
	_ctrl ctrlSetText getText(missionConfigFile >> "CfgXM8" >> _x >> "title");
	_function = if(isText(missionConfigFile >> "CfgXM8" >> _x >> "quickFunction"))then{
		getText(missionConfigFile >> "CfgXM8" >> _x >> "quickFunction")
	} else {format["['%1', 0] call ExileClient_gui_xm8_slide",_x]};
	_ctrl ctrlSetEventHandler ["ButtonClick", _function];

	_lastPos = _pos;
	_idc = _idc + 1;
}forEach _apps;

true