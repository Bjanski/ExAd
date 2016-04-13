/*
	fn_clientDispatch.sqf
  
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

private ["_params","_recipents"];

_params = [_this,0,nil] call BIS_fnc_param;
_recipents = [_this,1,-2,[0]] call BIS_fnc_param;
_jip = [_this,2,false] call BIS_fnc_param;

if(isNil "_params")exitWith{false};

_resString = _params remoteExec ["ExAd_fnc_incomingRequest",_recipents,_jip];

_resString