/*  
	fn_createExtraApps.sqf

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
private["_apps","_display"];

_apps = getArray(missionConfigFile >> "CfgXM8" >> "extraApps");
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

{
	call compile format["ExAd_XM8_MAP_%1 = [];",_x];
	
	if(isClass(missionConfigFile >> "CfgXM8" >> _x))then{
		_idc = getNumber(missionConfigFile >> "CfgXM8" >> _x >> "controlID");
		_slide = _display ctrlCreate ["RscExileXM8Slide",_idc, _display displayCtrl 4007];
		[_display, _slide, _idc]call compile preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "onLoad");
		_slide ctrlShow false;
	}	
}forEach _apps;

true