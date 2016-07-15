/*  
	fn_onBtnClickVG.sqf

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

private ["_fnc","_idc","_data"];

_fnc = [_this,0,nil] call BIS_fnc_param;
_idc = [_this,1,nil] call BIS_fnc_param;

if(isNil "ExAdCurFlagNetId" || isNil "_fnc" || isNil "_idc")exitWith{
	disableUserInput false;
	["extraApps", 1] call ExileClient_gui_xm8_slide;
	false
};

_data = lbData [_idc, lbCurSel _idc];

if(count _data == 0)then{
	["ErrorTitleAndText", ["ExAd - Virtual Garage", "You have to choose a vehicle in the proper list!!"]] call ExileClient_gui_toaster_addTemplateToast;
}else{
	[_fnc, [_data, ExAdCurFlagNetId, netId player]] call ExAd_fnc_serverDispatch;
	closeDialog 0;
};
disableUserInput false;

true