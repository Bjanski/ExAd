/*
function: XM8_VG_loadContent
file: XM8_VG\scripts\XM8_VG_loadContent.sqf

XM8 VG by Jan Babor
Part of the ExAd Virtual Garage script
*/
private ["_display","_error","_slides","_getControl","_flag","_allowedVeh","_storedVeh","_strTxtVehCntColor","_strTxtVehCnt"];

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 VG app, display is null"; systemChat _error; diag_log _error;};
_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 VG app, slides control is null"; systemChat _error; diag_log _error;};

_getControl = {
	params ["_key"]; 
	private ["_ctrl","_idc","_index","_slideClassName"]; 
	_ctrl = controlNull;
	_slideClassName = "mainVGSlide"; //Classname of your slide
	_map = XM8_VG_mainVGSlideIDCmap; //Variable name of IDC map of slide
	_index = _map find _key;
	if (_index != -1) then {
		_idc = ((getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID")) + _index);
		_ctrl = _display displayCtrl _idc;
	};
	_ctrl;
};


_flag = if(typeName ExAdCurFlagNetId == "STRING")then{objectFromNetId ExAdCurFlagNetId}else{ExAdCurFlagNetId};

_allowedVeh = ExAd_VG_MIN_ALLOWED_VEH + ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR * (_flag getVariable ["ExileTerritoryLevel", 1]);
_storedVeh = count (_flag getVariable ["ExAdVGVeh", []]);
_strTxtVehCntColor = if(_allowedVeh > _storedVeh)then{"#FFFFFF"}else{"#B22400"};

_strTxtVehCnt = "SubTitle1Cnt" call _getControl;
_strTxtVehCnt ctrlSetStructuredText parseText format ["<t size='1' align='right' color='%1'>%2/%3</t>",_strTxtVehCntColor,_storedVeh,_allowedVeh];

[(objectFromNetId ExAdCurFlagNetId) getVariable ["ExAdVGVeh", []],ctrlIDC ("StoreVehList" call _getControl)] call ExAd_fnc_fillVGList;
for "_i" from 0 to 3 do {
	_index = lbAdd[ctrlIDC ("StoreVehList" call _getControl),""];
};

[[_flag, ["Car","Air"],_flag getVariable ["ExileTerritorySize", 50]] call ExAd_fnc_getNearByLocalVeh,ctrlIDC ("NearVehicleList" call _getControl)] call ExAd_fnc_fillVGList;

("InfoCB" call _getControl) cbSetChecked ((profileNamespace getVariable["ExAd_StreamFriendlyUI",0]) == 1);