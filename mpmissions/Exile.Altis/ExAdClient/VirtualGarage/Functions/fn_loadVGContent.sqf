/*  
	fn_loadVGContent.sqf

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
private ["_display","_error","_slides","_flag","_allowedVeh","_storedVeh","_strTxtVehCntColor","_strTxtVehCnt"];

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 VG app, display is null"; systemChat _error; diag_log _error;};

_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 VG app, slides control is null"; systemChat _error; diag_log _error;};

_flag = if(typeName ExAdCurFlagNetId == "STRING")then{objectFromNetId ExAdCurFlagNetId}else{ExAdCurFlagNetId};

_allowedVeh = _flag call ExAd_fnc_allowedVGVeh;
_storedVeh = count (_flag getVariable ["ExAdVGVeh", []]);
_strTxtVehCntColor = if(_allowedVeh > _storedVeh)then{"#FFFFFF"}else{"#B22400"};

_strTxtVehCnt = [_display,"ExAd_VG","SubTitle1Cnt"] call ExAd_fnc_getAppCtrl;
_strTxtVehCnt ctrlSetStructuredText parseText format ["<t size='1' align='right' color='%1'>%2/%3</t>",_strTxtVehCntColor,_storedVeh,_allowedVeh];

[(objectFromNetId ExAdCurFlagNetId) getVariable ["ExAdVGVeh", []],ctrlIDC ([_display,"ExAd_VG","StoreVehList"] call ExAd_fnc_getAppCtrl)] call ExAd_fnc_fillVGList;
for "_i" from 0 to 3 do {
	_index = lbAdd[ctrlIDC ([_display,"ExAd_VG","StoreVehList"] call ExAd_fnc_getAppCtrl),""];
};

[[_flag, ExAd_VG_ALLOWED_VEH_TYPE,_flag getVariable ["ExileTerritorySize", 50]] call ExAd_fnc_getNearByLocalVeh,ctrlIDC ([_display,"ExAd_VG","NearVehicleList"] call ExAd_fnc_getAppCtrl)] call ExAd_fnc_fillVGList;

([_display,"ExAd_VG","InfoCB"] call ExAd_fnc_getAppCtrl) cbSetChecked ((profileNamespace getVariable["ExAd_StreamFriendlyUI",0]) == 1);

true