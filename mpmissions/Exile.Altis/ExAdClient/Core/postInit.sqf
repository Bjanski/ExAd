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

_path = "ExAdClient\Core\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "ExAd_Debug")then{ExAd_Debug = true;};
if(isNil "ExAd_Logging")then{ExAd_Logging = true;};
if(isDedicated)then{
	if(!isClass(ConfigFile >> "CfgPatches" >> "a3_infiSTAR_Exile"))then{
		ExAd_Logging = false;
		["Core/postInit","Server can't find InfiStar addon"] call ExAd_fnc_debugHandler
	}
};
if(isNil "ExAd_Log_Folder")then{ExAd_Log_Folder = "ExAd_Logs";};

if(isNil "ExAd_Hint_Title_Color")then{ExAd_Hint_Title_Color = "#E48A36";};
if(isNil "ExAd_Hint_Title_Size")then{ExAd_Hint_Title_Size = 1.5;};
if(isNil "ExAd_Hint_Title_Font")then{ExAd_Hint_Title_Font = "TahomaB";};

if(isNil "ExAd_Hint_Msg_Color")then{ExAd_Hint_Msg_Color = "#ffffff";};
if(isNil "ExAd_Hint_Msg_Size")then{ExAd_Hint_Msg_Size = 1;};
if(isNil "ExAd_Hint_Msg_Font")then{ExAd_Hint_Msg_Font = "TahomaB";};