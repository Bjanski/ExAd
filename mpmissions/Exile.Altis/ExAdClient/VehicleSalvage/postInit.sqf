/*  
	postInit.sqf
	
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

_path = "ExAdClient\VehicleSalvage\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "ExAd_SV_DISALLOW_DURING_COMBAT")then{ExAd_SV_DISALLOW_DURING_COMBAT = false;};
if(isNil "ExAd_SV_TIME_TAKEN_TO_SALVAGE")then{ExAd_SV_TIME_TAKEN_TO_SALVAGE = 10;};