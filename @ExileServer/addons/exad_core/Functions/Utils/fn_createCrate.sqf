/*
	fn_createCrate.sqf
  
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

private["_pos","_list","_crateType","_crate"];

_pos = [_this,0,[0,0,0]] call BIS_fnc_param;
_list = [_this,1,[]] call BIS_fnc_param;
_crateType = [_this,2,"Box_IND_AmmoVeh_F"] call BIS_fnc_param;

_crate = _crateType createVehicle _pos;
clearBackpackCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

{
	_crate addItemCargoGlobal [_x select 0,_x select 1]
}forEach _list;

_crate