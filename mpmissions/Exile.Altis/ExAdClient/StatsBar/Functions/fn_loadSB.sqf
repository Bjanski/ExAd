/*  
	fn_loadSB.sqf
	
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
private["_display"];

disableSerialization;

ExAd_SB_Dialog_Layer cutRsc ["ExAd_STATSBAR", "PLAIN", 1];
	
_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
_logoCtrl = _display displayCtrl ExAd_SB_Dialog_CtrlLogo_IDC;

if(count ExAd_SB_ICON_LOGO > 0)then{
	_logoCtrl ctrlSetText ExAd_SB_ICON_LOGO;
};

call ExAd_fnc_updateSB;

ExAd_SB_Thread = [ExAd_SB_Update_Rate, ExAd_fnc_sbThread, [], true] call ExileClient_system_thread_addtask;

true