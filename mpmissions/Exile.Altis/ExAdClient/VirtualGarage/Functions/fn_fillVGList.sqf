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

private ["_list","_idc","_vehClass","_data","_name","_index","_pic"];

_list = _this select 0;
_idc = _this select 1;

lbClear _idc;

{
	_vehClass = if(typeName _x isEqualTo "ARRAY")then{_x select 1}else{typeOf _x};
	_data = if(typeName _x isEqualTo "ARRAY")then{format["%1",_x select 0]}else{netId _x};
	
	_name = getText(configFile >> "CfgVehicles" >> _vehClass >> "displayName");
	_index = lbAdd[_idc,_name];
	_pic = getText(configFile >> "CfgVehicles" >> _vehClass >> "picture");
	lbSetPicture [_idc, _index, _pic];
	lbSetPictureColor [_idc, _index, [1,1,1,1]];
	lbSetData [_idc, _index, _data];
	lbSetTooltip [_idc, _index, _vehClass];
}forEach _list;

true