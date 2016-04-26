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

execVM "ExAdClient\HaloParachute\customize.sqf";

[] spawn {
	while {true} do {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};
		
		ExAd_ACTION_PARACHUTE = player addaction [format["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", localize "STR_ExAd_HALOPARACHUTE_ACTIONS_PARACHUTE"], {call ExAd_fnc_pullParachute}, [], 6, true, true, "", "call ExAd_fnc_showParachute"];
		ExAd_ACTION_EJECT = player addaction [format["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", localize "STR_ExAd_HALOPARACHUTE_ACTIONS_HALO"], {call ExAd_fnc_ejectPlayer}, [], 6, false, true, "", "call ExAd_fnc_showEject;"];
		
		if(ExAd_HALOPARACHUTE_DETACH_PARACHUTE_MODE)then{
			ExAd_ACTION_PARACHUTE_DETACH = (findDisplay 46) displayAddEventHandler ["KeyDown",{
				if(call ExAd_fnc_canDetachParachute)then{
					if(_this select 1 == 45 && _this select 2 && _this select 4)then{
						call ExAd_fnc_ejectPlayer
					}			
				}
			}];
		};
		
		waitUntil{!alive player};
		player removeAction ExAd_ACTION_PARACHUTE;
		player removeAction ExAd_ACTION_EJECT;
		
		if(ExAd_HALOPARACHUTE_DETACH_PARACHUTE_MODE)then{
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", ExAd_ACTION_PARACHUTE_DETACH];
		};
	};
};