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
private["_apps","_count","_title","_display"];

_apps = getArray(missionConfigFile >> "CfgXM8" >> "extraApps");
if(count _apps == 0)exitWith{false};

_count = 10;
_count2 = 5000;
_title = "ExAd";

while {_title != ""} do 
{
	_count = _count + 1;
	_count2 = _count2 + 1;
	_count = if(_count > 15)then{
		if(_count > 25)then{
			if(_count < 31)then{31}else{_count}
		}else{
			if(_count < 21)then{21}else{_count}
		}
	}else{
		_count
	};
	_title = getText(configFile >> "RscExileXM8" >> "Controls" >> "Slides" >> "Controls" >>"SlideExtraApps" >> "Controls" >> format["App%1", _count] >> "text");
};

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_pW = 0.025; _pH = 0.04;

{
	private["_ctrl","_pos","_logo"];
	_ctrl = (_display displayCtrl _count2);
	_pos = ctrlPosition _ctrl;
	_slide = ctrlParentControlsGroup _ctrl;
	
	_logo = if(isText(missionConfigFile >> "CfgXM8" >> _x >> "logo"))then{getText(missionConfigFile >> "CfgXM8" >> _x >> "logo")}else{"ExAdClient\Core\Img\logo.paa"};	
	[_display,_slide,([_x,format["AppIcon%1",_count2]] call ExAd_fnc_getNextIDC),[(_pos select 0) + 1.5 * _pW, (_pos select 1) + 0.625 * _pH, 3 * _pW, 3 * _pH],_logo,[1,1,1,1],false,true,""] call ExAd_fnc_createPicture;
	
	_ctrl ctrlSetText getText(missionConfigFile >> "CfgXM8" >> _x >> "title");
	_function = if(isText(missionConfigFile >> "CfgXM8" >> _x >> "quickFunction"))then{
		getText(missionConfigFile >> "CfgXM8" >> _x >> "quickFunction")
	} else {format["['%1', 0] call ExileClient_gui_xm8_slide",_x]};
	_ctrl ctrlSetEventHandler ["ButtonClick", _function];
	
	_count2 = _count2 + 1;
}forEach _apps;

true