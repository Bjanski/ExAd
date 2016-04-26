/*  
	fn_ejectPayer.sqf

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
private ["_vehicleObj", "_push", "_vecDir"];

_vehicleObj = vehicle player;
if (_vehicleObj == player) exitWith {false};

moveOut player;

_push = if (_vehicleObj isKindOf "Plane") then {
	player setDir getDir _vehicleObj;
	((vectorUp _vehicleObj) vectorMultiply 40)
} else {
		_vecDir = (getPosASL player) vectorDiff (getPosASL _vehicleObj);
		(_vecDir vectorMultiply (5 / vectorMagnitude _vecDir))
};

player setVelocity ((velocity player) vectorAdd _push);

if(ExAd_HALOPARACHUTE_SAFE_MODE)then{
	ExAd_PARACHUTE_SAFE_THREAD = [0.1, ExAd_fnc_parachuteSafeMode, [], true] call ExileClient_system_thread_addtask;
};

true