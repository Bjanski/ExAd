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

_path = "ExAdClient\Grinding\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "ExAd_GRINDING_PROGRESS_INTERVALL")then{ExAd_GRINDING_PROGRESS_INTERVALL = 60;};
if(isNil "ExAd_GRINDING_PROGRESS")then{ExAd_GRINDING_PROGRESS = 30;};
if(isNil "ExAd_GRINDING_OBJECT_MAX")then{ExAd_GRINDING_OBJECT_MAX = 900;};

ExAd_GRINDING = false;

["STR_ExAd_GRINDING_NOTI_BROKE", "Your grinder broke, get a new one before you can continue."] call ExAd_fnc_localize;
["STR_ExAd_GRINDING_NOTI_EMPTY_BAT", "Find some batteries to get the grinder to work."] call ExAd_fnc_localize;
["STR_ExAd_GRINDING_NOTI_PROGRESS", "Your grinder broke, get a new one before you can continue."] call ExAd_fnc_localize;
["STR_ExAd_GRINDING_NOTI_FINISHED", "You have broken the code lock."] call ExAd_fnc_localize;
["STR_ExAd_GRINDING_NOTI_RESTORED", "You've changed the look"] call ExAd_fnc_localize;

ExAd_GRINDING_PROGRESSBAR_POS = if!(isNil "ExAd_GRINDING_PROGRESSBAR_POS")then{
	if(typeName ExAd_GRINDING_PROGRESSBAR_POS isEqualTo "SCALAR")then{
		((2 min ExAd_GRINDING_PROGRESSBAR_POS) max 0.3)
	}else{
		if(typeName ExAd_GRINDING_PROGRESSBAR_POS isEqualTo "STRING")then{
			switch (toLower ExAd_GRINDING_PROGRESSBAR_POS) do {
				case "low": {0.3}; 
				case "mid": {1}; 
				case "high": {1.8};
				default {1};
			}
		} else {1}
	}
}else{1};