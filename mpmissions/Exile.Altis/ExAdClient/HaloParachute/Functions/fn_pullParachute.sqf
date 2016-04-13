/*
	fn_pullParachute.sqf
  
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

private ["_parachuteObject"];

waitUntil {sleep 0.1; {player distance _x < 10 max (sizeOf typeOf _x)} count (player nearEntities ["Helicopter_Base_F", 20]) == 0};

if (!alive player || vehicle player != player) exitWith {};

_parachuteObject = createVehicle ["Steerable_Parachute_F", getPosATL player, [], 0, "CAN_COLLIDE"];
_parachuteObject setDir getDir player;

_parachuteObject disableCollisionWith player;

player action ["GetinDriver", _parachuteObject];
player switchmove "";
player switchmove "HaloFreeFall_non"; 
player setVelocity [(sin (getDir player)) * 50, (cos (getDir player)) * 50, -5];
ExileJobParachuteFix = [0.25, ExileClient_object_player_parachuteFix, [], true] call ExileClient_system_thread_addtask;

true