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

execVM "ExAdClient\Grinding\customize.sqf";

if(isNil "ExAd_GRINDING_PROGRESS_INTERVALL")then{ExAd_GRINDING_PROGRESS_INTERVALL = 60;};
if(isNil "ExAd_GRINDING_PROGRESS")then{ExAd_GRINDING_PROGRESS = 30;};
if(isNil "ExAd_GRINDING_OBJECT_MAX")then{ExAd_GRINDING_OBJECT_MAX = 900;};

ExAd_GRINDING = false;

STR_ExAd_GRINDING_NOTI_BROKE = if(isLocalized "STR_ExAd_GRINDING_NOTI_BROKE")then{localize "STR_ExAd_GRINDING_NOTI_BROKE"}else{"Your grinder broke, get a new one before you can continue."};

STR_ExAd_GRINDING_NOTI_EMPTY_BAT = if(isLocalized "STR_ExAd_GRINDING_NOTI_EMPTY_BAT")then{localize "STR_ExAd_GRINDING_NOTI_EMPTY_BAT"}else{"Find some batteries to get the grinder to work."};

STR_ExAd_GRINDING_NOTI_PROGRESS = if(isLocalized "STR_ExAd_GRINDING_NOTI_PROGRESS")then{localize "STR_ExAd_GRINDING_NOTI_PROGRESS"}else{"Your grinder broke, get a new one before you can continue."};

STR_ExAd_GRINDING_NOTI_FINISHED = if(isLocalized "STR_ExAd_GRINDING_NOTI_FINISHED")then{localize "STR_ExAd_GRINDING_NOTI_FINISHED"}else{"You have broken the code lock."};

STR_ExAd_GRINDING_NOTI_RESTORED = if(isLocalized "STR_ExAd_GRINDING_NOTI_RESTORED")then{localize "STR_ExAd_GRINDING_NOTI_RESTORED"}else{"You've changed the look"};

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