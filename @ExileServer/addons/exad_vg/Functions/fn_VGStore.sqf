/*  
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

private ["_objVehNetId","_objVeh","_flagNetId","_flag","_owner","_objVehId","_flagId","_data","_extDB2Message","_vehList"];

_objVehNetId = [_this,0,"",[""]] call BIS_fnc_param;
_objVeh = objectFromNetId _objVehNetId;
_flagNetId = [_this,1,"",[""]] call BIS_fnc_param;
_flag = objectFromNetId _flagNetId;
_owner = owner _objVeh;
_player = {if(owner _x == _owner)exitWith{_x}}forEach playableUnits;

if!(_objVeh getVariable ["ExileIsPersistent", false])exitWith{[_owner, "toastRequest", ["ErrorTitleAndText", ["ExAd - Virtual Garage", STR_ExAd_VG_NOTI_NOT_PERSISTENT]]] call ExileServer_system_network_send_to;false};

if!(_objVeh setOwner 2)exitWith{format["Get out of the vehicle before storing it."] remoteExec ["hint", _owner]; false};

if!(isNil "ExAd_VG_CLEAN_ON_STORE")then{
	if(ExAd_VG_CLEAN_ON_STORE)then{
		clearBackpackCargoGlobal _objVeh;
		clearItemCargoGlobal _objVeh;
		clearMagazineCargoGlobal _objVeh;
		clearWeaponCargoGlobal _objVeh;
		_objVeh setVariable ["ExileMoney", 0, true];
	}
};

_objVeh call ExileServer_object_vehicle_database_update;

_objVehId = _objVeh getVariable ["ExileDatabaseID",-1];
_flagId = _flag getVariable ["ExileDatabaseID", -1];

if(_objVehId > -1 && _flagId > -1)then{
	["VirtualGarage", format["Store: Player - %1(%2)|Vehicle - %3(%4)|Reset gear - %5",name _player, getPlayerUID _player, typeOf _objVeh, _objVehId, str ExAd_VG_CLEAN_ON_STORE]] call ExAdServer_fnc_log;
	
	_data = [_flagId, _objVehId];

	_extDB2Message = ["loadVehToVG", _data] call ExileServer_util_extDB2_createMessage;
	_extDB2Message call ExileServer_system_database_query_fireAndForget;

	_objVeh call ExileServer_system_vehicleSaveQueue_removeVehicle;
	_objVeh call ExileServer_system_simulationMonitor_removeVehicle;
	deleteVehicle _objVeh;
	
	_vehList = _flag getVariable ["ExAdVGVeh", []];
	_vehList pushBack [_objVehId, typeOf _objVeh];
	_flag setVariable ["ExAdVGVeh", _vehList, true];
	
	if(ExAd_VG_SHOW_ADVHINT)then{
		[["advancedHint", ["VGStore",[]]], _owner] call ExAdServer_fnc_clientDispatch;
	};
};

true