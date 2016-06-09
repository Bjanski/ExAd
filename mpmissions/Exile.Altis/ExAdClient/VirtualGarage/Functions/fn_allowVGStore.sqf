/*  
	fn_allowVGStore.sqf

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
private ["_res","_flag"];

if(isNil "ExAdCurFlagNetId")exitWith{diag_log "ExAdClient: allowVGStore - ExAdCurFlagNetId is nil";false};
_flag = objectFromNetId ExAdCurFlagNetId;

_allowedVeh = _flag call ExAd_fnc_allowedVGVeh;
_storedVeh = count (_flag getVariable ["ExAdVGVeh", []]);

_res = if(_allowedVeh > _storedVeh)then{true}else{false};

_res