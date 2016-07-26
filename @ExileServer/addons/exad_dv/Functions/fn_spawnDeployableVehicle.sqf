/*  
	fn_createMarker.sqf

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

params ["_playerNetId","_configClass","_player","_spawnPos","_spawnDir","_usePositionATL","_vehObj"];

_player = objectFromNetId _playerNetId;

_spawnPos = _player modelToWorld [0,2,0];
_spawnDir = direction _player;
_usePositionATL = true;

_vehicleClass = getText(missionConfigFile >> "CfgXM8" >> _configClass >> "vehicleClass");

_vehObj = [_vehicleClass, _spawnPos, _spawnDir, _usePositionATL] call ExileServer_object_vehicle_createNonPersistentVehicle;

if( getNumber(missionConfigFile >> "CfgXM8" >> _configClass >> "packable") > 0 ) then {
	_vehObj setVariable ["ExAd_DV_Packable", true, true];
};

if( getNumber(missionConfigFile >> "CfgXM8" >> _configClass >> "autoCleanUp") > 0 ) then {
	[_vehObj] spawn {
		private ["_wait","_tick", "_vehObj","_driver"];
		_wait = true;
		_tick = 0;
		_vehObj = [_this,0,objNull] call BIS_fnc_param;
		
		while {_wait} do {
			UISleep 1;
			if(isNull _vehObj)exitWith{_wait = false};
			
			_driver = driver _vehObj;
			if(isNull _driver)then{
				_tick = _tick + 1;
			}else{
				_tick = 0;
			};

			if(_tick >= ExAd_DV_DESPAWN_IDLE_TIME)exitWith{_wait = false};
		};

		moveOut (driver _vehObj);
		_vehObj call ExileServer_system_vehicleSaveQueue_removeVehicle;
		_vehObj call ExileServer_system_simulationMonitor_removeVehicle;
		deleteVehicle _vehObj;
		
	};
};

true