/*  
	fn_VGLoad.sqf
	
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

private ["_objVehNetId","_objVeh","_flagNetId","_flag","_objVehId","_flagId","_data","_extDB2Message","_vehList"];

_objId = [_this,0,"",[""]] call BIS_fnc_param;
_flagNetId = [_this,1,"",[""]] call BIS_fnc_param;
_playerNetId = [_this,2,"",[""]] call BIS_fnc_param;
_flag = objectFromNetId _flagNetId;
_player = objectFromNetId _playerNetId;
_requestFrom = owner _player;

_proceed = false;
_vehList = _flag getVariable ["ExAdVGVeh", []];

{
	if((format["%1",_x select 0]) isEqualTo _objId)exitWith{
		_vehList deleteAt _forEachIndex;
		_proceed = true;
	}
}forEach _vehList;

if(!_proceed)exitWith{[_owner, "toastRequest", ["ErrorTitleAndText", ["ExAd - Virtual Garage", STR_ExAd_VG_NOTI_NOT_AVAILABLE]]] call ExileServer_system_network_send_to};

_flag setVariable ["ExAdVGVeh", _vehList, true];

_vehObj = (parseNumber _objId) call ExileServer_object_vehicle_database_load;
_extDB2Message = ["loadVehFromVG", [parseNumber _objId]] call ExileServer_util_extDB2_createMessage;
_extDB2Message call ExileServer_system_database_query_fireAndForget;

if(ExAd_VG_SHOW_ADVHINT)then{
	[["advancedHint", ["VGLoad",[_vehObj getVariable["ExileAccessCode",""]]]], _requestFrom] call ExAdServer_fnc_clientDispatch;
};

_pos = getPosATL _vehObj;
_pos set [2, (_pos select 2) + 0.1];
_vehObj setPosATL _pos;

["VirtualGarage", format["Spawned: Player - %1(%2)|Vehicle - %3(%4)|",name _player, getPlayerUID _player, typeOf _vehObj, _objId]] call ExAdServer_fnc_log;

true