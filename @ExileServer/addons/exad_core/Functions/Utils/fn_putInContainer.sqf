/*  
	fn_putInContainer.sqf

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

private["_lootHolder","_itemClassName","_cargoType","_magazineClassNames","_magazineClassName","_numberOfMagazines"];

_lootHolder = _this select 0;
_itemClassName = _this select 1;

_cargoType = _itemClassName call ExileClient_util_cargo_getType;

switch (_cargoType) do {
	case 1: 	
	{ 
		if (_itemClassName isEqualTo "Exile_Item_MountainDupe") then
		{
			_lootHolder addMagazineCargoGlobal [_itemClassName, 2]; 
		}
		else 
		{
			_lootHolder addMagazineCargoGlobal [_itemClassName, 1]; 
		};
	};
	case 3: 	
	{ 
		_lootHolder addBackpackCargoGlobal [_itemClassName, 1]; 
	};
	case 2: 	
	{ 
		_lootHolder addWeaponCargoGlobal [_itemClassName, 1]; 
		if (_itemClassName != "Exile_Melee_Axe") then
		{
			_magazineClassNames = getArray(configFile >> "CfgWeapons" >> _itemClassName >> "magazines");
			if (count(_magazineClassNames) > 0) then
			{
				_magazineClassName = _magazineClassNames select (floor(random (count _magazineClassNames)));
				_numberOfMagazines = 1 + floor(random 3); 
				_lootHolder addMagazineCargoGlobal [_magazineClassName, _numberOfMagazines];
			};
		};
	};
	default { _lootHolder addItemCargoGlobal [_itemClassName,1]; };
};

true