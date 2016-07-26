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

params ["_vehObjNetId"];

_vehObj = objectFromNetId _vehObjNetId;
_vehClass = typeOf _vehObj; 
_vehPos = getPosATL _vehObj;

moveOut (driver _vehObj);
_vehObj call ExileServer_system_vehicleSaveQueue_removeVehicle;
_vehObj call ExileServer_system_simulationMonitor_removeVehicle;
deleteVehicle _vehObj;

{
	if(getText(missionConfigFile >> "CfgXM8" >> _x >> "vehicleClass") == _vehClass)exitWith{

		_lootHolder = createVehicle ["LootWeaponHolder", _vehPos, [], 0, "CAN_COLLIDE"];
		_lootHolder setDir (random 360);
		_lootHolder setPosATL _vehPos;

		{
			_amount = if(count _x > 1)then{_x select 1}else{1};
			if(_amount > 0)then{
				_itemClassName = _x select 0;
				_cargoType = _itemClassName call ExileClient_util_cargo_getType;
				switch (_cargoType) do
				{
					case 1: 	
					{ 
						if (_itemClassName isEqualTo "Exile_Item_MountainDupe") then
						{
							_lootHolder addMagazineCargoGlobal [_itemClassName, _amount]; 
						}
						else 
						{
							_lootHolder addMagazineCargoGlobal [_itemClassName, _amount]; 
						};
					};
					case 3: 	
					{ 
						_lootHolder addBackpackCargoGlobal [_itemClassName, _amount]; 
					};
					case 2: 	
					{ 
						_lootHolder addWeaponCargoGlobal [_itemClassName, _amount];
					};
					default
					{ 
						_lootHolder addItemCargoGlobal [_itemClassName, _amount]; 
					};
				};
			};
		}forEach getArray(missionConfigFile >> "CfgXM8" >> _x >> "recipe");
	};
}forEach ((missionConfigfile >> "CfgXM8") call BIS_fnc_getCfgSubClasses);

true