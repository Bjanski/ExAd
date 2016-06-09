/*	
	XM8 VG app by Jan Babor
	
	file: XM8_emptyApp\XM8_emptyApp_config.sqf
	function: no function
	
	This is configuration file for VG app.
*/

XM8_VG_elChanged = {
	params ["_listCtrl","_picCtrl","_strCtrl","_ref","_data","_pic"];
	
	_ref = _listCtrl lbData (lbCurSel _listCtrl);
	_data = {if(str (_x select 0) == _ref)exitWith{_x}}forEach ((objectFromNetId ExAdCurFlagNetId) getVariable["ExAdVGVeh",[]]);
	if(!isNil "_data")then{
		_pic = getText(configFile >> "CfgVehicles" >> (_data select 1) >> "picture");
		ctrlSetText [_picCtrl, _pic];
		["requestVGDetailInfo", [_ref, ExAdCurFlagNetId, (profileNamespace getVariable["ExAd_StreamFriendlyUI",0]), netId player, _strCtrl]] call ExAd_fnc_serverDispatch;
	}else{
		ctrlSetText [_picCtrl, ""];
		["",_strCtrl] call ExAd_fnc_loadVGDetailView;
	}
};