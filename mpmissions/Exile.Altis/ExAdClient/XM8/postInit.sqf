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

_path = "ExAdClient\XM8\customize.sqf";
call compile preprocessFileLineNumbers _path;

{
	if(isText(missionConfigFile >> "CfgXM8" >> _x >> "onOpen"))then{
		_code = compileFinal (preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "onOpen"));                    
		missionNamespace setVariable [format["ExileClient_gui_xm8_slide_%1_onOpen",_x], _code];
	};
	
	if(isText(missionConfigFile >> "CfgXM8" >> _x >> "onClose"))then{
		_code = compileFinal (preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "onClose"));                    
		missionNamespace setVariable [format["ExileClient_gui_xm8_slide_%1_onClose",_x], _code];
	};
	
	if(isText(missionConfigFile >> "CfgXM8" >> _x >> "config"))then{
		call compileFinal (preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "config"));
	};
}forEach (getArray(missionConfigFile >> "CfgXM8" >> "extraApps"));