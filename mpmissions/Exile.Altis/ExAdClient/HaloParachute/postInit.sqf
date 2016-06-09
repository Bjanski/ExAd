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

_path = "ExAdClient\HaloParachute\customize.sqf";
call compile preprocessFileLineNumbers _path;


if(isNil "ExAd_HALOPARACHUTE_SAFE_MODE")then{ExAd_HALOPARACHUTE_SAFE_MODE = false;};
if(isNil "ExAd_HALOPARACHUTE_USE_ACTIONS")then{ExAd_HALOPARACHUTE_USE_ACTIONS = true;};
if(isNil "ExAd_HALOPARACHUTE_USE_KEY_ACTIONS")then{ExAd_HALOPARACHUTE_USE_KEY_ACTIONS = true;};
if(isNil "ExAd_ACTION_PARACHUTE_HEIGHT")then{ExAd_ACTION_PARACHUTE_HEIGHT = 10;};
if(isNil "ExAd_ACTION_EJECT_HEIGHT")then{ExAd_ACTION_EJECT_HEIGHT = 0;};

[] spawn {
	while {true} do {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};
		
		if(ExAd_HALOPARACHUTE_USE_ACTIONS)then{
			ExAd_ACTION_PARACHUTE = player addaction [format["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", localize "STR_ExAd_HALOPARACHUTE_ACTIONS_PARACHUTE"], {[] spawn ExAd_fnc_pullParachute}, [], 6, true, true, "", "call ExAd_fnc_showParachute"];
			ExAd_ACTION_EJECT = player addaction [format["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", localize "STR_ExAd_HALOPARACHUTE_ACTIONS_HALO"], {call ExAd_fnc_ejectPlayer}, [], 6, false, true, "", "call ExAd_fnc_showEject;"];
		};
		
		if(ExAd_HALOPARACHUTE_USE_KEY_ACTIONS)then{
			ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS = (findDisplay 46) displayAddEventHandler ["KeyDown",{
				if(_this select 1 == 45 && _this select 2 && _this select 4)then{
					if((getPos player) select 2 > ExAd_ACTION_EJECT_HEIGHT && vehicle player != player)then{
						call ExAd_fnc_ejectPlayer
					}else{
						if(call ExAd_fnc_showParachute)then{
							[] spawn ExAd_fnc_pullParachute
						}
					}
				}
			}];
		};
		
		waitUntil{!alive player};
		if(ExAd_HALOPARACHUTE_USE_ACTIONS)then{
			player removeAction ExAd_ACTION_PARACHUTE;
			player removeAction ExAd_ACTION_EJECT;
		};
		
		if(ExAd_HALOPARACHUTE_USE_KEY_ACTIONS)then{
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS];
		};
	};
};