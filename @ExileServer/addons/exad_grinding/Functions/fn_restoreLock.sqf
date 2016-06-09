/*  
	fn_restoreLock.sqf

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

private ["_object","_databaseID"];

_object = objectFromNetId ([_this, 0, "",[""]] call BIS_fnc_param);

if(isNull _object)exitWith{false};

_object setVariable ["ExAd_Grinding_progress", 0, true];

["Grinding", format["Lock restored: Territory ID - %1|Object ID - %2", _object setVariable ["ExileTerritoryID", -1], _object getVariable ["ExileDatabaseID",0]]] call ExAdServer_fnc_log;

true