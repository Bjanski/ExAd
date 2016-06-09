/*  
	customize.sqf
	
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

ExAd_HACKING_MIN_PLAYERS_ONLINE = 30;			//SCALAR - Minimun allowed players online to initalize a hack.

ExAd_HACKING_ALLOWED_HACKS = 1;					//SCALAR - Simultaneous hacks allowed.

ExAd_HACKING_MAX_TIME = 1200;					//SCALAR - Time to complete a hack

ExAd_HACKING_MAX_DISTANCE = 50;					//SCALAR - Maximum distance away from the object being hack players for the hack to proceed. 

ExAd_HACKING_TERRITORY_MAX = 3;					//SCALAR - Maximun times a territory can get hacked before a new restart.

ExAd_HACKING_MARKER_COLOR = "ColorOrange";		//STRING - What color should the map marker have.

ExAd_HACKING_MARKER_TITLE = "Hacker activity";	//STRING - What title should the map marker have.

ExAd_HACKING_FAILED_HACK = 0.15;				//SCALAR - 0-1 The possability for the hack to fail once finished.

ExAd_HACKING_PLAYER_ONLINE = false;				//BOLLEAN - True if a player with build permissions for a base needs to be online for a hack to be possible.